Data Dictionary for finalGroupBy data.frame
###################################################

**activity**
Indicates what the subject was doing when the measurements were taken
Possible values of this variable are:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING
- NA (when the data has been grouped by another variable)

**subject**
An integer that represents the subject who had the phone the measurements were taken
Range 1-30

**columns 3 to 68**
Column names are descriptive.  Each will use a set of key terms that are provided here.  All variables have a range -1 to 1. 
- *gyroscope*: this is a sensor on the phone that generates some of the raw data base on rotation
- *accelerometer*: this is sensor on teh phone that generates some of the raw data based on linear acceleration
- *jerk*: refers to the the rate of change of acceleration (linear or rotational)
- *standard deviation*: The mean of the standard deviation (hey - it was what we were asked to do)
- *mean*: The mean of the variable
- *frequency domain*: Most of the data points are in the time domain.  These measurements have gone through a Fourier Transform to show in the Fequency domain
- *magnitude*: the magntide of the vaiable.
- *body*: the oringinal measurements are broken into those that are due to acceleration and those due to gravity.  THe body values are seperated from the gravity values.
- *gravity*: the gravity component of the accerlation.  

More information on how the data was processed can be found in [features_info.txt](https://github.com/larrystrickland/getdata-007course_project/blob/master/features_info.txt)
