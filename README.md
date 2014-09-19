Getting and Cleaning Data (007) Course Project
=========================

### Introduction

This Repo holds my solution to the Course Proeject for Getting and Cleaning Data (007 - presumably the 7th time this has run)

### Repo Contents

Other than this readme.md files there are two files in this repo.

1. run_analysis.R a script the performs the data cleaning
2. data_dictionary.md a Data Dictionary for the resulting data

### run_analysis.R
      
The run_analysis script will operate on data stored in a folder called "UCI HAR Dataset" - which is exactly what happens if you unzip the original (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) set as part of the course project.  It will created a data.frame called finalGroupBy that contains the cleaned dataset. 

#### Script Dependancies
To run the script you must have the dplyr library installed.  The script will load the library.

It is advisable to unload other libraries (I noted there appeared to be some interferance with other libraries)

The data files must be in a folder called "UCI HAR Dataset"

#### Script function

The script organizes and cleans the data by (although not necessarily in order):
- Combining the various observations , subjects , and activity files
- Merging the result with the activity labels - to provide meaningfull activity labels
- Adding Variable Names (subject, activity, and the various features)
- Removing unnecessary columns
  - determined if the feature didn't have std() or mean() as part of the feature
  - removing columns that had repeated data (such as teh activity id)
- Group the results by:
  - Creating a data.frame that calculates the mean when grouped by activity
  - Creating a data.frame that calculates the mean when grouped by subject
  - Combining the data.frame to provide the one asked for.  
- Converting the Variable Names to something much easier to interpret (See DataDictionary)
      
The final result is in the data.frame finalGroupBy

