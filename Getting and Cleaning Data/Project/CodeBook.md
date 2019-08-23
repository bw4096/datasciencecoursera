# Getting and Cleaning Data Codebook  

## Background

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. This data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the source data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data
The relevant files that were used to compile a tidy data set were as follows:

* `features.txt`: List of all features.

* `activity_labels.txt`: Links the class labels with their activity name.

* `train/X_train.txt`: Training set.

* `train/y_train.txt`: Training labels.

* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* `test/X_test.txt`: Test set.

* `test/y_test.txt`: Test labels.

* `test/subject_test.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The details in this Codebook are based on the following files:

* `README.txt`

* `features_info.txt`: Shows information about the variables used on the feature vector.

## Variables
There are 68 variables in the tidied dataset:
* subject: Numbered 1-30
* activity: Consists of laying, sitting, standing, walking, walking downstairs and walking upstairs
* 66 signal-measurement averages
  * 33 signal-means
  * 33 signal-standard deviations

### Signals
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals (33 in total) were used to estimate measurements of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

For each of these signals, the following measurements were produced and kept:
* mean(): Mean value
* std(): Standard deviation

## Transformations
The script applies the following transformations to the data:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set
  * Applies lowercase transformation, removes underscores and capitalizes first letters of words for readability
  
4. Appropriately labels the data set with descriptive variable names.
  * Applies lowercase transformation, removes underscores and parentheses, and capitalizes first letters of words for readability
  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * Merges subject list, activities and dataset with descriptive labels
  * Calculates the column-wise average for each subject-activity pair