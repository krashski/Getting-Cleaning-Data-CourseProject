## Getting and Cleaning Data
### Code Book

#### Human Activity Recognition Using Smartphones Dataset
#### Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory 

DITEN - Universite degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

### The Raw Data

The data files for the project are located at:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#### Notes: 

- Features are normalized and bounded within [-1, 1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

#### License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

### Data Transformation

#### Subset

A subset of 66 time and frequency domain variables were selected for further analysis. These variables consist of the measurements on the mean and standard deviation for each measurement, as identified by 'mean' or 'std' in the variable name. **Note that variables with 'meanFreq' in the name were excluded from this list, as these variables are the weighted average of the frequency components to obtain a mean frequency and do not have a corresponding standard deviation variable.**

#### Activity Names

Descriptive activity names were added to the 'activity' variable based on the information provided in the 'activity_labels.txt' file:

Class Label  | Activity Name
------------ | -------------
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING

#### Descriptive Variable Names

The data set was labeled with descriptive variable names in order to make the variable names human readable. 

Specifically:

- 'BodyBody' was replaced with 'body' for six frequency domain variables (this looks like an error in the original file)
- 'acceleration' was substituted for 'Acc'
- 'gyroscope' was substituted for 'Gyro' 
- 'magnitude' was substituted for 'Mag' 
- 'time' was added to the beginning of variable starting with 't' to indicate time domain variables
- 'frequency' was added to the beginning of variable starting with 'f' to indicate frequency domain variables

Characters that are not valid for variable names in R such as '-' and '()-' were removed.

Variable names were converted to all lower case letters with words separated by dots, as per Google's R Style Guide (http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml#identifiers). 

The recoded variable names are as follows:

Original Variable Name | New Variable Name
---------------------- | -----------------
tBodyAcc-mean()-X | time.body.acceleration.mean.x
tBodyAcc-mean()-Y | time.body.acceleration.mean.y
tBodyAcc-mean()-Z | time.body.acceleration.mean.z
tBodyAcc-std()-X | time.body.acceleration.std.x
tBodyAcc-std()-Y | time.body.acceleration.std.y
tBodyAcc-std()-Z | time.body.acceleration.std.z
tGravityAcc-mean()-X | time.gravity.acceleration.mean.x
tGravityAcc-mean()-Y | time.gravity.acceleration.mean.y
tGravityAcc-mean()-Z | time.gravity.acceleration.mean.z
tGravityAcc-std()-X | time.gravity.acceleration.std.x
tGravityAcc-std()-Y | time.gravity.acceleration.std.y
tGravityAcc-std()-Z | time.gravity.acceleration.std.z
tBodyAccJerk-mean()-X | time.body.acceleration.jerk.mean.x
tBodyAccJerk-mean()-Y | time.body.acceleration.jerk.mean.y
tBodyAccJerk-mean()-Z | time.body.acceleration.jerk.mean.z
tBodyAccJerk-std()-X | time.body.acceleration.jerk.std.x
tBodyAccJerk-std()-Y | time.body.acceleration.jerk.std.y
tBodyAccJerk-std()-Z | time.body.acceleration.jerk.std.z
tBodyGyro-mean()-X | time.body.gyroscope.mean.x
tBodyGyro-mean()-Y | time.body.gyroscope.mean.y
tBodyGyro-mean()-Z | time.body.gyroscope.mean.z
tBodyGyro-std()-X | time.body.gyroscope.std.x
tBodyGyro-std()-Y | time.body.gyroscope.std.y
tBodyGyro-std()-Z | time.body.gyroscope.std.z
tBodyGyroJerk-mean()-X | time.body.gyroscope.jerk.mean.x
tBodyGyroJerk-mean()-Y | time.body.gyroscope.jerk.mean.y
tBodyGyroJerk-mean()-Z | time.body.gyroscope.jerk.mean.z
tBodyGyroJerk-std()-X | time.body.gyroscope.jerk.std.x
tBodyGyroJerk-std()-Y | time.body.gyroscope.jerk.std.y
tBodyGyroJerk-std()-Z | time.body.gyroscope.jerk.std.z
tBodyAccMag-mean() | time.body.acceleration.magnitude.mean
tBodyAccMag-std() | time.body.acceleration.magnitude.std
tGravityAccMag-mean() | time.gravity.acceleration.magnitude.mean
tGravityAccMag-std() | time.gravity.acceleration.magnitude.std
tBodyAccJerkMag-mean() | time.body.acceleration.jerk.magnitude.mean
tBodyAccJerkMag-std() | time.body.acceleration.jerk.magnitude.std
tBodyGyroMag-mean() | time.body.gyroscope.magnitude.mean
tBodyGyroMag-std() | time.body.gyroscope.magnitude.std
tBodyGyroJerkMag-mean() | time.body.gyroscope.jerk.magnitude.mean
tBodyGyroJerkMag-std() | time.body.gyroscope.jerk.magnitude.std
fBodyAcc-mean()-X | frequency.body.acceleration.mean.x
fBodyAcc-mean()-Y | frequency.body.acceleration.mean.y
fBodyAcc-mean()-Z | frequency.body.acceleration.mean.z
fBodyAcc-std()-X | frequency.body.acceleration.std.x
fBodyAcc-std()-Y | frequency.body.acceleration.std.y
fBodyAcc-std()-Z | frequency.body.acceleration.std.z
fBodyAccJerk-mean()-X | frequency.body.acceleration.jerk.mean.x
fBodyAccJerk-mean()-Y | frequency.body.acceleration.jerk.mean.y
fBodyAccJerk-mean()-Z | frequency.body.acceleration.jerk.mean.z
fBodyAccJerk-std()-X | frequency.body.acceleration.jerk.std.x
fBodyAccJerk-std()-Y | frequency.body.acceleration.jerk.std.y
fBodyAccJerk-std()-Z | frequency.body.acceleration.jerk.std.z
fBodyGyro-mean()-X | frequency.body.gyroscope.mean.x
fBodyGyro-mean()-Y | frequency.body.gyroscope.mean.y
fBodyGyro-mean()-Z | frequency.body.gyroscope.mean.z
fBodyGyro-std()-X | frequency.body.gyroscope.std.x
fBodyGyro-std()-Y | frequency.body.gyroscope.std.y
fBodyGyro-std()-Z | frequency.body.gyroscope.std.z
fBodyAccMag-mean() | frequency.body.acceleration.magnitude.mean
fBodyAccMag-std() | frequency.body.acceleration.magnitude.std
fBodyBodyAccJerkMag-mean() | frequency.body.acceleration.jerk.magnitude.mean
fBodyBodyAccJerkMag-std() | frequency.body.acceleration.jerk.magnitude.std
fBodyBodyGyroMag-mean() | frequency.body.gyroscope.magnitude.mean
fBodyBodyGyroMag-std() | frequency.body.gyroscope.magnitude.std
fBodyBodyGyroJerkMag-mean() | frequency.body.gyroscope.jerk.magnitude.mean
fBodyBodyGyroJerkMag-std() | frequency.body.gyroscope.jerk.magnitude.std

#### Tidy Data Set

A second, independent tidy data set called 'tidy_data.txt' was created, consisting of the average of each of the 66 time and frequency domain variables for each of the 180 activity/subject combinations. 
