# Getting and Cleaning Data
# Course Project

# Step 5 of the script requires the 'reshape2' package.

######## 
## 0. Get the data.
########

# set working directory
setwd("~/Documents/Coursera/Getting and Cleaning Data")

# download the data set
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "UCI_HAR_Dataset.zip", method = "curl")

# record when the file was downloaded
dateDownloaded <- date()
dateDownloaded

# unzip the data set
unzip("UCI_HAR_Dataset.zip")

# list the files
list.files("./UCI HAR Dataset")
list.files("./UCI HAR Dataset/test")
list.files("./UCI HAR Dataset/train")

# cleanup
rm("fileUrl")

######## 
## 1. Merge the training and the test sets to create one data set.
########

# set the path to the dataset
path <- "~/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/"

# read variable names
varnames <- read.table(paste(path,'features.txt', sep = ''), 
                       header = FALSE, col.names=c("number", "name"),
                       stringsAsFactors = FALSE)

# read training and test data files
# we'll apply the raw variable names now in order to make Step 2 easier
# and then clean them up in Step 4
train.d <- read.table(paste(path,'train/X_train.txt', sep = ''), 
                      header = FALSE, col.names = varnames$name)
test.d <- read.table(paste(path,'test/X_test.txt', sep = ''), 
                     header = FALSE, col.names = varnames$name)

# read subject files
train.s <- read.table(paste(path,'train/subject_train.txt', sep = ''), 
                      header = FALSE, col.names = "subject")
test.s <- read.table(paste(path,'test/subject_test.txt', sep = ''), 
                     header = FALSE, col.names = "subject")

# read activity files
train.a <- read.table(paste(path,'train/y_train.txt', sep = ''), 
                      header = FALSE, col.names = "activity")
test.a <- read.table(paste(path,'test/y_test.txt', sep = ''), 
                     header = FALSE, col.names = "activity")

# combine the training files
train.data <- cbind(train.s, train.a, train.d)

# combine the test files
test.data <- cbind(test.s, test.a, test.d)

# merge the combined training and test files
df.all <- rbind(train.data, test.data)

# cleanup
rm(list="train.d","train.a","train.s","test.d","test.a","test.s", "train.data",
   "test.data", "varnames")

######## 
## 2. Extract only the measurements on the mean and standard 
## deviation for each measurement. 
########

# create a list of variables to keep
# use grep to identify variables with "mean" or "std" in the name
# include the "subject" and "activity" variables in the list
keep <- c("subject", "activity", grep ("mean|std", names(df.all), value = TRUE))

# create a second list of variables with "meanFreq" in the name
# we want to exclude these 
drop <- grep ("meanFreq", names(df.all), value = TRUE)

# subset the data
df <- subset(df.all, select = names(df.all) %in% keep)
df <- subset(df, select = !names(df) %in% drop)

# cleanup
rm(list="keep", "drop", "df.all")

######## 
## 3. Use descriptive activity names to name the activities in the data set.
########

# get activity names to use as a lookup table
a.labels <- read.table(paste(path,'activity_labels.txt', sep = ''), 
                     header = FALSE, col.names = c("number", "name"),
                     stringsAsFactors = FALSE)

# create a factor to replace activity numbers with descriptive names
df$activity <- factor(df$activity, levels = a.labels$number,
                       labels = tolower(a.labels$name))

# cleanup
rm("a.labels")

######## 
## 4. Appropriately label the data set with descriptive variable names. 
########

# get the list of raw variable names from the data set
list <- colnames(df)

# remove the extra "." characters in the variable names
# that were added automatically by R in Step 1
# because "-" and "()" are not valid characters for variable names
list <- gsub("\\.\\.", "", list, perl = TRUE)

# make the variable names human readable
# insert dots between words as required
oldval <- c("BodyBody", "Body", "Acc", "Gyro", "Mag", "^t", "^f", "Gravity", "Jerk")
newval <- c("body.", "body.", "acceleration.", "gyroscope.", "magnitude", 
            "time.", "frequency.", "gravity.", "jerk.")

for (i in seq_along(oldval)) {
    list <- gsub(oldval[[i]], newval[[i]], list, perl = TRUE)
}

# additional minor cleanup, convert all characters to lower case
list <- gsub("\\.\\.", ".", list, perl = TRUE)
list <- tolower(list)

# apply the new variable names to the data file
colnames(df) <- list

# cleanup
rm(list=c("oldval", "newval", "list", "i"))

######## 
## 5. From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and each subject.  
########

# create the tidy dataset using the 'reshape2' package to compute the mean for each variable
# across all activity/subject combinations
library(reshape2)
df.tidy <- melt(df, id = c("activity", "subject"))
df.tidy <- dcast(df.tidy, activity + subject ~ variable, mean)

# save the tidy data set to a text file
write.table(df.tidy, "tidy_data.txt", row.name = FALSE)


