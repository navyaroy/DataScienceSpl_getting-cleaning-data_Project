# DataScienceSpl_getting-cleaning-data_Project
The Final Project for the Course "Getting and Cleaning Data" in DataScience Specialization Series.

Link to the data required for this project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download and extract the folder 

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Overall Workflow of the Script run_analysis.R


For both the test and train datasets, produce an interim dataset:
Extract the mean and standard deviation features (listed in CodeBook.md, section 'Extracted Features'). This is the values table.
Get the list of activities.
Put the activity labels (not numbers) into the values table.
Get the list of subjects.
Put the subject IDs into the values table.
Join the test and train interim datasets.
Put each variable on its own row.
Rejoin the entire table, keying on subject/acitivity pairs, applying the mean function to each vector of values in each subject/activity pair. This is the clean dataset.
Write the clean dataset to disk.
Cleaned Data

The resulting clean dataset is in this repository at: data/cleaned.txt. It contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.








