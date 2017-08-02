Run_analysis.R  ReadMe

Hello, in this ReadMe file I will describe the contents of the files contained within my github repository for this weeks programming 
assignment. In addition, I will share line by line what is taking place in my R script, “run_analysis”.

I have done my best to ensure that the script produces a tidy data text file as described in the Coursera lectures and programming assignment instructions. The resulting data set is tidy because each variable has its own unique name with no duplicates,
each variable has its own column, is human readable with no capital letters, blank spaces, underscores, commas, periods, etc.,
each observation is in its own column, and the activity numbers have been converted from numbers to activity names for easy 
human interpretation and analysis. Let’s begin describing the code




Line 12: 	    Set the working directory within R

Lines 19-24: 	Here we read in the majority of the data we will be working with to create our tidy data       
         	    Frame. The “features.txt” data will be imported later in the code
              
Lines 34-49:	This is where we transform the activity features from numerals to activity names. ie. activity “1” is turned into “walking” 

Lines 55-56:	We use “bind_rows” to stack “y_test.txt” and “y_train.txt” to create the full activity names column. 
              We then use names() to name the whole column “activityname”

Lines 59-60:	We stack “subject_test.txt” and “subject_train.txt” using bind_rows() to create the full participant number column. 
              We call names() to name the column “participantnumber”

Line 63:	We use bind_rows() to stack all of the observational data together. Again, keeping consistency, we bind the test data first,
          then training data. “X_test.txt”, “X_train.txt”

Line 69:	This is where we load in the features data, “Features.txt”. We have been reading in the data using read_table() because it 
          imports the data as a “tibble” which allows the execution of the code to run significantly faster

Line 79:	Here we begin making the feature names tidy by converting all the feature names to lowercase text

Line 84: 	We begin making the feature names human readable by replacing the first occurrence of the letter “t” in the 
          feature name with the word “time”. This helps the end user of the data to understand what each variable is measuring

Lines 95-114:	Continue tidying the data by removing all special characters (commas, parenthesis, colons, underscores, spaces, etc.) 
              We also continue to build out the feature names, making them human readable by fleshing out any abbreviations ie. “acc” turns into “acceleration”, “gyro” turns into ”gyroscope”  

Line 123:	Now that the features have been made tidy and descriptive, each having its own unique name, we are ready to 
          “clip” it on to the top of the dataset, assigning the feature names as column names to the X_test, X_train combined data set

Line 128:	Here we continue binding our data frames together. We call bind_cols() to attach the “participant” column 
          data frame to the “activity” data frame 

Line 138: In this line of code we finally connect all of our data frames together “participantnumber”, ‘activityname”, “featurenames…”

Line 143:	Convert column two, “participantnumber”, from numeric into data type factor for later sorting and analysis

Lines 151-153:	This is where we subset the data/features that only contain measurements of the mean and standard deviation

Lines: 158-159:	Arrange the data frame by “participantnumber” and “activityname”

Line 168:	Here, we call the aggregate() function in order to take the mean measurement on the dataset for each participant doing each 
          activity

Line 172:	Finally, we export our tidy data set, which can be utilized for further analysis. The newly created data set meets the criteria 
          of tidy data  because each variable has its own column, with one observation per row. In addition, the data set follows the 
          coursera lecture suggestions of tidy data including having all the variable names lowerase with no spacesor special characters.
          In addition, each variable has its own unique name with no duplicates
    

