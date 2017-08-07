## Code Book: Getting and Cleaning Data Programming Assignment

### Tidydata.txt
The file “tidydata.txt” contains only data that pertains to measurements of the mean and standard deviation taken from the Samsung Galaxy Smart Phone data set. The mean of these values were taken to create the tidy data set found in this repository. The original data set  can be found at the [UCI Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

"Tidydata.txt" conforms to the principles of tidy data because all variables have one column with one observation per row.
 
### Tidying the Feature Names 
The names of the original features have been processed to conform to the principles of tidy data. Each feature has its own unique name. All abbreviations have been expanded upon ie. “t” = “time”, “acc” = “acceleration”, “f” = fastfouriertransform etc.

### Complete List of Feature Names
"timebodyaccelerationmeanvaluex"

"timebodyaccelerationmeanvaluey"

"timebodyaccelerationmeanvaluez"

"timegravityaccelerationmeanvaluex"

"timegravityaccelerationmeanvaluey"

"timegravityaccelerationmeanvaluez"

"timebodyaccelerationjerkmeanvaluex"

"timebodyaccelerationjerkmeanvaluey"

"timebodyaccelerationjerkmeanvaluez"

"1timebodygyroscopemeanvaluex"

"timebodygyroscopemeanvaluey"

"timebodygyroscopemeanvaluez"

"timebodygyroscopejerkmeanvaluex"

"timebodygyroscopejerkmeanvaluey"

"timebodygyroscopejerkmeanvaluez"

"timebodyaccelerationmagnitudemeanvalue"

"timegravityaccelerationmagnitudemeanvalue"

"timebodyaccelerationjerkmagnitudemeanvalue"

"timebodygyroscopemagnitudemeanvalue"

"timebodygyroscopejerkmagnitudemeanvalue"

"fastfouriertransformbodyaccelerationmeanvaluex"

"fastfouriertransformbodyaccelerationmeanvaluey"

"fastfouriertransformbodyaccelerationmeanvaluez"

"fastfouriertransformbodyaccelerationmeanvaluefreqx"

"fastfouriertransformbodyaccelerationmeanvaluefreqy"

"fastfouriertransformbodyaccelerationmeanvaluefreqz"

"fastfouriertransformbodyaccelerationjerkmeanvaluex"

"fastfouriertransformbodyaccelerationjerkmeanvaluey"

"fastfouriertransformbodyaccelerationjerkmeanvaluez"

"fastfouriertransformbodyaccelerationjerkmeanvaluefreqx"

"fastfouriertransformbodyaccelerationjerkmeanvaluefreqy"

"fastfouriertransformbodyaccelerationjerkmeanvaluefreqz"

"fastfouriertransformbodygyroscopemeanvaluex"

"fastfouriertransformbodygyroscopemeanvaluey"

"fastfouriertransformbodygyroscopemeanvaluez"

"fastfouriertransformbodygyroscopemeanvaluefreqx"

"fastfouriertransformbodygyroscopemeanvaluefreqy"

"fastfouriertransformbodygyroscopemeanvaluefreqz"

"fastfouriertransformbodyaccelerationmagnitudemeanvalue"

"fastfouriertransformbodyaccelerationmagnitudemeanvaluefreq"

"fastfouriertransformbodyaccelerationjerkmagnitudemeanvalue"

"fastfouriertransformbodyaccelerationjerkmagnitudemeanvaluefreq"

"fastfouriertransformbodygyroscopemagnitudemeanvalue"

"fastfouriertransformbodygyroscopemagnitudemeanvaluefreq"

"fastfouriertransformbodygyroscopejerkmagnitudemeanvalue"

"fastfouriertransformbodygyroscopejerkmagnitudemeanvaluefreq"

"angletimebodyaccelerationmeanvaluegravity"

"angletimebodyaccelerationjerkmeanvaluegravitymeanvalue"

"angletimebodygyroscopemeanvaluegravitymeanvalue"

"angletimebodygyroscopejerkmeanvaluegravitymeanvalue"

"anglexgravitimeymeanvalue"

"angleygravitimeymeanvalue"

"anglezgravitimeymeanvalue"

"timebodyaccelerationstandarddeviationx"

"timebodyaccelerationstandarddeviationy"

"timebodyaccelerationstandarddeviationz"

"timegravityaccelerationstandarddeviationx"

"timegravityaccelerationstandarddeviationy"

"timegravityaccelerationstandarddeviationz"

"timebodyaccelerationjerkstandarddeviationx"

"timebodyaccelerationjerkstandarddeviationy"

"timebodyaccelerationjerkstandarddeviationz"

"timebodygyroscopestandarddeviationx"

"timebodygyroscopestandarddeviationy"

"timebodygyroscopestandarddeviationz"

"timebodygyroscopejerkstandarddeviationx"

"timebodygyroscopejerkstandarddeviationy"

"timebodygyroscopejerkstandarddeviationz"

"timebodyaccelerationmagnitudestandarddeviation"

"timegravityaccelerationmagnitudestandarddeviation"

"timebodyaccelerationjerkmagnitudestandarddeviation"

"timebodygyroscopemagnitudestandarddeviation"

"timebodygyroscopejerkmagnitudestandarddeviation"



### Original Dataset: Human Activity Recognition Using Smartphones 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


## run_analysis.R Detailed Breakdown
Please find a line by line explanation of the code below and how the provided data files were processed to create the file “tidydataset.txt"

- Lines 5-23: Check to make sure that all required packages are installed

- Lines 19-24: 	Here we read in all of the data we will be working with to create our tidy data set       
    

- Lines 42-59:	This is where we transform the activity features from numerals to activity names. ie. activity “1” is turned into “walking” 

- Lines 65-66:	We use “bind_rows” to stack “y_test.txt” and “y_train.txt” to create the full activity names column. We then use names() to name the whole column “activityname”
- Lines 69-70:	We stack “subject_test.txt” and “subject_train.txt” using bind_rows() to create the full participant number column. We call names() to name the column “participantnumber”
- Line 73:	We use bind_rows() to stack all of the observational data together. Again, keeping consistency, we bind the test data first, then training data. “X_test.txt”, “X_train.txt”.
- Line 82:	Here we begin making the feature names tidy by converting all the feature names to lowercase text.
- Line 87: 	We begin making the feature names human readable by replacing the first occurrence of the letter “t” in the feature name with the word “time”. This helps the end user of the data to understand what each variable is measuring
- Lines 94-99:	Continue tidying the data by removing all special characters (commas, parenthesis, colons, underscores, spaces, etc.) We also continue to build out the feature names, making them human readable by fleshing out any abbreviations ie. “acc” turns into “acceleration”, “gyro” turns into ”gyroscope”.  
- Line 124:	Now that the features have been made tidy and descriptive, each having its own unique name, we are ready to bind it on to the top of the dataset, assigning the feature names as column names to the X_test, X_train combined data set.
- line 125: Remove any numbers from the character strings of the column names
- Line 128:	Here we continue binding our data frames together. We call bind_cols() to attach the “participant” column data frame to the “activity” data frame. 
- Line 135: 	In this line of code we connect all of our data frames together “participantnumber”, ‘activityname”, “featurenames…”
- Line 142:	Convert column two, “participantnumber”, from numeric into data type factor for later sorting and analysis.
- Lines 154:	This is where we subset the data/features that only contain measurements of the mean and standard deviation.
- Lines: 159-160:	For organization, group the data frame by “participantnumber” and “activityname”
- Line 167:	Here, we call the aggregate() function in order to take the mean measurement on the dataset for each participant doing each activity
- Line 169: We export our tidy data set, which can be utilized for further analysis 





