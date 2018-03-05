Human Activity Recognition Using Smartphones Data Set
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - UniversitÃ degli Studi di Genova, Genoa I-16145, Italy. 
Email: activityrecognition@smartlab.ws. Site: www.smartlab.ws.

Codebook prepared for ~ Getting and Cleaning Data ~ Week 4 ~ Project Assignment 03/04/2018.

General information about HAR data set
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency component, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by 
calculating variables from the time and frequency domain.

HAR data set includes the following files:
Information about the variables used on the feature vector: features_info.txt.
List of names of features: features.txt.
Class labels with their activity name: activity_labels.txt.
Training set: train/X_train.txt.
Training labels: train/y_train.txt.
Test set: test/X_test.txt.
Test labels: test/y_test.txt.
README.txt.
For each record it is provided:
Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.

Description of Analysis Script:
Requires plyr package for using it.

Prep Work: Step 0
See the README.txt file for the detailed information on the dataset. For the purposes of this project, the files in the Inertial Signals folders are not used. 
The files that will be used to load data are listed as follows:
test/subject_test.txt
test/X_test.txt
test/y_test.txt
train/subject_train.txt
train/X_train.txt
train/y_train.txt

Step 1 ~ Get the data
1.1.Download the file and put the file in the data folder
1.2.Unzip the file
1.3.unzipped files are in the folderUCI HAR Dataset. Get the list of the files
Step 2 ~ Read the data from the targeted files
2.1 Read Training file and understand the property/structure.
2.2 Read Test files and understand the property/structure.
2.3 Read Feature files and understand the property/structure
2.4 If need be, View the data (not a mandatory step)
Step 3 ~ Merges the training and the test sets to create one data set
3.1 Concatenate the data tables by rows - Use of rbind
Step 4 ~ Extracts and subsets Mean and SD for each measurement 
Step 5 ~ Appropriately label the dataset
Step 6 ~ Creates a second,independent tidy data set and output it



