# Getting and Cleaning Data
# Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The project requires the following:

* a link to a Github repository with an R script called run_analysis.R for performing the analysis 
* a code book called CodeBook.md that describes the variables, the data, and any transformations or work performed to clean up the data
* a README.md file explains how all of the scripts work and how they are connected  
* a tidy data set (posted to Coursera)

The R script called run_analysis.R that does the following:

0. Downloads the data set to the working directory, unzips the file, and records when the file was downloaded. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject