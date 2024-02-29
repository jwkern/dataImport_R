___________________________________________________________________________________________________________________________________________________________________
___________________________________________________________________________________________________________________________________________________________________
___________________________________________________________________________________________________________________________________________________________________
# dataImport_R

___________________________________________________________________________________________________________________________________________________________________
GENERAL DESCRIPTION:
This R script imports data and model arrays from .csv files. 

___________________________________________________________________________________________________________________________________________________________________
DATA DESCRIPTION:
In this example, the data are NASA telescope data of an accretion disk, and has already been cleaned, reduced, analyzed, and modeled. The two data frames are thus the empirical data (dataFrame) and the model data (modelFrame).  

___________________________________________________________________________________________________________________________________________________________________
CODE DESCRIPTION:
This R code (dataImport_JWK.R) imports the spectrum of GV Tau North (gvtau_spec.csv) and its synthetic spectrum (gvtau_model.csv) in order to plot the arrays and calculate the reduced chi-squared as a goodness of fit. 

___________________________________________________________________________________________________________________________________________________________________
RUNNING THE CODE:
1) Download the diabetes data (diabetic_data.csv) and the SQL script (dataImport_JWK.sql)

2) In a terminal, cd into the directory that now contains the data and the script

3) In dataImport_JWK.sql, change the file path on line 69 from "/home/jwkern/Downloads/" to point to your local directory containing diabetic_data.csv

4) Run the script by typing the following into the command line:

            mysql --local-infile=1 -u username -p password < dataImport_JWK.sql

(P.S. don't forget to change the username and password to your mySQL credentials)

4.1) If you wish to save the output in a .txt file, instead run the script as:
      
            mysql --local-infile=1 -u username -p password < dataImport_JWK.sql > output.txt


___________________________________________________________________________________________________________________________________________________________________
___________________________________________________________________________________________________________________________________________________________________
___________________________________________________________________________________________________________________________________________________________________
