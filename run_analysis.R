run_analysis <- function(){
    #import all tables 
    x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
    x_train<-read.table("./UCI HAR Dataset/train/x_train.txt")
    
    y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
    y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
    
    subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
    subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
    
    activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
    
    #import features with character class to rename columns later
    features<-read.table("./UCI HAR Dataset/features.txt",colClasses = c("integer","character"))
    
    #merge test and train data sets
    TidyData<-rbind(x_train,x_test)
    
    #merge tran and test subjects
    subject<-rbind(subject_train,subject_test)
    
    #merge train and test activity
    activity<-rbind(y_train,y_test)
    
    #combine data, activity labels and subject
    TidyData <- cbind(TidyData,subject,activity)
    
    #find measurements that take the mean and std of the measurements
    features<-features[grep("mean()|std()" ,features$V2),]
    
    #get rid of MeanFreq()
    features<-features[grep("meanFreq()",features$V2,invert=TRUE),]
    
    #extract the measurements on the mean and std, and include subject and activity
    TidyData<-TidyData[,c(features$V1,562:563)]
    
    #uses descriptive names to name every activity
    TidyData <-merge(TidyData,activity_labels,by.x="V1.2",by.y="V1")
    
    #drop activity number column
    TidyData$V1.2=NULL
    
    #Appropriately labels the data set with descriptive variable names.
    names(TidyData)<-c(features$V2,"subject","activity")
    
    # creates a second, independent tidy data set with the average of each variable for each activity and each subject
    TidyData2 <<-ddply(TidyData, .(activity,subject), numcolwise(mean))
    
    #writes text file to the working directory
    write.table(TidyData2,file="TidyData2.txt",row.names=FALSE)

}  
