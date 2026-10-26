#!/bin/sh
# my first script, 
# 10/26/26 - script for renaming files that were accidentally named "sprawl" instead of "infill"

import grass.script as gs

mapset = "annual_NLCD"
renamed = 0
skipped = 0

print("Starting raster renaming...")

for run in range(1, 51):

    names = [
        (f"ssp1_sprawl_fin_run{run}",
         f"ssp1_infill_fin_run{run}")
    ]

    names.extend(
        (
            f"ssp1_sprawl_fin_run{run}_{timestep:02d}",
            f"ssp1_infill_fin_run{run}_{timestep:02d}"
        )
        for timestep in range(1, 76)
    )

    for old, new in names:

        source = gs.find_file(
            old, element="cell", mapset=mapset
        )

        destination = gs.find_file(
            new, element="cell", mapset=mapset
        )

        if not source["name"]:
            skipped += 1
            continue

        if destination["name"]:
            print(f"SKIPPED: destination exists: {new}")
            skipped += 1
            continue

        gs.run_command(
            "g.rename",
            raster=f"{old},{new}"
        )

        renamed += 1

    if run % 10 == 0:
        print(
            f"Checked runs 1-{run}; "
            f"renamed {renamed} rasters; skipped {skipped}"
        )

print(f"Finished. Renamed: {renamed}; skipped: {skipped}")

### to run this in Python shell in GRASS:
### exec(open(r"D:\FUTURES\rename_ssp1_script.sh").read())
