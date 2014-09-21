##Course Project for Getting and Cleaning Data

this repository contains the r script that will take raw data on human activity recognition using smartphone data set from the UCI website, import into R, transform into a tidy data set,  then create a second tidy dataset that takes the averages on specific measurements for each activity and subject and exports this dataset to the working directory

###Raw Data
the data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  and the unzipped folder "UCI HAR Dataset" which contains files as well as subfolders with files is saved in the working directory

###Importing Data
The 8 files that contain the data and labels required are imported into R.  The files are


- 'features.txt' is imported to the table 'features': List of all features.

- 'activity_labels.txt' is imported to the table 'activity_lables': Links the class labels with their activity name.

- 'X_train.txt' is imported to the table 'x_train': Training set.

- 'y_train.txt' is imported to the table 'y_train': Training labels.

- 'subject_train.txt' is imported to 'subject_train': Training subjects.

- 'X_test.txt' is imported to the table 'x_test': Test set.

- 'y_test.txt' is imported to the table 'y_test': Test labels

- 'subject_test.txt' is imported to the table 'subject_test': Test subjects.



###1.  Merges the training and the test sets to create one data set.

'x_train' and 'x_test' are row binded to each other
'subject_train' and 'subject_test' are row binded to each other
'y_train' and 'y_test' are row binded to each other

the three data sets are then column binded to each other to create the data set 'TidyData'


###2.  Extracts only the measurements on the mean and standard deviation for each measurement.

'features' is reduced so that it only contains the varaibles with mean() or std() in column V2.

'TidyData' is reduced by taking only the column numbers that corresponded with the values in the reduced featurse$V1 as well as the two ending columns containing activity labels and subject number


###3.  Uses descriptive activity names to name the activities in the data set

'TidyData' is merged with 'activity_labels' on v1.2 in 'TidyData' and V1 in 'activity_labels'.  This gets V2 from 'activity_labels' which contains activity names, into 'TidyData'
The numerical column corresponding with the names is dropped for the data frame


###4.  Appropriately labels the data set with descriptive variable names. 

columns are remained in 'TidyData' by using a vector that combines the reduced 'features' set with the strings "subject" and "activity"

###5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
A new data frame called 'TidyData2' is created from 'TidyData' using ddply from the plyr package to subset 'TidyData' by subject and activity and then taking the mean of each measurement column.
Using write.table, 'TidyData2' is exported to the working directory as a text file
