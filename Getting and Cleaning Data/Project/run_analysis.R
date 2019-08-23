library(plyr)
library(dplyr)

# Initial download of data
if(!file.exists("./UCI HAR Dataset")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "dataset.zip", mode = "wb")
    unzip("dataset.zip")
}

# Reading data
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Merging datasets
dataset <- bind_rows(test, train)

# Selecting mean and std dev columns
features <- read.table("./UCI HAR Dataset/features.txt")
meanStd <- select(dataset, grep("std|mean[^Freq]", features$V2))

# Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels$V2 <- tolower(activity_labels$V2)
activity_labels$V2 <- gsub("_", "", activity_labels$V2)
activities <- bind_rows(test_labels, train_labels) %>%
    join(activity_labels, by = "V1") %>%
    select(V2)
names(activities) = "activity"

# Appropriately labels the data set with descriptive variable names. 
labels <- grep("std|mean[^Freq]", features$V2, value = TRUE)
labels <- tolower(labels)
labels <- gsub("-", "", labels)
labels <- gsub("\\(\\)","",labels)
names(meanStd) <- labels

# create a second, independent tidy data set with the average of each variable
# for each activity and each subject.
subjects <- bind_rows(subject_test, subject_train)
names(subjects) = "subject"
completeMeanStd <- bind_cols(subjects, activities, meanStd)
newMeanStd <- completeMeanStd %>%
    ddply(.(subject, activity), colwise(mean))