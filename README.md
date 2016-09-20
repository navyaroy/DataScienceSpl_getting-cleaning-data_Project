# DataScienceSpl_getting-cleaning-data_Project

The Final Project for the Course "Getting and Cleaning Data" in DataScience Specialization Series.

Link to the data required for this project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download and extract the folder and set the current working directory in R to where the UCI CHAR Dataset is extracted.

Then copy paste the R script named run_analysis.R that does the following.

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Overall Workflow of the Script run_analysis.R is as follows:

- Loading  activity labels & features from the extracted folder.
- Extract only the measurements on the mean and standard deviation for each measurement. 
- Loading train & test datasets from the extracted UCI CHAR Dataset folder
- combine/merge the train and test datasets to produce an interim dataset.
- Rejoining the entire table to get the tidy datset, keying on subject/acitivity pairs, applying the mean function to each vector of values in each subject/activity pair. 
-Writing the tidy dataset to disk as "tidy.txt"

The resulting tidy dataset in the tidy.txt contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.








