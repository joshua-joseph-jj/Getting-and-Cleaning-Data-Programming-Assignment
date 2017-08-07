run_analysis <- function(){
        
        # Check to see if the required packages are installed and loaded     
        
        if (!require("plyr")){
                install.packages("plyr")
        }       
        library("plyr")
        
        if (!require("readr")){
                install.packages("readr")
        }
        library("readr")
        
        if (!require("dplyr")){
                install.packages("dplyr")
        }
        library("dplyr")
        
        if (!require("stringr")){
                install.packages("stringr")
        }
        library("stringr")
        
       
        # Read in all of the data. The following files must be located in the working directory 
        
        subject_test.txt <- read_table("subject_test.txt", col_names = FALSE)
        subject_train.txt <- read_table("subject_train.txt", col_names = FALSE)
        X_test.txt <- read_table("X_test.txt", col_names = FALSE)
        X_train.txt <- read_table("X_train.txt", col_names = FALSE)
        y_test.txt <- read_table("y_test.txt", col_names = FALSE)
        y_train.txt <- read_table("y_train.txt", col_names = FALSE)
        features.txt <- read_table("features.txt", col_names = FALSE)
        
        
        # Next, convert the "activities" column of data into human readable
        # and descriptive activity names
        
        
        
        ### STEP 3: Use descriptive activity names to name the activities in the data set ###
        
        y_test.txt$X1 <- as.factor(y_test.txt$X1) %>% 
                gsub("1","walking",.) %>%
                gsub("2","walking upstairs",.) %>%
                gsub("3","walking downstairs",.) %>%
                gsub("4","sitting",.) %>%
                gsub("5","standing",.) %>%
                gsub("6","laying",.) 
        
        
        y_train.txt$X1 <- as.factor(y_train.txt$X1) %>%
                gsub("1","walking",.) %>%
                gsub("2","walking upstairs",.) %>%
                gsub("3","walking downstairs",.) %>%
                gsub("4","sitting",.) %>%
                gsub("5","standing",.) %>%
                gsub("6","laying",.) 
        
        
        # Begin to combine the data frames together, giving them descriptive
        # column names that are human readable
         
         z_y_test_train_stack <- bind_rows(y_test.txt,y_train.txt)
         names(z_y_test_train_stack) <- c("activityname") 
         
         
         z_subject_test_train_stack <- bind_rows(subject_test.txt,subject_train.txt)
         names(z_subject_test_train_stack) <- c("participantnumber") 
         
         
         z_x_test_train_stack <- bind_rows(X_test.txt,X_train.txt)
        
        # continue making the feature data Tidy
        
        # Make all the characters lowercase
        # Note: using sapply() was critical here in order to keep the data
        # type "data.frame" otherwise tolower() would have coerced it to 
        # "character"
        
        features.txt_AllLower <- sapply(features.txt, tolower) 
                                 
        
        # Begin making the feature names human readable
        
        features.txt_AllLower_1 <- sub("t","time", features.txt_AllLower)
        
        # Remove all special characters from the feature names, making it 
        # Tidy "(" "." "," ")" etc. Continue making the feature data set Tidy by 
        # giving the features unique and descriptive names that are fully human 
        # readable
        
        features.txt_AllLowerTidy <- features.txt_AllLower_1 %>%
                gsub(",","",.) %>% 
                gsub("-","",.) %>%
                gsub("\\(","",.) %>%
                gsub("\\)","",.) %>%
                gsub(" ","",.) %>%
               
        
                        
        ### STEP 4: Appropriately label the data set with descriptive variable names ###
                
                gsub("acc","acceleration",.) %>%
                gsub("gyro","gyroscope",.) %>%
                gsub("mag","magnitude",.) %>%
                sub("f", "fastfouriertransform",.) %>%
                gsub("bodybody","body",.) %>%
                gsub("mean","meanvalue",.) %>%
                gsub("std","standarddeviation",.) %>%
                gsub("mad","medianabsolutedeviation",.) %>%
                gsub("max","largestvalueinarray",.) %>%
                gsub("min","smallestvalueinarray",.) %>%
                gsub("sma","signalmagnitudearea",.) %>%
                gsub("iqr","interquartilerange",.) %>%
                gsub("entropy","signalentropy",.) %>%
                gsub("arcoeff","autoregressioncoefficients",.)  
                
        # Now that all the features have descriptive and unique variable names,
        # we can bind them on to the main observational data frame and use
        # them as column (feature) names
        
        colnames(z_x_test_train_stack) <- c(features.txt_AllLowerTidy)
        
        # Bind the participant number and activity name data frames together
        
        participant_activity <- bind_cols(z_subject_test_train_stack,z_y_test_train_stack)
        
        # Bind the participant number and activity name data frame to the
        # main data frame that contains all of the observational data.
        
        
        
        ### STEP 1: Merge the training and test sets to create one data set ###
       
        participant_activity_obs <- bind_cols(participant_activity, z_x_test_train_stack)
        
        
        # Convert the column "participantnumber" to the Factor data type for later analysis
         
        participant_activity_obs$participantnumber <- as.factor(participant_activity_obs$participantnumber) 
        
        # Begin extracting only the columns that are needed for the analysis  
        
        participant_activity_obs_avg_sd_selected <- participant_activity_obs %>%
                select(contains("participantnumber"), contains("activityname"),
                       
        
        
        ### STEP 2: extract only the measurements on the mean and standard deviation 
        ### for each measurement ###
        
                contains("mean"), contains("standarddeviation"))
        
        
        # To add to the tidyness, group the data set by columns "participantnumber" and "activity" 
        
        participant_activity_obs_avg_sd_selected_grouped <- participant_activity_obs_avg_sd_selected %>%
               arrange(.,participantnumber,activityname) 
        
        
        
        ### STEP 5: : From the data set in step 4, create a second independent tidy data set 
        ### with the average of each variable for each activity and each subject ###
        
        participant_activity_obs_avg_sd_selected_grouped1 <- aggregate(.~ participantnumber + activityname ,participant_activity_obs_avg_sd_selected_grouped, mean)
                
        write.table(participant_activity_obs_avg_sd_selected_grouped1, file = "tidydataset.txt", row.names = FALSE)
        
        
        
        
        
}




