setwd("~/DataScienceSpecialization/GettingData/GettingDataCourseProject/")
feature <- read.table("UCI HAR Dataset/features.txt",
                      colClasses=c("integer","character"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              colClasses=c("integer","character"))
## Loading the data
for (data in c("test","train")) {
    subject <- read.table(paste("UCI HAR Dataset/",data,"/subject_",
                                data,".txt",sep=""),
                          col.names="VolunteerID")
    X       <- read.table(paste("UCI HAR Dataset/",data,"/X_",
                                data,".txt",sep=""),
                          col.names=feature$V2)
    y       <- read.table(paste("UCI HAR Dataset/",data,"/y_",
                                data,".txt",sep=""))
    activity <- activity_labels$V2[y$V1]
    if (data == "test") {
        test <- cbind(subject,X,activity)
    }
    if (data == "train") {
        train <- cbind(subject,X,activity)
    }
}
## Merging test and train data frames
merged <- rbind(train,test)
## Extracts only the measurements on the mean and standard deviation for each measurement. 
extracted1 <- merged[,grep("mean",names(merged))]
extracted2 <- merged[,grep("std",names(merged))]
extracted  <- cbind(merged$VolunteerID,extracted1,extracted2,merged$activity)
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyset <- aggregate(merged, 
                     list(Volunteer = merged$VolunteerID, Activity = merged$activity), 
                     mean)
tidyset$VolunteerID <- NULL
tidyset$activity    <- NULL
## Saving the result to a tab-delimited file called tidy.txt
write.table(tidyset, file="tidy.txt", sep="\t")
