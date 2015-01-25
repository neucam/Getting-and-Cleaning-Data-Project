## run_analysis.R
## Grabs UCT HAR Data, Processes, and outputs clean dataset of means measures by subject_id, activity
## Project 1
## Coursera Getting and Cleaning Data
## Created : 20150125

## Check for reshape2 package, install if non-existant, load
if(!("reshape2" %in% rownames(installed.packages()))) {install.packages("reshape2")}
library("reshape2")

## Load Test Subject
file_test_subject <- "UCI HAR Dataset/test/subject_test.txt"
test_subject <- read.table(file_test_subject)

## Load Train Subject
file_train_subject <- "UCI HAR Dataset/train/subject_train.txt"
train_subject <- read.table(file_train_subject)

## Concatenate Test/Train Subject, assign column names
test_train_subject <- rbind(test_subject, train_subject)
names(test_train_subject) <- c("Subject_ID")

## Load Test Activity
file_test_activity <- "UCI HAR Dataset/test/y_test.txt"
test_activity <- read.table(file_test_activity)

## Load Train Activity
file_train_activity <- "UCI HAR Dataset/train/y_train.txt"
train_activity <- read.table(file_train_activity)

## Concatenate Test/Train Activity, assign column names
test_train_activity <- rbind(test_activity, train_activity)
names(test_train_activity) <- c("Activity_ID")

## Load Activity Label, assign column names
file_activity_label <- "UCI HAR Dataset/activity_labels.txt"
activity_label <- read.table(file_activity_label)
names(activity_label) <- c("Activity_ID", "Activity")

## Merge Test/Train Activity/Label
merged_test_train_activity = merge(test_train_activity,activity_label,all=TRUE)
Activity = merged_test_train_activity$Activity

## Load Train Feature
file_train_feature <- "UCI HAR Dataset/train/X_train.txt"
train_feature <- read.table(file_train_feature)

## Load Train Feature
file_test_feature <- "UCI HAR Dataset/test/X_test.txt"
test_feature <- read.table(file_test_feature)

## Concatenate Test/Train Feature
test_train_feature <- rbind(test_feature, train_feature)

## Assign Test/Train Feature column names
test_train_feature_vars <- c("V1", "V2", "V3", "V4", "V5", "V6", "V41", "V42", "V43", "V44", "V45", "V46", "V81", "V82", "V83", "V84", "V85", "V86", 
  "V121", "V122", "V123", "V124", "V125", "V126", "V161", "V162", "V163", "V164", "V165", "V166", "V201", "V202", "V214", 
  "V215", "V227", "V228", "V240", "V241", "V253", "V254", "V266", "V267", "V268", "V269", "V270", "V271", "V345", "V346", 
  "V347", "V348", "V349", "V350", "V424", "V425", "V426", "V427", "V428", "V429", "V503", "V504", "V516", "V517", "V529", 
  "V530", "V542", "V543")

## Extract Test/Train Feature Subset
test_train_feature_subset <- test_train_feature[test_train_feature_vars]

## Assign Test/Train Feature Subset column names
names(test_train_feature_subset) <- c("Time_Body_Acc_Mean_X",
"Time_Body_Acc_Mean_Y",
"Time_Body_Acc_Mean_Z",
"Time_Body_Acc_Std_X",
"Time_Body_Acc_Std_Y",
"Time_Body_Acc_Std_Z",
"Time_Gravity_Acc_Mean_X",
"Time_Gravity_Acc_Mean_Y",
"Time_Gravity_Acc_Mean_Z",
"Time_Gravity_Acc_Std_X",
"Time_Gravity_Acc_Std_Y",
"Time_Gravity_Acc_Std_Z",
"Time_Body_Acc_Jerk_Mean_X",
"Time_Body_Acc_Jerk_Mean_Y",
"Time_Body_Acc_Jerk_Mean_Z",
"Time_Body_Acc_Jerk_Std_X",
"Time_Body_Acc_Jerk_Std_Y",
"Time_Body_Acc_Jerk_Std_Z",
"Time_Body_Gyro_Mean_X",
"Time_Body_Gyro_Mean_Y",
"Time_Body_Gyro_Mean_Z",
"Time_Body_Gyro_Std_X",
"Time_Body_Gyro_Std_Y",
"Time_Body_Gyro_Std_Z",
"Time_Body_Gyro_Jerk_Mean_X",
"Time_Body_Gyro_Jerk_Mean_Y",
"Time_Body_Gyro_Jerk_Mean_Z",
"Time_Body_Gyro_Jerk_Std_X",
"Time_Body_Gyro_Jerk_Std_Y",
"Time_Body_Gyro_Jerk_Std_Z",
"Time_Body_Acc_Mag_Mean",
"Time_Body_Acc_Mag_Std",
"Time_Gravity_Acc_Mag_Mean",
"Time_Gravity_Acc_Mag_Std",
"Time_Body_Acc_Jerk_Mag_Mean",
"Time_Body_Acc_Jerk_Mag_Std",
"Time_Body_Gyro_Mag_Mean",
"Time_Body_Gyro_Mag_Std",
"Time_Body_Gyro_Jerk_Mag_Mean",
"Time_Body_Gyro_Jerk_Mag_Std",
"Freq_Body_Acc_Mean_X",
"Freq_Body_Acc_Mean_Y",
"Freq_Body_Acc_Mean_Z",
"Freq_Body_Acc_Std_X",
"Freq_Body_Acc_Std_Y",
"Freq_Body_Acc_Std_Z",
"Freq_Body_Acc_Jerk_Mean_X",
"Freq_Body_Acc_Jerk_Mean_Y",
"Freq_Body_Acc_Jerk_Mean_Z",
"Freq_Body_Acc_Jerk_Std_X",
"Freq_Body_Acc_Jerk_Std_Y",
"Freq_Body_Acc_Jerk_Std_Z",
"Freq_Body_Gyro_Mean_X",
"Freq_Body_Gyro_Mean_Y",
"Freq_Body_Gyro_Mean_Z",
"Freq_Body_Gyro_Std_X",
"Freq_Body_Gyro_Std_Y",
"Freq_Body_Gyro_Std_Z",
"Freq_Body_Acc_Mag_Mean",
"Freq_Body_Acc_Mag_Std",
"Freq_Body_Body_Acc_Jerk_Mag_Mean",
"Freq_Body_Body_Acc_Jerk_Mag_Std",
"Freq_Body_Body_Gyro_Mag_Mean",
"Freq_Body_Body_Gyro_Mag_Std",
"Freq_Body_Body_Gyro_Jerk_Mag_Mean",
"Freq_Body_Body_Gyro_Jerk_Mag_Std")

## Column bind subect, activity and test_train feature subset
test_train_all <- cbind (test_train_subject, Activity, test_train_feature_subset)

## Calculate mean of Subject_ID, Activity grouping
melt_test_train_all <- melt(test_train_all, id=c("Subject_ID", "Activity"))
mean_test_train_all <- dcast(melt_test_train_all, Subject_ID + Activity ~ variable, mean)

## Assign Column names to Subject_ID, Activity Grouping
names(mean_test_train_all) <- c(
"Subject_ID",
"Activity",
"Mean_Of_Time_Body_Acc_Mean_X",
"Mean_Of_Time_Body_Acc_Mean_Y",
"Mean_Of_Time_Body_Acc_Mean_Z",
"Mean_Of_Time_Body_Acc_Std_X",
"Mean_Of_Time_Body_Acc_Std_Y",
"Mean_Of_Time_Body_Acc_Std_Z",
"Mean_Of_Time_Gravity_Acc_Mean_X",
"Mean_Of_Time_Gravity_Acc_Mean_Y",
"Mean_Of_Time_Gravity_Acc_Mean_Z",
"Mean_Of_Time_Gravity_Acc_Std_X",
"Mean_Of_Time_Gravity_Acc_Std_Y",
"Mean_Of_Time_Gravity_Acc_Std_Z",
"Mean_Of_Time_Body_Acc_Jerk_Mean_X",
"Mean_Of_Time_Body_Acc_Jerk_Mean_Y",
"Mean_Of_Time_Body_Acc_Jerk_Mean_Z",
"Mean_Of_Time_Body_Acc_Jerk_Std_X",
"Mean_Of_Time_Body_Acc_Jerk_Std_Y",
"Mean_Of_Time_Body_Acc_Jerk_Std_Z",
"Mean_Of_Time_Body_Gyro_Mean_X",
"Mean_Of_Time_Body_Gyro_Mean_Y",
"Mean_Of_Time_Body_Gyro_Mean_Z",
"Mean_Of_Time_Body_Gyro_Std_X",
"Mean_Of_Time_Body_Gyro_Std_Y",
"Mean_Of_Time_Body_Gyro_Std_Z",
"Mean_Of_Time_Body_Gyro_Jerk_Mean_X",
"Mean_Of_Time_Body_Gyro_Jerk_Mean_Y",
"Mean_Of_Time_Body_Gyro_Jerk_Mean_Z",
"Mean_Of_Time_Body_Gyro_Jerk_Std_X",
"Mean_Of_Time_Body_Gyro_Jerk_Std_Y",
"Mean_Of_Time_Body_Gyro_Jerk_Std_Z",
"Mean_Of_Time_Body_Acc_Mag_Mean",
"Mean_Of_Time_Body_Acc_Mag_Std",
"Mean_Of_Time_Gravity_Acc_Mag_Mean",
"Mean_Of_Time_Gravity_Acc_Mag_Std",
"Mean_Of_Time_Body_Acc_Jerk_Mag_Mean",
"Mean_Of_Time_Body_Acc_Jerk_Mag_Std",
"Mean_Of_Time_Body_Gyro_Mag_Mean",
"Mean_Of_Time_Body_Gyro_Mag_Std",
"Mean_Of_Time_Body_Gyro_Jerk_Mag_Mean",
"Mean_Of_Time_Body_Gyro_Jerk_Mag_Std",
"Mean_Of_Freq_Body_Acc_Mean_X",
"Mean_Of_Freq_Body_Acc_Mean_Y",
"Mean_Of_Freq_Body_Acc_Mean_Z",
"Mean_Of_Freq_Body_Acc_Std_X",
"Mean_Of_Freq_Body_Acc_Std_Y",
"Mean_Of_Freq_Body_Acc_Std_Z",
"Mean_Of_Freq_Body_Acc_Jerk_Mean_X",
"Mean_Of_Freq_Body_Acc_Jerk_Mean_Y",
"Mean_Of_Freq_Body_Acc_Jerk_Mean_Z",
"Mean_Of_Freq_Body_Acc_Jerk_Std_X",
"Mean_Of_Freq_Body_Acc_Jerk_Std_Y",
"Mean_Of_Freq_Body_Acc_Jerk_Std_Z",
"Mean_Of_Freq_Body_Gyro_Mean_X",
"Mean_Of_Freq_Body_Gyro_Mean_Y",
"Mean_Of_Freq_Body_Gyro_Mean_Z",
"Mean_Of_Freq_Body_Gyro_Std_X",
"Mean_Of_Freq_Body_Gyro_Std_Y",
"Mean_Of_Freq_Body_Gyro_Std_Z",
"Mean_Of_Freq_Body_Acc_Mag_Mean",
"Mean_Of_Freq_Body_Acc_Mag_Std",
"Mean_Of_Freq_Body_Body_Acc_Jerk_Mag_Mean",
"Mean_Of_Freq_Body_Body_Acc_Jerk_Mag_Std",
"Mean_Of_Freq_Body_Body_Gyro_Mag_Mean",
"Mean_Of_Freq_Body_Body_Gyro_Mag_Std",
"Mean_Of_Freq_Body_Body_Gyro_Jerk_Mag_Mean",
"Mean_Of_Freq_Body_Body_Gyro_Jerk_Mag_Std")

## Write dataset to disk
write.table(mean_test_train_all, file = "mean_test_train_all_samsung.txt",  row.name=FALSE)

