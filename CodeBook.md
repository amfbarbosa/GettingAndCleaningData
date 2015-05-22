Getting and Cleaning Data Course Project

This file describes the variables, the data, and any transformations or work performed to clean up the data.

The site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Steps to clean the data:

 1 - Read file "feature.txt" to get the column labels.
 
 2 - Identify the mean and standard deviation. 
 
 3 - Adjust labels. Remove "()" and change '-' for '_'.
 
 4 - Read and joining  X files ("X_test.txt" and "X_train.txt").
 
 5 - Read and joining  Y files ("Y_test.txt" and "Y_train.txt").
 
 6 - Read and joining subject files ("subject_test.txt" and "subject_train.txt").
 
 7 - Merge de joined files - put the result in MergedData.
 
 8 - Read file "activity_labels.txt" and merge with the MergedData to transform the values according to the activity data frame.
 
 9 - Write a txt file with the merged source files in current working directory.
 
10 - Use the MergedData to generate a tidy data set with the average of each measurement for each activity and each subject.

11 - Write the result out to "tidy_data.txt" file in current working directory.

 

These steps were implemented in "run_analysis.R" script.
