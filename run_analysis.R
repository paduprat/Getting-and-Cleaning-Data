# This script assumes that the working directory is set to the following path.
setwd("C:/R/UCI HAR Dataset")

# LOAD DPLYR PACKAGE
library(dplyr)

# LOAD THE TRAINING DATASETS
subject.train <- read.table(file = "./train/subject_train.txt")
X.train <- read.table(file = "./train/X_train.txt")
y.train <- read.table(file = "./train/y_train.txt")

# LOAD THE TEST DATASETS
subject.test <- read.table(file = "./test/subject_test.txt")
X.test <- read.table(file = "./test/X_test.txt")
y.test <- read.table(file = "./test/y_test.txt")

# LOAD THE FEATURE AND ACTIVITY LABELS
features <- read.table(file = "./features.txt")
activity_labels <- read.table(file = "./activity_labels.txt")

# USE THE FEATURE LABELS AS THE VARIABLE NAMES
names(X.train) <- features$V2 
names(X.test) <- features$V2

# KEEP ONLY MEAN() AND SD() RELATED VARIABLES
X.train <- X.train[,endsWith(names(X.train),"mean()") | endsWith(names(X.train),"std()")]
X.test <- X.test[,endsWith(names(X.test),"mean()") | endsWith(names(X.test),"std()")]

# GIVE MEANINFUL NAMES TO THE VARIABLES ON THE SUBJECT, ACTIVITY AND Y DATASETS
names(subject.train) <- 'subjectId'
names(subject.test) <- 'subjectId'
names(y.train) <- 'activityId'
names(y.test) <- 'activityId'
names(activity_labels) <- c('activityId','activity')

# COLUMN BIND THE SUBJECT AND Y IDs TO THE TRAIN/TEST DATA

trainDataset <- cbind(subject.train, y.train, X.train)
testDataset <- cbind(subject.test, y.test, X.test)

# ROW BIND THE TRAIN AND TEST DATASETS
completeDataset <- rbind(trainDataset, testDataset)

# MERGE THE ACTIVITY LABELS AND THE DATA
completeDataset <- merge(activity_labels, completeDataset, by = 'activityId')

# REMOVE THE ORIGINAL DATASETS
rm(subject.test, subject.train, X.test, X.train, y.test, y.train, features, activity_labels, testDataset, trainDataset)

# CONVERT DATA FRAME TO TIBBLE
completeDataset <- as_tibble(completeDataset)

# CREATES THE SUMMARIZED DATASET
completeDataset <- group_by(completeDataset, subjectId, activity)
averageSummary <- summarize_all(completeDataset, mean)
completeDataset <- ungroup(completeDataset)

# WRITES THE TWO DATASETS 
#write.table(completeDataset, file = "TidyDataset.csv", sep = ',', na = '', row.names = FALSE)
#write.table(averageSummary, file = "SummaryDataset.csv", sep = ',', na = '', row.names = FALSE)
