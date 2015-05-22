# GettingAndCleaningData
Repository for Cource Project for Getting and Cleaning Data course on Courcera

Getting and Cleaning Data Course Project

This file describes how run_analysis.R script.

The run_analysis.R is the script designed to meet the design requirements.

The site where the data used for this project was obtained:

      http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
      
The data for the project:
      
      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Run the script:

1 - Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

    - This will create a diretory named "getdata-projectfiles-UCI HAR Dataset" under your local diretory.
    
2 - Navigate to the diretory "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset" and put the "run_analysis.R" script there.

3 - Start RStudio and set the diretory "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset" as your work diretory.

4 - Execute the "run_analysis.R" command in RStudio.

    - This script will generate two files in your work diretory:
    
           - "data_merged.txt" -> This is the file with the result of the merge data, this is the base for the tidy data,
                   
           - "tidy_data.txt"   -> This is the tidy data set with the average of each variable for each activity and each subject.
                
The "tidy_data.txt" is the final file that meets the project.

                                          
In this github repository you can find a exemple of the generated files.                                          




