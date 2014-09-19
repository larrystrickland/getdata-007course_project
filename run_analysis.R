##You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of eachvariable for each activity and each subject.

## Load required libraries
library(dplyr)

###########################################
## Function used to change names 
###########################################
changenames<-function(name){
      result<-vector()
      name <- gsub("BodyBody","Body",name)
      for(s in name) {
            newname<-""
            if(grepl("mean",s)) newname<-paste(newname,"The mean of the ", sep="")
            if(grepl("std",s)) newname<-paste(newname,"The standard deviation of the ", sep="")
            if(grepl("^f",s)) newname<-gsub("mean","frequency domain mean",newname)
            if(grepl("^f",s)) newname<-gsub("standard","frequency domain standard",newname)
            if(grepl("Mag",s)) newname<-paste(newname,"magnitude of the ", sep="")
            if(grepl("Jerk", s)) newname<-paste(newname,"jerk on the ", sep="")
            if(grepl("Body", s)) newname<-paste(newname,"nody movement", sep="")
            if(grepl("Gravity", s)) newname<-paste(newname,"gravity ", sep="")
            if(grepl("Acc", s)) newname<-paste(newname,"measured by the Accelerometer ", sep="")
            if(grepl("Gyro", s)) newname<-paste(newname,"measured by the Gyroscope ", sep="")
            if(grepl("X$",s)) newname<-paste(newname,"on the X axis of the phone ", sep="")
            if(grepl("Y$",s)) newname<-paste(newname,"on the Y axis of the phone ", sep="")
            if(grepl("Z$",s)) newname<-paste(newname,"on the Z axis of the phone ", sep="")
            if(grepl("^activity",s)) newname<-"activity"
            if(grepl("^subject",s)) newname<-"subject"
            result<-c(result,newname)
      }
      result
      
}

###########################################
## This section completes steps 1-4
###########################################
      
      # path contains path to data
      dataLocation<-"UCI HAR Dataset/"
      
      ## Read table of features (to be used as variable names)
      features<-read.table(paste0(dataLocation,"features.txt"))
      
      ## Read in table of activities, and name columns
      activities<-read.table(paste0(dataLocation,"activity_labels.txt"))
      names(activities)<-c("activityNumber","activity")
      
      ## read in list of activities from train data and name column 
      #     (note use matching name from activities table)
      trainy<-read.table(paste0(dataLocation,"train/Y_train.txt")) 
      names(trainy)<-"activityNumber"
      
      ## Read in table of measurements from train data
      trainx<-read.table(paste0(dataLocation,"train/X_train.txt"))
      ## Use features table to name columns
      names(trainx)<-features[,2]
      
      ## read in table of subjects from train data and name column
      trains<-read.table(paste0(dataLocation,"train/subject_train.txt"))
      names(trains)<-"subject"
      
      ## Combine the three tables of subject, activity and measurements
      trainsyx<-cbind(trains, trainy, trainx)
      rm(trainy, trainx, trains)          #remove intermediatary datasets
      
      ## Repeat above for test data.
      testy<-read.table(paste0(dataLocation,"test/Y_test.txt"))
      names(testy)<-"activityNumber"
      
      testx<-read.table(paste0(dataLocation,"test/X_test.txt"))
      names(testx)<-features[,2]
      
      tests<-read.table(paste0(dataLocation,"test/subject_test.txt"))
      names(tests)<-"subject"
      
      testsyx<-cbind(tests, testy, testx)
      rm(testy, testx, tests)
      
      ## combine test and train data
      allsyx <- rbind(trainsyx, testsyx)
      rm(testsyx, trainsyx)          #remove intermediatary datasets
      
      ## Merge result with activities table to provide descriptive names for activities 
      #     (as opposed to numbers)
      allsyx<-merge(activities,allsyx)

      ## Remove unwanted columns
      #  Wanted columns are the activity (descriptive), subject and any column with mean() or std() in the name
      columnsToKeep<-c(FALSE, TRUE, TRUE, (grepl("mean()",features[,2],fixed=TRUE)|grepl("std()",features[,2],fixed=TRUE)))
      allsyx<-allsyx[,columnsToKeep]
      rm(activities, columnsToKeep, dataLocation)          #remove intermediatary datasets

      # Improve variable names
      # names(allsyx) <- changenames(names(allsyx))
      
      ##allsyn holds wanted dataset

###########################################
## This section completes step 5
###########################################
      #Group by activity and get mean of all columns except subject
      groupByActivity<-allsyx %>% group_by(activity) %>% summarise_each(funs(mean)) %>% mutate(subject=NA)
      #Group by subject and get mean of all columns except actvity
      groupBySubject <-allsyx %>% group_by(subject) %>% summarise_each(funs(mean)) %>% mutate(activity=NA)
      #combine results
      finalGroupBy <- rbind(groupByActivity, groupBySubject)

      names(finalGroupBy) <- changenames(names(finalGroupBy))
      rm(groupByActivity, groupBySubject, allsyx, features)    #remove intermediatary objects and functions
