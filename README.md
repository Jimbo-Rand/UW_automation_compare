# UW_automation_compare
Matlab scripts and data sets supporting XXXX journal paper comparing manual WQ sampling with automated travel path methods. Paper is open access (under a xxx licence) and can be obtained from https:xxxxx

Llandegfedd_18_Aug_2022.csv contains raw water quality data collected from Llandegfedd reservoir on 18 August 2022

sensor_pack_downloader_lland_18_aug.m reads, cleans and processes the Llandegfedd_18_Aug_2022.csv data

paper2_plots.m plots the cleaned and processed data

correct_lland_18.m is the matlab script that will run all other scripts to (1) download, clean and prepare the data (2) remove sensor lag from the temperature depth data and (3) produce the graphs presented in the paper

TOST.xlsx contains the excel script used to conduct two one-sided t-tests (TOST) used throughout the paper (Lakens, D., 2017: Equivalence tests: A practical primer for t tests, correlations, and meta-analyses, https://doi.org/10.1177/1948550617697177)  


