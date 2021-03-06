

Study Design
=============

The data included in this dataset were orginally captured as follows:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

--

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain." [1]

--

For purposes of the assignment in this class, the following steps were performed on the original data files to output a smaller files with a summary subset of the original data (see the accompanying script file run_analysis.R):

	1 - Load the training and testing datasets each into data frame variables
	2 - Combine the two variables to produce a single data frame with all data rows from the sets
	3 - Subset the combined data to only include columns representing either a mean or standard deviation value
	4 - Replace original cryptic variable names with plain English words vs. abbreviations
	5 - The labels for the activities are then loaded from their source file into a dataframe variable
	6 - Load the activity values for each of the training and testing sets are then loaded and combined.
	7 - The activity values are then translated to their readable text factor form and the result is added to the dataframe containing the rest of the observation data.
	8 - The subject IDs for each of the training and testing datasets are loaded, combined, and the result column is added to the dataframe containing the rest of the observation data.
	9 - Sort the final combined dataframe by the Subject ID and Activity.
	10 - Write the resulting dataset out to a file. 


Code Book
=========

From the original source data

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  

-- 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

--

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The original variable names were modified to be more human readable.

> - timeBodyAcc-XYZ
> - timeGravityAcc-XYZ
> - timeBodyAccJerk-XYZ
> - timeBodyGyro-XYZ
> - timeBodyGyroJerk-XYZ
> - timeBodyAccMag
> - timeGravityAccMag
> - timeBodyAccJerkMag
> - timeBodyGyroMag
> - timeBodyGyroJerkMag
> - freqBodyAcc-XYZ
> - freqBodyAccJerk-XYZ
> - freqBodyGyro-XYZ
> - freqBodyAccMag
> - freqBodyAccJerkMag
> - freqBodyGyroMag
> - freqBodyGyroJerkMag

>The set of variables that were estimated from these signals are: 

> - mean(): Mean value
> - std(): Standard deviation

Other values removed from the output generated by the script for this class.

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

> - gravityMean
> - timeBodyAccMean
> - timeBodyAccJerkMean
> - timeBodyGyroMean
> - timeBodyGyroJerkMean

>The complete list of variables of each feature vector is available in 'features.txt'.
[1]


License / Copyright / Acknowledgments
=====================================

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

