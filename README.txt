---
title: "README"
author: "COURSERA Student"
date: "Sunday, January 25, 2015"
output: html_document
---

### Study Design ###

Data used for this activity :
Human Activity Recognition Using Smartphones Data Set
as documented :

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws 
  
  "Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For our Analysis we are only using mean and stdDev features ###

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
"

Citation
  [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


### R Script : run_analysis.R ###

Executable Assumptions:
  You have downloaded the Samsung data source zip file from :
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
    
  You have extracted the downloaded zip file to your current working directory
  with folder "UCI HAR Dataset" existing in current working directory
  
  
Execution Logic

Grabs UCT HAR Data, Processes, and outputs clean dataset of means measures by subject_id, activity

Check for reshape2 package, install if non-existant, load
Load Test Subject
Load Train Subject
Concatenate Test/Train Subject, assign column names
Load Test Activity
Load Train Activity
Concatenate Test/Train Activity, assign column names
Load Activity Label, assign column names
Merge Test/Train Activity/Label
Load Train Feature
Concatenate Test/Train Feature
Assign Test/Train Feature column names
Extract Test/Train Feature Subset
Assign Test/Train Feature Subset column names
Column bind subect, activity and test_train feature subset
Calculate mean of Subject_ID, Activity grouping
Assign Column names to Subject_ID, Activity Grouping
Write dataset to disk


### CodeBook ###

All Mean_OF (measures) are calculated by grouping the mean of all measurements by Subject_ID, Activity
3-Dimensional Coordinate System (x,y,z)
All measures normalized between -1,1 (unitless)

Subject_ID : Study Participant ID (id)(int)
Activity : LAYING/SITTING/STANDING/WALKING/WALKING_DOWNSTAIRS/WALKING_UPSTAIRS (id)(string)
Mean_Of_Time_Body_Acc_Mean_X : Body Accelleration Time Direction X  Time (mean)(float)
Mean_Of_Time_Body_Acc_Mean_Y : Body Accelleration Time Direction Y Time (mean)(float)
Mean_Of_Time_Body_Acc_Mean_Z : Body Accelleration Time Direction Z Time (mean)(float)
Mean_Of_Time_Body_Acc_Std_X :  Body Accelleration StdDev Direction X Time (mean)(float)
Mean_Of_Time_Body_Acc_Std_Y :  Body Accelleration StdDev Direction Y Time (mean)(float)
Mean_Of_Time_Body_Acc_Std_Z :  Body Accelleration StdDev Direction Z Time (mean)(float)
Mean_Of_Time_Gravity_Acc_Mean_X : Gravity Accelleration Direction X Time (mean)(float)
Mean_Of_Time_Gravity_Acc_Mean_Y : Gravity Accelleration Direction Y Time (mean)(float)
Mean_Of_Time_Gravity_Acc_Mean_Z : Gravity Accelleration Direction Z Time (mean)(float)
Mean_Of_Time_Gravity_Acc_Std_X : Gravity Accelleration StdDev Direction X Time (mean)(float)
Mean_Of_Time_Gravity_Acc_Std_Y : Gravity Accelleration StdDev Direction Y Time (mean)(float)
Mean_Of_Time_Gravity_Acc_Std_Z : Gravity Accelleration StdDev Direction Z Time (mean)(float)
Mean_Of_Time_Body_Acc_Jerk_Mean_X : Body Accelleration Jerk Direction X Time (mean)(float)
Mean_Of_Time_Body_Acc_Jerk_Mean_Y : Body Accelleration Jerk Direction Y Time (mean)(float)
Mean_Of_Time_Body_Acc_Jerk_Mean_Z : Body Accelleration Jerk Direction Z Time (mean)(float)
Mean_Of_Time_Body_Acc_Jerk_Std_X : Body Accelleration StdDev Direction X Time (mean)(float)
Mean_Of_Time_Body_Acc_Jerk_Std_Y : Body Accelleration StdDev Direction Y Time (mean)(float)
Mean_Of_Time_Body_Acc_Jerk_Std_Z : Body Accelleration StdD Dev Direction Z  Time (mean)(float)
Mean_Of_Time_Body_Gyro_Mean_X : Body Gyro Direction X Time (mean)(float)
Mean_Of_Time_Body_Gyro_Mean_Y : Body Gyro Direction Y Time (mean)(float)
Mean_Of_Time_Body_Gyro_Mean_Z : Body Gyro Direction Z Time (mean)(float)
Mean_Of_Time_Body_Gyro_Std_X : Body Gyro StdDev Direction X Time (mean)(float)
Mean_Of_Time_Body_Gyro_Std_Y : Body Gyro StdDev Direction Y Time (mean)(float)
Mean_Of_Time_Body_Gyro_Std_Z : Body Gyro StdDev Direction Z Time (mean)(float)
Mean_Of_Time_Body_Gyro_Jerk_Mean_X : Body Gyro Jerk Direction X Time (mean)(float)
Mean_Of_Time_Body_Gyro_Jerk_Mean_Y : Body Gyro Jerk Direction Y Time (mean)(float)
Mean_Of_Time_Body_Gyro_Jerk_Mean_Z : Body Gyro Jerk Direction Z Time (mean)(float)
Mean_Of_Time_Body_Gyro_Jerk_Std_X : Body Gyro Jerk StdDev X Time (mean)(float)
Mean_Of_Time_Body_Gyro_Jerk_Std_Y : Body Gyro Jerk StdDev Y Time (mean)(float)
Mean_Of_Time_Body_Gyro_Jerk_Std_Z : Body Gyro Jerk StdDev Z Time (mean)(float)
Mean_Of_Time_Body_Acc_Mag_Mean : Body Accelleration Magnitude Time (mean)(float)
Mean_Of_Time_Body_Acc_Mag_Std : Body Accelleration Magnitude Time (mean)(float)
Mean_Of_Time_Gravity_Acc_Mag_Mean : Gravity Accellertion Magnitude Time (mean)(float)
Mean_Of_Time_Gravity_Acc_Mag_Std : Gravity Accelleration Magnitude Time (mean)(float)
Mean_Of_Time_Body_Acc_Jerk_Mag_Mean : Body Jerk Magnitude Time (mean)(float)
Mean_Of_Time_Body_Acc_Jerk_Mag_Std : Body Jerk Magnitude StdDev Time (mean)(float)
Mean_Of_Time_Body_Gyro_Mag_Mean : Body Gyro Magnitude Time (mean)(float)
Mean_Of_Time_Body_Gyro_Mag_Std : Boy Gyro Magnitude StdDev Time (mean)(float)
Mean_Of_Time_Body_Gyro_Jerk_Mag_Mean : Body Gyro Jerk Magnitude Time (mean)(float)
Mean_Of_Time_Body_Gyro_Jerk_Mag_Std : Body Gyro Jerk Magnitude StdDev Time (mean)(float)
Mean_Of_Freq_Body_Acc_Mean_X : Body Accelleration Direction X Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Mean_Y : Body Accelleration Direction Y Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Mean_Z : Body Accelleration Direction Z Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Std_X : Body Accelleration StdDev Direction X Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Std_Y : Body Accelleration StdDev Direction Y Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Std_Z : Body Accelleration StdDev Direction Z Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Jerk_Mean_X : Body Accelleration Jerk Direction X Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Jerk_Mean_Y : Body Accelleration Jerk Direction Y Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Jerk_Mean_Z : Body Accelleration Jerk Direction Z Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Jerk_Std_X : Body Accelleration StdDev Jerk Direction X Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Jerk_Std_Y : Body Accelleration StdDev Jerk Direction Y Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Jerk_Std_Z : Body Accelleration StdDev Jerk Direction Z Frequency (mean)(float)
Mean_Of_Freq_Body_Gyro_Mean_X : Body Gyro Direction X Frequency (mean)(float)
Mean_Of_Freq_Body_Gyro_Mean_Y : Body Gyro Direction Y Frequency (mean)(float)
Mean_Of_Freq_Body_Gyro_Mean_Z : Body Gyro Direction Z Frequency (mean)(float)
Mean_Of_Freq_Body_Gyro_Std_X : Body Gyro StdDev Direction X Frequency (mean)(float)
Mean_Of_Freq_Body_Gyro_Std_Y : Body Gyro StdDev Direction Y Frequency (mean)(float)
Mean_Of_Freq_Body_Gyro_Std_Z : Body Gyro StdDev Direction Z Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Mag_Mean : Body Accelleration Magnitude Frequency (mean)(float)
Mean_Of_Freq_Body_Acc_Mag_Std : Body Accelleration StdDev Frequence (mean)(float)
Mean_Of_Freq_Body_Body_Acc_Jerk_Mag_Mean : Body Body Accelleration Jerk Magnitude Frequency (mean)(float)
Mean_Of_Freq_Body_Body_Acc_Jerk_Mag_Std : Body Body Accelleration Jerk StdDev Frequency (mean)(float)
Mean_Of_Freq_Body_Body_Gyro_Mag_Mean : Body Body Gyro Magnitude Frequency (mean)(float)
Mean_Of_Freq_Body_Body_Gyro_Mag_Std : Body Body Gyro Magnitude Frequency (mean)(float)
Mean_Of_Freq_Body_Body_Gyro_Jerk_Mag_Mean : Body Body Gyro Jerk Magnitude Frequency (mean)(float)
Mean_Of_Freq_Body_Body_Gyro_Jerk_Mag_Std : Body Body Gyro Jerk Magnitude StdDev Frequence (mean)(float)