## Step 1 ~ Download the file and put the file in the data folder ##
setwd("C:/Users/skhanvilkar/Desktop/John Hopkins Data Science Certification/Course 3 Getting and Cleaning Data/Week 4")
getwd()
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
## Unzip the file ####
unzip(zipfile="./data/Dataset.zip",exdir="./data")
## unzipped files are in the folderUCI HAR Dataset. Get the list of the files###
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files
### Step 2 ~ Reading Training Files & Understand Structure #######################
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
str(dataFeaturesTrain)
names(dataFeaturesTrain)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
str(dataActivityTrain)
names(dataActivityTrain)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
str(dataSubjectTrain)
names(dataSubjectTrain)
##View(dataFeaturesTrain)
#### Reading test Files ##########################
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
str(dataFeaturesTest)
names(dataFeaturesTest)
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
str(dataActivityTest)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
str(dataSubjectTest)
##View(dataFeaturesTest)
### Reading feature Files & Understanding their structures #######################
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
str(dataFeaturesNames)
#### Reading Activity labels ############################################
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
str(activityLabels)
names(activityLabels)
#### Assigning Column Names #######################
colnames(dataFeaturesTrain) <- dataFeaturesNames[,2] 
colnames(dataActivityTrain) <-"activityId"
colnames(dataSubjectTrain) <- "subjectId"
colnames(dataFeaturesTest) <- dataFeaturesNames[,2] 
colnames(dataActivityTest) <- "activityId"
colnames(dataSubjectTest) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

#### Step 3 ~ Merge columns use of cbind to get all data ############
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)
dataCombine <- cbind(dataSubject, dataActivity)
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)
##View(Data)
### Step 4: Extracts and subsets Mean and SD for each measurement ####
colNames <- colnames(Data)
View(Data)
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)
str(Data)
##View(Data)
#### Step 5: Appropriately label the dataset ####
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)
#### Step 6: Appropriately label the dataset ####
library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
View(Data2)
