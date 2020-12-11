## Download the zip file and unzipping it and looking at the list 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "./data")
unzip("data")
unzip("data",list=TRUE)

## reading the train and test sets, by default header is FALSE
trainx=read.table("UCI HAR Dataset/train/X_train.txt",sep="")
testx=read.table("UCI HAR Dataset/test/X_test.txt",sep="")

## reading the subject and labels of train and test sets
trainsubject=read.table("UCI HAR Dataset/train/subject_train.txt")
trainlabels=read.table("UCI HAR Dataset/train/y_train.txt")
testsubject=read.table("UCI HAR Dataset/test/subject_test.txt")
testlabels=read.table("UCI HAR Dataset/test/y_test.txt")

## merging the subject and labels to the train and test sets and then creating one data set containing the train and test sets
train=data.frame(trainsubject,trainlabels,trainx)
test=data.frame(testsubject,testlabels,testx)
data=rbind(train,test)

## ordering the data according to the subject variable which is V1
data1=data[order(data$V1),]

## Using descriptive activity names to name the activities in the data set which is V1.1 variable
data1$V1.1=factor(data1$V1.1,levels = c(1,2,3,4,5,6),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

## labeling the data set with descriptive variable names 
names=read.table("UCI HAR Dataset/features.txt")
names(data1)=c("subject","activity",names[,2])

## Extracting only the measurements on the mean and standard deviation for each measurement
data2=data1[,c(grep("mean",names(data1)),grep("std",names(data1)))]
newdata=c(data1[,c(1,2)],data2)

## changing the variable names to lower case
names(newdata)=tolower(names(newdata))

## creating independent tidy data set with the average of each variable for each activity and each subject
tidydata=aggregate(.~subject+activity,newdata,mean)

## writing the tidy data as a text file
write.table(tidydata,"tidydata.txt",row.names = FALSE)
