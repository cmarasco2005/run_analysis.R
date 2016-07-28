# Code Book

## The original Data

The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector. Descriptive only.

'features.txt': List of all features. dim() 561 Observations 2 variables

'subject_test.txt': List of the test subject IDs. dim() 2947 Observations 1 variable

'subject_train.txt': List of the train subject IDs.  dim() 7352 Observations 1 variable

'activity_labels.txt': Activity name to link to ID number. dim() 6 Observations 2 variables

'X_train.txt': Training set. dim() 7352 Observations 561 variables

'y_train.txt': Training labels. dim() 7352 Observations 1 variable

'X_test.txt': Test set. dim() 2947 Observations 563 variables

'y_test.txt': Test labels. dim() 2947 Observations 1 variable


## Variables used for my script

'activities' = 'activity_labels.txt'

'features' = 'features.txt'

'xTest' = 'X_test.txt'

'xTrain' = 'X_train.txt'

'yTest' = 'y_test.txt'

'yTrain' = 'y_train.txt'

'yTestNames' = yTest with activity IDs matched and replaced with 'activities'

'yTrainNames' = yTrain with activity IDs matched and replaced with 'activities'

'subjTest' = 'subject_test.txt'

'subjTrain' = 'subject_train.txt'

'Test' = row bound test data in order of subject, activity, and variables (subjTest,yTestNames,yTest)

'Train' = row bound treain data in order of subject, activity, and variables (subjTrain,yTrainNames,yTrain)

'FullData' = column bound merged 'Test' and 'Train'

'MeanSTDDeviation' = Boolean vector locating all true columns where "std" and "mean" strings were in the header

'FullData2' = 'FullData' subset by 'MeanSTDDeviation' vector

'ReshapeTWO' = Sorted 'FullData2' data.table by Subject ID and Acitivy

'ReadyToSubmit' = Averaged data within 'ReshapeTWO' table





