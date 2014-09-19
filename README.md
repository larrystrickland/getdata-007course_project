Getting and Cleaning Data (007) Course Project
=========================

### Introduction

This Repo holds my solution to the Course Proeject for Getting and Cleaning Data (007 - presumably the 7th time this has run)

Other than this readme.md files there are two files in this repo.
      1. run_analysis.R a script the performs the data cleaning
      2. data_dictionary.md a Data Dictionary for the resulting data
      
The run_analysis script will operate on data stored in a folder called "UCI HAR Dataset" - which is exactly what happens if you unzip the original <provide link> set as part of the course project.  

To run the script you must have the dplyr library installed.  The script will load the library

The script organizes and cleans the data by (although not necessarily in order):
      - Combining the various observations , subjects , and activity files
      - Merging the result with the activity labels
      - Adding Variable Names (Subject, Activity, and the various features)
      - Removing unnecessary columns - determined if the feature didn't have std() or mean() as part of the feature
      - Converting the Variable Names to something much easier to interpret (See DataDictionary)
      
The result from this process is a data.frame called allsyx

The allsyx data.frame was then processed to provide a data.frame finalGroupBy that provides the means of the means and std when grouped by Activity or Subject.

