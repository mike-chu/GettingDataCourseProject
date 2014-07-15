Getting and Cleaning Data Course Project
========================================
    
## Introduction
    
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## About the R analysis script

The R script for this project is called **run_analysis.R**.

It does the followings:
    
1. Loading the test and train data in the first for-loop
    - During **read.table** function, we are using names from features.txt as column names of X dataset
    - Converting the numeric values of y to labels using the vectors of activity_labels.txt
    - Combine subject, X and activity to test & train data frame
2. Merges the training and the test sets to create one data frame called **merged**
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
    - extracted1 is the data frame for mean by using grep keyword **mean**
    - extracted2 is the data frame for standard deviation by using grep keyword **std**
4. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    - We are using the aggregate function to perform averaging (mean) on list(VolunteerID, activity)
5. Saving the result to a tab-delimited file called **tidy.txt**, which can also be found in this repository.

## About the Code Book

The **CodeBook.md** file describes the variables, the data, and any transformations or work performed to clean up the data.
