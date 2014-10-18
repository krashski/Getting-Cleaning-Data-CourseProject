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

The data set was labeled with descriptive variable names in order to make the variable names human readable. Specifically:

- 'BodyBody' was replaced with 'Body' for six frequency domain variables (this looks like an error in the original file)
- 'Acceleration' was substituted for 'Acc'
- 'Gyroscope' was substituted for 'Gyro' 
- 'Magnitude' was substituted for 'Mag' 
- 'Time' was added to the beginning of variable starting with 't' to indicate time domain variables
- 'Frequency' was added to the beginning of variable starting with 'f' to indicate frequency domain variables

Characters that are not valid for variable names in R such as '-' and '()-' were replaced with a single period '.'.

The original and new variable names are as follows:

Original Variable Name | New Variable Name
---------------------- | -----------------
tBodyAcc-mean()-X | TimeBodyAcceleration.mean.X
tBodyAcc-mean()-Y | TimeBodyAcceleration.mean.Y
tBodyAcc-mean()-Z | TimeBodyAcceleration.mean.Z
tBodyAcc-std()-X | TimeBodyAcceleration.std.X
tBodyAcc-std()-Y | TimeBodyAcceleration.std.Y
tBodyAcc-std()-Z | TimeBodyAcceleration.std.Z
tGravityAcc-mean()-X | TimeGravityAcceleration.mean.X
tGravityAcc-mean()-Y | TimeGravityAcceleration.mean.Y
tGravityAcc-mean()-Z | TimeGravityAcceleration.mean.Z
tGravityAcc-std()-X | TimeGravityAcceleration.std.X
tGravityAcc-std()-Y | TimeGravityAcceleration.std.Y
tGravityAcc-std()-Z | TimeGravityAcceleration.std.Z
tBodyAccJerk-mean()-X | TimeBodyAccelerationJerk.mean.X
tBodyAccJerk-mean()-Y | TimeBodyAccelerationJerk.mean.Y
tBodyAccJerk-mean()-Z | TimeBodyAccelerationJerk.mean.Z
tBodyAccJerk-std()-X | TimeBodyAccelerationJerk.std.X
tBodyAccJerk-std()-Y | TimeBodyAccelerationJerk.std.Y
tBodyAccJerk-std()-Z | TimeBodyAccelerationJerk.std.Z
tBodyGyro-mean()-X | TimeBodyGyroscope.mean.X
tBodyGyro-mean()-Y | TimeBodyGyroscope.mean.Y
tBodyGyro-mean()-Z | TimeBodyGyroscope.mean.Z
tBodyGyro-std()-X | TimeBodyGyroscope.std.X
tBodyGyro-std()-Y | TimeBodyGyroscope.std.Y
tBodyGyro-std()-Z | TimeBodyGyroscope.std.Z
tBodyGyroJerk-mean()-X | TimeBodyGyroscopeJerk.mean.X
tBodyGyroJerk-mean()-Y | TimeBodyGyroscopeJerk.mean.Y
tBodyGyroJerk-mean()-Z | TimeBodyGyroscopeJerk.mean.Z
tBodyGyroJerk-std()-X | TimeBodyGyroscopeJerk.std.X
tBodyGyroJerk-std()-Y | TimeBodyGyroscopeJerk.std.Y
tBodyGyroJerk-std()-Z | TimeBodyGyroscopeJerk.std.Z
tBodyAccMag-mean() | TimeBodyAccelerationMagnitude.mean
tBodyAccMag-std() | TimeBodyAccelerationMagnitude.std
tGravityAccMag-mean() | TimeGravityAccelerationMagnitude.mean
tGravityAccMag-std() | TimeGravityAccelerationMagnitude.std
tBodyAccJerkMag-mean() | TimeBodyAccelerationJerkMagnitude.mean
tBodyAccJerkMag-std() | TimeBodyAccelerationJerkMagnitude.std
tBodyGyroMag-mean() | TimeBodyGyroscopeMagnitude.mean
tBodyGyroMag-std() | TimeBodyGyroscopeMagnitude.std
tBodyGyroJerkMag-mean() | TimeBodyGyroscopeJerkMagnitude.mean
tBodyGyroJerkMag-std() | TimeBodyGyroscopeJerkMagnitude.std
fBodyAcc-mean()-X | FrequencyBodyAcceleration.mean.X
fBodyAcc-mean()-Y | FrequencyBodyAcceleration.mean.Y
fBodyAcc-mean()-Z | FrequencyBodyAcceleration.mean.Z
fBodyAcc-std()-X | FrequencyBodyAcceleration.std.X
fBodyAcc-std()-Y | FrequencyBodyAcceleration.std.Y
fBodyAcc-std()-Z | FrequencyBodyAcceleration.std.Z
fBodyAccJerk-mean()-X | FrequencyBodyAccelerationJerk.mean.X
fBodyAccJerk-mean()-Y | FrequencyBodyAccelerationJerk.mean.Y
fBodyAccJerk-mean()-Z | FrequencyBodyAccelerationJerk.mean.Z
fBodyAccJerk-std()-X | FrequencyBodyAccelerationJerk.std.X
fBodyAccJerk-std()-Y | FrequencyBodyAccelerationJerk.std.Y
fBodyAccJerk-std()-Z | FrequencyBodyAccelerationJerk.std.Z
fBodyGyro-mean()-X | FrequencyBodyGyroscope.mean.X
fBodyGyro-mean()-Y | FrequencyBodyGyroscope.mean.Y
fBodyGyro-mean()-Z | FrequencyBodyGyroscope.mean.Z
fBodyGyro-std()-X | FrequencyBodyGyroscope.std.X
fBodyGyro-std()-Y | FrequencyBodyGyroscope.std.Y
fBodyGyro-std()-Z | FrequencyBodyGyroscope.std.Z
fBodyAccMag-mean() | FrequencyBodyAccelerationMagnitude.mean
fBodyAccMag-std() | FrequencyBodyAccelerationMagnitude.std
fBodyBodyAccJerkMag-mean() | FrequencyBodyAccelerationJerkMagnitude.mean
fBodyBodyAccJerkMag-std() | FrequencyBodyAccelerationJerkMagnitude.std
fBodyBodyGyroMag-mean() | FrequencyBodyGyroscopeMagnitude.mean
fBodyBodyGyroMag-std() | FrequencyBodyGyroscopeMagnitude.std
fBodyBodyGyroJerkMag-mean() | FrequencyBodyGyroscopeJerkMagnitude.mean
fBodyBodyGyroJerkMag-std() | FrequencyBodyGyroscopeJerkMagnitude.std

#### Tidy Data Set

A second, independent tidy data set called 'tidy_data.txt' was created, consisting of the average of each of the 66 time and frequency domain variables for each of the 180 activity/subject combinations. 
