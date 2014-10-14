## Getting and Cleaning Data
### Course Project README

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The project requires the following submissions:

* a link to a Github repository with an R script called run_analysis.R for performing the analysis 
* a code book called CodeBook.md that describes the variables, the data, and any transformations or work performed to clean up the data
* a README.md file explains how all of the scripts work and how they are connected  
* a tidy data set

The R script called run_analysis.R does the following:

0. Downloads the data set to the working directory, unzips the file, and records when the file was downloaded 
1. Merges the training and the test sets to create one data set
	* read and apply variable names to the training and test data files
	* combines subject, activity, and data files for training and test subjects into one master file
2. Extracts only the measurements on the mean and standard deviation for each measurement
	* use *grep* to create a list of variable names with "mean" or "std" for **inclusion**
	* use *grep* to create a second list of variable names with "meanFreq" for **exclusion**
	* use these two lists to subset the data
	* include the Subject and Activity variables in the new dataset
3. Uses descriptive activity names to name the activities in the data set
	* read in the list of activity names and labels
	* use the list as a lookup table to convert the Activity variable to a factor with descriptive names
4. Appropriately labels the data set with descriptive variable names
	* remove extra '.' characters added automatically by R in Step 1
	* make the variable names human readable
	* apply the new variable names to the dataset 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
	* create the tidy data set by aggregating the data frame
	* add the descriptive names to the Activity variable in the tidy data set
	* to make the tidy data set easier to read, sort by Activity and then by Subject
	* save the tidy data set to a text file "tidy_data.txt"
	
To read the tidy data set into R:
```
df <- read.table("tidy_data.txt", header = TRUE)
```
	