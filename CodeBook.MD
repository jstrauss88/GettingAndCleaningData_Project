## Code Book for Course Project for Getting and Cleaning Data

This code book with describe in more detail the data that is in the TidyData2 data set produced by the R function 'run_analysis'

###Study Design


-  The raw data was taking from the UCI data archive website and contains accellerometer measurements from 30 subjects performing 6 different activities 

-  This raw data was imported into R and put through the steps described in the ReadMe in this repository to create a tidy data set which contains the average for each subject and activity for features that were means or standardard deviations of a measurement

###Code Book

The Resultant data set contains 68 fields

-   Activity

--*  The activity the subject was performing: laying, sitting, standing, walking, walking upstairs and walking downstairs

-   Subject

-- * The number corresponding to the person being measured, numbered 1-30

-  the following are time measurements
