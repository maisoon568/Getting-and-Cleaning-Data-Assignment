## Code book for Coursera Getting and Cleaning Data course project
The tidy data set that this code book pertains to is located in the tidydata.txt file of this repository.
The script for performing the analysis is in the run_analysis.R

1. The raw data source is downloaded from here: [Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
The tidy data set gives the average of each variable for each activity and each subject. The first row is the variable names.

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

**For more information on the variables can be found in the 'features_info.txt' file that describes the variables**

