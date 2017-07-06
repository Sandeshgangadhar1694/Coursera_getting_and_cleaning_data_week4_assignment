#download zip file from the provided location
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "wearables_dataset.zip")

#unzip the file downloaded in the current working directory
unzip("wearables_dataset.zip")


#Reading Training Data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")


#Reading Testing Data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Reading Complete Feature Data
feature <- read.table("UCI HAR Dataset/features.txt")

#Reading Activity data
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

#Naming Columns
colnames(X_train) <- feature$V2
colnames(X_test) <- feature$V2

colnames(Y_train) <- "ActivityID"
colnames(Y_test) <- "ActivityID"

colnames(subject_train) <- "SubjectID"
colnames(subject_test) <- "SubjectID"

colnames(activity) <- c("ActivityID","Activity")

#Combining Columns to form complete Training Dataset
Training_data <- cbind(subject_train,X_train,Y_train)

#Combining Columns to form complete Testing Dataset
Testing_data <- cbind(subject_test,X_test,Y_test)

#Merging both Training and Testing Dataset to one data.frame
Complete_Dataset <- rbind(Training_data,Testing_data)


#Extracts only the measurements on the mean and standard deviation for each measurement.
Required_Columns <- c(colnames(subject_train),colnames(Complete_Dataset)[grepl("mean|std",colnames(Complete_Dataset))],colnames(Y_test))

Required_Dataset <- Complete_Dataset[,Required_Columns]

rm(X_test,X_train,Y_test,Y_train,subject_test,subject_train,feature,Testing_data,Training_data,Required_Columns)


#Replacing ActivityID with Activity Name
Required_Dataset$ActivityLabel <- activity[match(Required_Dataset$ActivityID,activity$ActivityID),"Activity"]
Required_Dataset <- Required_Dataset[,which(colnames(Required_Dataset) != "ActivityID")]

#Correct Column Names
names(Required_Dataset) <- gsub(pattern = "mean",replacement = "Mean",names(Required_Dataset))
names(Required_Dataset) <- gsub(pattern = "std",replacement = "Std",names(Required_Dataset))

names(Required_Dataset) <- gsub(pattern = "-|\\(|\\)|[ID]","",names(Required_Dataset))

library(dplyr)
library(reshape2)

Required_Dataset_temp <- melt(Required_Dataset,id.vars = c("Subject","ActivityLabel"))

names(Required_Dataset_temp)[-(1:2)] <- c("Measurement","Value")

Average_DataSet <- Required_Dataset_temp %>% group_by(Subject,ActivityLabel,Measurement) %>% summarise(Measurement_Mean = mean(Value))
rm(Required_Dataset_temp)

Average_DataSet <- dcast(data = Average_DataSet,Subject + ActivityLabel ~ Measurement,value.var = "Measurement_Mean")

write.table(Average_DataSet,"AverageDataset.txt",row.names = F)

