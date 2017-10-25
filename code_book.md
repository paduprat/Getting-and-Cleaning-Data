# Code Book - Getting and Cleaning Data

This document describes the contents of *tidy_dataset.csv* and *average_summary.csv* data files, as well as the data transformations applied during the execution of *run_analysis.R* .

1. ***run_analysis.R* procedures and transformations**

   1. Loads the dplyr package
   2. Loads the training dataset (*subject_train.txt*, *X_train.txt* and *y_train.txt*) and the test datasets (*subject_test.txt*, *X_test.txt* and *y_test.txt*) data files using the read.table function.
   3. Loads the *features.txt* file which contains the variable names for the *X_train.txt* and *X_test.txt* datasets.
   4. Loads the *activity_labels.txt* file that contains the descriptions for the activities that the subjects performed during the study. 
   5. Applies the variable names from *features.txt* to the *X_train.txt* and *X_test.txt* datasets.
   6. Uses the names from the previous step to select and keep only the variables related to mean() and std() measurements. 
   7. Renames the variables that describe that subjects IDs and activity IDs to *subjectID* and *activityID*
   8. Binds the columns *subjectID* and *activityID* to the train and test datasets
   9. Binds the rows from the train and test dataset, creating a single complete dataset.
   10. Merges the *activity_labels* to the complete dataset.
   11. Uses the *group_by()* function from the dplyr package to calculate the means for each variable in the complete dataset, grouping the results by subjectID and activityID.

   ​

2. **tidy_dataset.csv** and **average_summary.csv**

   Both datasets contain the following variables:

   | Variable Name               | Description                              |
   | --------------------------- | ---------------------------------------- |
   | activityId                  | Unique identifier for the activities performed by the subjects. |
   | activity                    | Textual description for the activities performed. |
   | subjectd                    | Unique identifier for the subjects in the study. |
   | tBodyAccMag-mean()          | Body linear acceleration magnitude mean. |
   | tBodyAccMag-std()           | Body linear acceleration magnitude standard deviation. |
   | tGravityAccMag-mean()       | Gravity acceleration magnitude mean.     |
   | tGravityAccMag-std()        | Gravity acceleration magnitude standard deviation. |
   | tBodyAccJerkMag-mean()      | Body linear acceleration Jerk signal mean |
   | tBodyAccJerkMag-std()       | Body linear acceleration Jerk signal standard deviation |
   | tBodyGyroMag-mean()         | Body gyroscope magnitude mean            |
   | tBodyGyroMag-std()          | Body gyroscope magnitude standard deviation |
   | tBodyGyroJerkMag-mean()     | Body gyroscope magnitude Jerk signal mean |
   | tBodyGyroJerkMag-std()      | Body gyroscope magnitude Jerk signal standard deviation |
   | fBodyAccMag-mean()          | Fast fourier transformed body accel. magnitude mean |
   | fBodyAccMag-std()           | Fast fourier transformed body accel. magnitude std. dev. |
   | fBodyBodyAccJerkMag-mean()  | Fast fourier transformed body accel. magnitude Jerk mean |
   | fBodyBodyAccJerkMag-std()   | Fast fourier transformed body accel. magnitude Jerk std. dev. |
   | fBodyBodyGyroMag-mean()     | Fast fourier transformed body gyroscope magnitude mean |
   | fBodyBodyGyroMag-std()      | Fast fourier transformed body gyroscope magnitude std. dev. |
   | fBodyBodyGyroJerkMag-mean() | Fast fourier transformed body gyroscope mag. Jerk mean |
   | fBodyBodyGyroJerkMag-std()  | Fast fourier transformed body gyroscope mag. Jerk std. dev. |

