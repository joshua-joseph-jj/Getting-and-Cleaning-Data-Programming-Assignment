## Getting and Cleaning Data Orogramming Assignment

### Run_analysis.R  ReadMe

Hello, in this ReadMe I will describe the contents of the files contained within this github repository as they pertain to the Getting and Cleaning Data Programming assignment.

### Repository Contents

-README.md (this file)
-run_analysis.R (R script that produces the tidydataset.txt file per the assignment instructions)
-tidydata.txt (a tidydataset produced by the run_analysis.R script)



## tidydata.txt information

I have ensured that the script produces a tidy data text file as described in the Coursera lectures and programming assignment instructions. The resulting data set is tidy because each variable has its own unique name with no duplicates,
each variable has its own column, is human readable with no capital letters, blank spaces, underscores, commas, periods, etc.,
each observation is in its own column, and the activity numbers have been converted from numbers to activity names for easy 
human interpretation and analysis. 

Please know that the R code satisfies all 5 requirements in the following order: 

-Uses descriptive activity names to name the activities in the data set
-Appropriately labels the data set with descriptive variable names
-Merges the training and test sets to create one data set
-Extracts only the measurements on the mean and standard deviation for each measurement
-From the data set in step 4, creates a second, independent tidy data set with the average
   of each variable for each activity and each subject


