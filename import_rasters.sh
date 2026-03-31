### IMPORT NLCD RASTERS

r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1987_CU_C1V1\Annual_NLCD_LndCov_1987_CU_C1V1.tif output=landuse_1987 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1988_CU_C1V1\Annual_NLCD_LndCov_1988_CU_C1V1.tif output=landuse_1988 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1989_CU_C1V1\Annual_NLCD_LndCov_1989_CU_C1V1.tif output=landuse_1989 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1990_CU_C1V1\Annual_NLCD_LndCov_1990_CU_C1V1.tif output=landuse_1990 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1991_CU_C1V1\Annual_NLCD_LndCov_1991_CU_C1V1.tif output=landuse_1991 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1992_CU_C1V1\Annual_NLCD_LndCov_1992_CU_C1V1.tif output=landuse_1992 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1993_CU_C1V1\Annual_NLCD_LndCov_1993_CU_C1V1.tif output=landuse_1993 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1994_CU_C1V1\Annual_NLCD_LndCov_1994_CU_C1V1.tif output=landuse_1994 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1995_CU_C1V1\Annual_NLCD_LndCov_1995_CU_C1V1.tif output=landuse_1995 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1996_CU_C1V1\Annual_NLCD_LndCov_1996_CU_C1V1.tif output=landuse_1996 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1997_CU_C1V1\Annual_NLCD_LndCov_1997_CU_C1V1.tif output=landuse_1997 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1998_CU_C1V1\Annual_NLCD_LndCov_1998_CU_C1V1.tif output=landuse_1998 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_1999_CU_C1V1\Annual_NLCD_LndCov_1999_CU_C1V1.tif output=landuse_1999 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_2000_CU_C1V1\Annual_NLCD_LndCov_2000_CU_C1V1.tif output=landuse_2000 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_2001_CU_C1V1\Annual_NLCD_LndCov_2001_CU_C1V1.tif output=landuse_2001 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_2002_CU_C1V1\Annual_NLCD_LndCov_2002_CU_C1V1.tif output=landuse_2002 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_2003_CU_C1V1\Annual_NLCD_LndCov_2003_CU_C1V1.tif output=landuse_2003 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_2004_CU_C1V1\Annual_NLCD_LndCov_2004_CU_C1V1.tif output=landuse_2004 extent=region &
r.import input=D:\nlcd_annual_data\Annual_NLCD_LndCov_2005_CU_C1V1\Annual_NLCD_LndCov_2005_CU_C1V1.tif output=landuse_2005 extent=region

#### EXPORT BINARY RASTERS

r.out.gdal input=ssp5_run1_bin@EBCI output=D:\FUTURES\futures_outputs\ssp5_run1_bin.tif format=GTiff &
r.out.gdal input=ssp5_run2_bin@EBCI output=D:\FUTURES\futures_outputs\ssp5_run2_bin.tif format=GTiff &
r.out.gdal input=ssp5_run3_bin@EBCI output=D:\FUTURES\futures_outputs\ssp5_run3_bin.tif format=GTiff &
r.out.gdal input=ssp5_run4_bin@EBCI output=D:\FUTURES\futures_outputs\ssp5_run4_bin.tif format=GTiff &
r.out.gdal input=ssp5_run5_bin@EBCI output=D:\FUTURES\futures_outputs\ssp5_run5_bin.tif format=GTiff &
r.out.gdal input=ssp5_run6_bin@EBCI output=D:\FUTURES\futures_outputs\ssp5_run6_bin.tif format=GTiff &
r.out.gdal input=ssp5_run7_bin@EBCI output=D:\FUTURES\futures_outputs\ssp5_run7_bin.tif format=GTiff &
r.out.gdal input=ssp5_run8_bin@EBCI output=D:\FUTURES\futures_outputs\ssp5_run8_bin.tif format=GTiff &
r.out.gdal input=ssp5_run9_bin@EBCI output=D:\FUTURES\futures_outputs\ssp5_run9_bin.tif format=GTiff


#### EXPORT time series for a county ####

r.out.gdal input=ssp5_fin_run24_01@EBCI output=D:\FUTURES\futures_outputs\ssp5_run24_2025_buncombe.tif format=GTiff &
r.out.gdal input=ssp5_fin_run24_02@EBCI output=D:\FUTURES\futures_outputs\ssp5_run24_2026_buncombe.tif format=GTiff &
r.out.gdal input=ssp5_fin_run24_03@EBCI output=D:\FUTURES\futures_outputs\ssp5_run24_2027_buncombe.tif format=GTiff &
r.out.gdal input=ssp5_fin_run24_04@EBCI output=D:\FUTURES\futures_outputs\ssp5_run24_2028_buncombe.tif format=GTiff &
r.out.gdal input=ssp5_fin_run24_05@EBCI output=D:\FUTURES\futures_outputs\ssp5_run24_2029_buncombe.tif format=GTiff &
...
