CodeBook for R-Programming 011

#---  Original Data:

Original data came from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

More information on the data collection can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 



#---  Variables in tidy data output set & Definitions:

subject <- subject of the experiment, 1 number for each test subject
activity_name <- name of the activity undertaken to get the gyro data
measure <- name of the measurement taken from the gyro
axis <- axis in three dimensions that the reading was taken.  x, y, z.  Measures with no spacial realations have"" as axis.
mean <- mean of the mean of the measures for each reading, across the test and training data sets 
std_mean <- mean of the standard deviation of the measures for each reading, across the test and training data sets


#---  Operations taken to tidy data:

- load X-train in with read.table
- load in features with read.table
- name columns with features table
- find only columns with mean() or std() in them using: grep("[Mm]ean\\(\\)|std\\(\\)",column_names)
- add a "train" to the data set so that we know the training data vs test data using x_train$data_set <- "train"
- add the y-train so that we have the activities for each row
- add subject train to the data set so we have the subject for each record
- load in X-test with read.table
- name columns with features table
- find only columns with mean() or std() in them using: grep("[Mm]ean\\(\\)|std\\(\\)",column_names)
- add a "test" to the data set to that we know the test vs training data
- add y-test so we have the activities for each row
- add subject test to data set so we have the subject for each record
- rbind two data sets together

- load in activity names from activity_labels
- merge activity labels into data set in new column activity names

- using spread, gather and split in some combination split the mean and std in to their own columns
- make a column that has the measurement name
- make a column that has the measurement axis
- gather variable names into a measurements column:   gather(x, measure, time, -c(activity_id, data_set, activity_name))
- separate variable names into mean and std: separate(y, measure_name, c("measure", "name", "axis"))
- spread mean and std to columns

- use summarize in some form to get an output for each activity, subject, rows = measurement, columns = mean,std


#---  Credit

all work is original by rpputt
