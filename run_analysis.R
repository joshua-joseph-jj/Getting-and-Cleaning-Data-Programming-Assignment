run_analysis <- function(){
        
# require(plyr,tidyverse,tidyr,stringr)        
        
        
        
        
        
#       Set the working directory for the R script
        
        
        setwd("C:/Users/JJ/Documents/coursera/data/UCI_HAR_Dataset/master_data")
        
#       Read in all of the data. "Features.txt"
#       will be imported later on in the code        

        
        
        subject_test.txt <- read_table("subject_test.txt", col_names = FALSE)
        subject_train.txt <- read_table("subject_train.txt", col_names = FALSE)
        X_test.txt <- read_table("X_test.txt", col_names = FALSE)
        X_train.txt <- read_table("X_train.txt", col_names = FALSE)
        y_test.txt <- read_table("y_test.txt", col_names = FALSE)
        y_train.txt <- read_table("y_train.txt", col_names = FALSE)
        
        
        
#       Next, we convert the "activities" column of data into human readable
#       and descriptive activity names
        
#       ### The following line of code completes "part 3" of the assignemt: Use
        ### descriptive activity names to name the activities in the data set ###
        
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
        
        
#         Begin to combine the tidy data frames together, giving them descriptive
#         column names that are human readable
         
         z_y_test_train_stack <- bind_rows(y_test.txt,y_train.txt)
         names(z_y_test_train_stack) <- c("activityname") 
         
         
         z_subject_test_train_stack <- bind_rows(subject_test.txt,subject_train.txt)
         names(z_subject_test_train_stack) <- c("participantnumber") 
         
         
         z_x_test_train_stack <- bind_rows(X_test.txt,X_train.txt)
        
        
        
#       Import the feature names
        
        features.txt <- read_table("C:/Users/JJ/Documents/coursera/data/UCI_HAR_Dataset/features.txt", col_names = FALSE)
        
         
#       continue making the feature data Tidy
        
#       Make all the characters lowercase
#       Note: using sapply() was critical here in order to keep the data
#       type "data.frame" otherwise tolower() would have coerced it to 
#       "character"
        
        features.txt_AllLower <- sapply(features.txt, tolower) 
                                 
        
#       Begin making the feature names human readable
        
        features.txt_AllLower_1 <- sub("t","time", features.txt_AllLower)
        
#       Remove all special characters from the feature names, making it 
#       Tidy "(" "." "," ")" etc. Continue making the feature data set Tidy by 
#       giving the features unique and descriptive names that are fully human 
#       readable
        
        
        ### The folowing line of code completes "part 4" of the assignment:
        ### Appropriately label the data set with descriptive variable names ###
        
        features.txt_AllLowerTidy <- features.txt_AllLower_1 %>%
                gsub(",","",.) %>% 
                gsub("-","",.) %>%
                gsub("\\(","",.) %>%
                gsub("\\)","",.) %>%
                gsub(" ","",.) %>%
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
                
                
                
                
#       Now that all the features have descriptive and unique variable names,
#       we can "clip" them on to the main observational data frame and use
#       them as column (feature) names
        
        colnames(z_x_test_train_stack) <- c(features.txt_AllLowerTidy)
        
        
#       "Clip" the participant number and activity name data frames together
        
        participant_activity <- bind_cols(z_subject_test_train_stack,z_y_test_train_stack)
        
        
#       "Clip" the participant number and activity name data frame to the
#       main data frame that contains all of the observational data.
        
        
        ### The following line of code completes "part 1" of the assignment: Merge
        ### the training and test sets to create one data set ###
       
        participant_activity_obs <- bind_cols(participant_activity, z_x_test_train_stack)
        
        
#       Convert the column "participantnumber" to the Factor data type for later analysis
         
        participant_activity_obs$participantnumber <- as.factor(participant_activity_obs$participantnumber) 
        
        
        
        ### The following line of code completes "part 2" of the assignment:
        ### extract only the measurements on the mean and standard deviation 
        ### for each measurement ###
        
        participant_activity_obs_avg_sd_selected <- participant_activity_obs %>%
                select(contains("participantnumber"), contains("activityname"), 
                       contains("mean"), contains("standarddeviation"))
        
        
#       Group the data set by columns "participantnumber" and "activity" 
        
        participant_activity_obs_avg_sd_selected_grouped <- participant_activity_obs_avg_sd_selected %>%
               arrange(.,participantnumber,activityname) 
        
        
        
        ### the following lines of code completes "part 5" of the assignment: From
        ### the data set in step 4, create a second independent tidy data set 
        ### with the average of each variable for each activity and each subject ###
        
        
        participant_activity_obs_avg_sd_selected_grouped1 <- aggregate(.~ participantnumber + activityname ,participant_activity_obs_avg_sd_selected_grouped, mean)
                
        
        
        write.table(participant_activity_obs_avg_sd_selected_grouped1, file = "tidydataset.txt", sep = "\t", row.names = FALSE)
        
        
        
        
        
}




