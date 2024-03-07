___________________________________________________________________________________________________________________________________________________________________
___________________________________________________________________________________________________________________________________________________________________
___________________________________________________________________________________________________________________________________________________________________
# dataImport_R

___________________________________________________________________________________________________________________________________________________________________
GENERAL DESCRIPTION:
 This R script imports data and model arrays from .csv files, plots them using ggplot2, and then calculates the reduced chi-squared value. 

___________________________________________________________________________________________________________________________________________________________________
DATA DESCRIPTION:
In this example, the data are NASA telescope data of an accretion disk, and has already been cleaned, reduced, analyzed, and modeled using custom IDL software. 
The two data frames are thus the empirical data (dataFrame) and the model data (modelFrame).  

___________________________________________________________________________________________________________________________________________________________________
CODE DESCRIPTION:
This R code (dataImport_JWK.r) imports the spectrum of GV Tau North (gvtau_spec.csv) and its synthetic spectrum (gvtau_model.csv) in order to plot the arrays and 
calculate the reduced chi-squared as a goodness of fit. 

!WARNING!: Reducing the model size to match the length of the empirical data is a HUGE time sink in the code. It is not necessary for most data sets, so the code 
can be modified to skip or remove it. 

___________________________________________________________________________________________________________________________________________________________________
RUNNING THE CODE:
1) Download the spectral data (gvtau_spec.csv and gvtau_model.csv) and the R script (dataImport_JWK.r)

2) In a terminal, cd into the directory that now contains the data and the script

3) In dataImport_JWK.r, change the file path on line 13 and 16 from "/home/jwkern/..." to point to your local directory containing the .csv files

4) Run the script in R Studio by either:
4.1) Opening the file dataImport_JWK.r and clicking the "Source" button in the top right corner of the window
4.2) Highlighting all of the code and clicking "Run"
   or
4.3) using the console window and command line to type:

            source("~/R/General/dataImport_JWK.r")
   
   P.S. change the source string to the directory path containing the R script on your local machine

___________________________________________________________________________________________________________________________________________________________________
___________________________________________________________________________________________________________________________________________________________________
___________________________________________________________________________________________________________________________________________________________________
