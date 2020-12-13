## Code book for Coursera Getting and Cleaning Data course project
The tidy data set that this code book pertains to is located in the tidydata.txt file of this repository.
The script for performing the analysis is in the run_analysis.R

1. The raw data source is downloaded from here: [Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) collected from the accelerometers from the Samsung Galaxy S smartphone 

The tidy data set gives the average of each variable (that estimate the mean and standard deviation) for each activity and each subject. The first row is the variable names.

2. The data file is a zip file that contains the following text files that we used for this assignment:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

3. We merged the subject and activity (which we got from 'train/subject_train.txt' and 'train/y_train.txt' for the training set and 'test/subject_test.txt' and 'test/y_test.txt' for the test set) in first two columns of the training and test sets and then merged the training and test sets using rbind()

4. We ordered the data according to the subject variable which is V1

5. Used descriptive activity names to name the activities in the data set (which is variable V1.1) which we got from the 'activity_labels.txt' file:
- 1 is labelled WALKING
- 2 is labelled WALKING_UPSTAIRS
- 3 is labelled WALKING_DOWNSTAIRS
- 4 is labelled SITTING
- 5 is labelled STANDING
- 6 is labelled LAYING

6. Labelled the data set with descriptive variable names by replacing the variable names with the names in the features.txt file and setting the variable names for the first two columns "subject" and "activity" since the features.txt doesn't contain these variable names

7. We Extracted only the measurements on the mean and standard deviation for each measurement by subsetting from the variable names only which contain "mean" or "std" and then added the two columns of the subject and activity variables to the data

8. We changed the variable names to lower case

9. We created an independent tidy data set with the average of each variable for each activity and each subject by aggregating the data according to the subject and activity and applying the mean
 
10. Finally we wrote the final tidy data as a text file by using write.table function  and setting row.names=TRUE

## Variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

-tBodyAcc-XYZ

-tGravityAcc-XYZ

-tBodyAccJerk-XYZ

-tBodyGyro-XYZ

-tBodyGyroJerk-XYZ

-tBodyAccMag

-tGravityAccMag

-tBodyAccJerkMag

-tBodyGyroMag

-tBodyGyroJerkMag

-fBodyAcc-XYZ

-fBodyAccJerk-XYZ

-fBodyGyro-XYZ

-fBodyAccMag

-fBodyAccJerkMag

-fBodyGyroMag

-fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

-mean(): Mean value

-std(): Standard deviation

-mad(): Median absolute deviation 

-max(): Largest value in array

-min(): Smallest value in array

-sma(): Signal magnitude area

-energy(): Energy measure. Sum of the squares divided by the number of values. 

-iqr(): Interquartile range 

-entropy(): Signal entropy

-arCoeff(): Autorregresion coefficients with Burg order equal to 4

-correlation(): correlation coefficient between two signals

-maxInds(): index of the frequency component with largest magnitude

-meanFreq(): Weighted average of the frequency components to obtain a mean frequency

-skewness(): skewness of the frequency domain signal 

-kurtosis(): kurtosis of the frequency domain signal 

-bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

**In our tidy set we subsetted only the set of variables containing the mean(), std() and meanFreq() (step 7 above)**

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

-gravityMean

-tBodyAccMean

-tBodyAccJerkMean

-tBodyGyroMean

-tBodyGyroJerkMean
