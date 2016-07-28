## Make sure you have all libraries installed and loaded
install.packages('reshape2')
library(reshape2)

##1: Read in the data into data tables
subjTest <- read.table("subject_test.txt")
subjTrain <- read.table("subject_train.txt")

xTest <- read.table("X_test.txt")
xTrain <- read.table ("X_train.txt")
yTest <- read.table ("y_test.txt")
yTrain <- read.table ("y_train.txt")

features<-read.table("features.txt")
activities<-read.table("activity_labels.txt")

##2: Add column names to data sets
colnames(subjTest)<-"IdNum"
colnames(subjTrain)<-"IdNum"

colnames(xTest)<-features$V2
colnames(xTrain)<-features$V2

colnames(yTest)<-"Activity"
colnames(yTrain)<-"Activity"

## 3: Use descriptive activity names to name the activities in the data set
yTestNames<-data.frame(Activity=activities[match(yTest$Activity,activities$V1),2])
yTrainNames<-data.frame(Activity=activities[match(yTrain$Activity,activities$V1),2])

## 4: Merges the training and the test sets to create one data set.
Test<-cbind(subjTest,yTestNames,xTest)
Train<-cbind(subjTrain,yTrainNames,xTrain)
FullData<-rbind(Test,Train)

## 5: Extracts only the measurements on the mean and standard deviation for each measurement.
## Example of the use of "mean" fBodyAccMag-mean()
## Example of the use of "std" or "standard deviation" fBodyAccMag-std()
MeanSTDDeviation <- grepl("mean\\(\\)",names(FullData),"std\\(\\)",names(FullData))

## make sure we bring along the ID and Activity names columns
MeanSTDDeviation[1:2]<-TRUE

## Use the boolean vector created with grepl to subset your original data set
FullData2<-FullData[,MeanSTDDeviation]

## Create a second independant tidy data set with the average of each variable for each activity and subject
reshapeTWO<-melt(FullData2,id=c("IdNum","Activity"))
ReadyToSubmit<-dcast(reshapeTWO,IdNum+Activity~variable,mean)

## Write the file to TXT format for submission
write.table(ReadyToSubmit,"run_analysis.R.txt",row.names=F)
