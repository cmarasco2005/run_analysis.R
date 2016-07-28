# CODE BOOK run_analysis.R
Christopher Marasco's Tidy Data Set (run_analysis.R) Script a la Getting and Cleaning Data Course Project

### We begin by downloading the data in order to identify the structure and format of the contents 

  The Data Source was provided per the URL: 
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  A decription of the data was included here: 
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

  As identified in the description, we've been provided data on both a test and train group containting a series of six activities as measured by an embedded Samsung smartphone acceleromter and gyroscope, all captured in 3 axis accleration and angular velocity
  
### We have 5 initiatives in order to complete this assignment properly.

1.) Merges the training and the test sets to create one data set

2.) Extracts only the measurements on the mean and standard deviation for each measurement

3.) Uses descriptive activity names to name the activities in the data set

4.) Appropriately labels the data set with descriptive variable names

5.) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### The steps I undertook

1.) Read all of the data into data tables. There are three test data sets (subject, x, and y) and three train data sets.

2.) Give each of the columns names we can use later. Subject files were named with IdNum headers, x Column data was named using a supplied Features file, and y Column data was named with Activity headers

3.) The y Data was provided with activity numbers. Replace the y Column 2 data with actual activities names. These were provided in a separate file. This step is synonomous with #3 in the section above.

4.) With the data read, named, and massaged into format, you can merge the contents together. Using a dim() function you can clearly see that all of the Test dat is of a particular number of observations as is all of the Train data. Using cbind we can bind the like columns into two data.frames. Once this is complete we can row bind rbind() the resulting data.tables for a single data source to maniupulate.

5.) Per initiative #2 we have to extract only the columns containing mean and standard deviation measurements. To do this we use grepl() function and look for any columns that contain the strings "mean" and "std". After which we use the resulting TRUE/FALSE vector from grepl() to subset our full data set, keeping care to bring along our subject ID and activity names required for initiative #5.

6.) Lastly we use the reshape2 package to create a tidy data set that is sorted by Subject ID first, then by activity and provides the mean value for each. An export in TXT format is generated from the last line in the script.
  
