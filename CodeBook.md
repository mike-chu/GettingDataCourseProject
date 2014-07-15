CodeBook
========
    
## Data source
    
The following link contains the `Human Activity Recognition Using Smartphones Dataset` from UCI machine learning repository.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We have downloaded the zip and unzipped to the "UCI HAR Dataset" directory.

## Data

The data contain observation of 561-feature vector with time and frequency domain variables. These variable are measurements of triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, plus triaxial Angular velocity from the gyroscope. 

We have utilized the names in the features.txt and applied as column names of the dataset.

In the experiment, the person were performing one of these six activities.

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

We have also applied these activity names as the factor variable after reading the y data set.

## Data extraction

We were instructed to extracts only the measurements on the mean and standard deviation for each measurement.

In the feature names, mean() and std() are representing the mean and standard deviation of the measurement respectively. Hence we have used the "grep" function and used the keywords "mean" and "std" to extract the information.

## Aggregating the mean

We have used the aggregate function to create a second, independent tidy data set.
We have used list(VolunteerID, activity) in the "by" parameter of the function. It will help us subsetting the data into 180 groups (30 person x 6 activities). Within each group, the aggregate function will use mean() to calculate the average of each measurement variables.
