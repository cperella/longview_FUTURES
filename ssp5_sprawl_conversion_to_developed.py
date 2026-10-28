### this script creates a final land-cover raster for each simulation run, assigns new development to category 22 (low-density development), counts forest, agriculture, and developed cells, and summarizes the mean and std across all 50 runs for SSP5 sprawl scenario
import csv
import numpy as np
import grass.script as gs

# --------------------------------------------------
# SETTINGS
# --------------------------------------------------

baseline = "landuse_2024@annual_NLCD"
scenario = "ssp5_sprawl_fin_run"
mapset = "EBCI"
runs = range(1, 51)

developed_category = 22
output_csv = "ssp5_sprawl_landcover_summary.csv"

# Use the SSP5 grid for all calculations
gs.run_command(
    "g.region",
    raster="ssp5_sprawl_fin_run1@annual_NLCD"
)

# Cell area in hectares
region = gs.parse_command("g.region", flags="g")
cell_area_ha = (
    float(region["nsres"]) *
    float(region["ewres"]) / 10000
)

# --------------------------------------------------
# PROCESS SIMULATION RUNS
# --------------------------------------------------

results = []

for run in runs:
    sim = f"{scenario}{run}@{mapset}"
    output = f"{scenario}{run}_landcover_final"

    print(f"Processing {sim} ({run}/50)")

    # Assign new development to category 22
    gs.mapcalc(
        f"{output} = if({sim} >= 1 && {sim} <= 75, "
        f"{developed_category}, {baseline})",
        overwrite=True
    )

    # Get category and cell counts
    stats = gs.read_command(
        "r.stats",
        flags="cn",
        input=output,
        separator="space"
    )

    counts = {
        "forest": 0,
        "agriculture": 0,
        "other": 0,
        "developed": 0
    }

    for line in stats.strip().splitlines():
        parts = line.split()

        if len(parts) != 2:
            continue

        cat, cells = map(int, parts)

        if 21 <= cat <= 24:
            counts["developed"] += cells
        elif cat in (81, 82):
            counts["agriculture"] += cells
        elif 41 <= cat <= 43:
            counts["forest"] += cells
        else:
            counts["other"] += cells

    # Store cell counts and area for each run
    row = {"run": run}

    for group, cells in counts.items():
        row[f"{group}_cells"] = cells
        row[f"{group}_ha"] = cells * cell_area_ha

    results.append(row)

# --------------------------------------------------
# SUMMARIZE ACROSS RUNS
# --------------------------------------------------

groups = ["forest", "agriculture", "other", "developed"]

summary = []

for group in groups:
    cells = np.array(
        [row[f"{group}_cells"] for row in results],
        dtype=float
    )
    hectares = np.array(
        [row[f"{group}_ha"] for row in results],
        dtype=float
    )

    summary.append({
        "landcover_group": group,
        "mean_cells": np.mean(cells),
        "sd_cells": np.std(cells),
        "mean_hectares": np.mean(hectares),
        "sd_hectares": np.std(hectares)
    })

# --------------------------------------------------
# SAVE RESULTS
# --------------------------------------------------

with open(output_csv, "w", newline="") as f:
    writer = csv.DictWriter(
        f,
        fieldnames=results[0].keys()
    )
    writer.writeheader()
    writer.writerows(results)

summary_csv = "ssp5_sprawl_landcover_summary_stats.csv"

with open(summary_csv, "w", newline="") as f:
    writer = csv.DictWriter(
        f,
        fieldnames=summary[0].keys()
    )
    writer.writeheader()
    writer.writerows(summary)

print("\nMean +/- standard deviation across 50 runs:")

for row in summary:
    print(
        f"{row['landcover_group']}: "
        f"{row['mean_hectares']:,.2f} +/- "
        f"{row['sd_hectares']:,.2f} ha"
    )

print(f"\nPer-run results saved to: {output_csv}")
print(f"Summary statistics saved to: {summary_csv}")


### to run this in Python shell in GRASS:
### exec(open(r"D:\FUTURES\ssp5_sprawl_conversion_to_developed.py").read())
