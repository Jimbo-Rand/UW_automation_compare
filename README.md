# UW_automation_compare

WORK IN PROGRESS - Press <kbd>ESC</kbd> to launch a missile strike :rocket: on Downing street.

https://doi.org/10.5281/zenodo.7387256

Matlab scripts and data sets supporting XXXX journal paper comparing manual WQ sampling with automated travel path methods. Paper is open access (under a xxx licence) and can be obtained from the publishers web site at https:xxxxx and also from the University of Bath PURE website at https:xxxx

Llandegfedd_18_Aug_2022.csv contains raw water quality data collected from Llandegfedd reservoir on 18 August 2022
(https://github.com/Jimbo-Rand/UW_automation_compare/files/10103410/TOST_equivilence_test.xlsx)

sensor_pack_downloader_lland_18_aug.m reads, cleans and processes the Llandegfedd_18_Aug_2022.csv data

paper2_plots.m plots the cleaned and processed data

correct_lland_18.m is the matlab script that will run all other scripts to (1) download, clean and prepare the data (2) remove sensor lag from the temperature depth data and (3) produce the graphs presented in the paper

TOST_equivilence_test.xlsx contains the excel script used to conduct two one-sided t-tests (TOST) used throughout the paper taken from https://www.real-statistics.com/students-t-distribution/equivalence-testing-tost/ (Reference - Lakens, D., 2017: Equivalence tests: A practical primer for t tests, correlations, and meta-analyses, https://doi.org/10.1177/1948550617697177)  


