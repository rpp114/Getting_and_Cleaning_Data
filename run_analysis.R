
# Load appropriate libraries
library(dplyr)
library(tidyr)

# set appropriate working directory assuming data is extracted from zip file into working directory
setwd(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset")


# Load training data into R

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Load Variable Names

features <- read.table("features.txt")

# Select only mean and std Columns

cols <- grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", features[,2])
col_names <- features[,2][cols]

x_train <- select(x_train, cols)

# Add column names

names(x_train) <- col_names

# Add activity_id and data_set name to new columns

x_train$activity_id <- y_train[,1]
x_train$data_set <- "train"
x_train$subject <- subject_train[,1]

#repeat above for test data

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# Select only mean and std Columns

x_test <- select(x_test, cols)

# Add column names

names(x_test) <- col_names

# Add activity_id and data_set name to new columns

x_test$activity_id <- y_test[,1]
x_test$data_set <- "test"
x_test$subject <- subject_test[,1]

# Rbind Train and Test to get the full data set

full_data <- rbind(x_train, x_test)

# Remove the no longer needed data frames

rm(x_train, y_train, subject_train, x_test, y_test, subject_test, cols, col_names, features)

# Add activity names based on ID

activities <- read.table("activity_labels.txt")
names(activities) <- c("activity_id", "activity_name")
data <- merge(full_data, activities)

# Add a row index
data$row_id <- 1:nrow(data)

rm(full_data, activities)

# Manipulate data to get a summary of tidy data

new_data <- data %>%

# pull columns into one measurement column
gather(measurement, value, -c(activity_id, activity_name, row_id, subject, data_set)) %>%

# separate out the measure, value and axis
separate(measurement, c("measure", "calc", "axis")) %>%

# put Mean and Std in their own columns
spread(calc, value) %>%

# aggregate to the subject, activity_name, measure, axis levels
group_by(subject, activity_name, measure, axis) %>%
summarize(mean=mean(mean), std_mean = mean(std))

#Write output

write.table(new_data, file="output_data_set.txt", row.name=FALSE, sep=",")













