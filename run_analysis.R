library(reshape2) 

# Loading  activity labels & features 
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt") 
activityLabels[,2] <- as.character(activityLabels[,2]) 
features <- read.table("UCI HAR Dataset/features.txt") 
features[,2] <- as.character(features[,2]) 


# Extract only the measurements on the mean and standard deviation for each measurement. 
RequiredFeatures <- grep(".*mean.*|.*std.*", features[,2]) 
RequiredFeatures.names <- features[RequiredFeatures,2] 
RequiredFeatures.names = gsub('-mean', 'Mean', RequiredFeatures.names) 
RequiredFeatures.names = gsub('-std', 'Std', RequiredFeatures.names) 
RequiredFeatures.names <- gsub('[-()]', '', RequiredFeatures.names) 


# Loading train & test datasets from the UCI HAR Dataset folder
train <- read.table("UCI HAR Dataset/train/X_train.txt")[RequiredFeatures] 
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt") 
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt") 
train <- cbind(trainSubjects, trainActivities, train) 

test <- read.table("UCI HAR Dataset/test/X_test.txt")[RequiredFeatures] 
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt") 
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt") 
test <- cbind(testSubjects, testActivities, test) 


# merge training and the test datasets to create single data set 
CombinedDataSet <- rbind(train, test) 
colnames(CombinedDataSet) <- c("subject", "activity", RequiredFeatures.names) 


# turn activities & subjects into factors 
CombinedDataSet$activity <- factor(CombinedDataSet$activity, levels = activityLabels[,1], labels = activityLabels[,2]) 
CombinedDataSet$subject <- as.factor(CombinedDataSet$subject) 
CombinedDataSet.melted <- melt(CombinedDataSet, id = c("subject", "activity")) 
CombinedDataSet.mean <- dcast(CombinedDataSet.melted, subject + activity ~ variable, mean) 
write.table(CombinedDataSet.mean, "tidy.txt", row.names = FALSE, quote = FALSE) 

