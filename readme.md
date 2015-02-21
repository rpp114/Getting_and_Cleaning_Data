

Read me for R-programming 011

Three dimensional gyro information was transformed from raw data to a tidy data set. 

The original information was found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

with further information concerning the data here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data was transformed and summarized using the run_analysis.R script that is also in this depository.  The script
requires the working directory to be set to the directory where the downloaded .zip file from above was extracted.

The script also requires installation of the packages dplyr and tidyr.  These can be downloaded directly through R
by the install.packages(XXXX) syntax.

The output file will be placed in the ../getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/ 
directory and will be named: 'output_data_set.txt'

#--- 

All original by rpputt