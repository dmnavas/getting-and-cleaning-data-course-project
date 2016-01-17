#CodeBook

## Variables

### Activity Identification variables

1. activity, the activity used to get signal data. Possible values are: 
	1.a WALKING
	1.b WALKING_UPSTAIRS
	1.c WALKING_DOWNSTAIRS
	1.d SITTING
	1.e STANDING
	1.f LAYING
	
2. subject, id of the subject was measured to get signal data. 

### Signal variables

1. Signal variables come from the accelerometer and gyroscope 3_axial raw signals tAcc_XYZ and tGyro_XYZ. 

2. Time domain variable signals has prefix 't' to denote time.

3. Frequency domain variable signals has prefix 'f' to denote frecuency.

4. Signals are:

BodyAcc_[mean|std]_[XYZ], acceleration signal separation by body acceleration signal.
GravityAcc_[mean|std]_[XYZ], acceleration signal separation by gravity acceleration signal.
BodyAccJerk_[mean|std]_[XYZ], body linear acceleration derivative in time.
BodyGyro_[mean|std]_[XYZ], angular velocity signal separation by body acceleration signal.
BodyGyroJerk_[mean|std]_[XYZ], body angular velocity derivative in time.
BodyAccMag_[mean|std], magnitude of body acceleration calculated using the Euclidean norm.
GravityAccMag_[mean|std], magnitude of body gravity calculated using the Euclidean norm.
BodyAccJerkMag_[mean|std], magnitude of body linear acceleration derivative in time calculated using the Euclidean norm.
BodyGyroMag_[mean|std], magnitude of angular velocity calculated using the Euclidean norm.
BodyGyroJerkMag_[mean|std], magnitude of body angular velocity derivative in time calculated using the Euclidean norm.

5. Signal variables are grouped by activity and subject according to these two statistical functions:
	5.a mean: Mean value
	5.b std: Standard deviation

6. Pattern '_XYZ' is used to denote 3_axial signals in the X, Y and Z directions.

7. Signal variables are listed below: 

tBodyAcc_[mean|std]_[XYZ].
tGravityAcc_[mean|std]_[XYZ].
tBodyAccJerk_[mean|std]_[XYZ].
tBodyGyro_[mean|std]_[XYZ].
tBodyGyroJerk_[mean|std]_[XYZ].
tBodyAccMag_[mean|std].
tGravityAccMag_[mean|std].
tBodyAccJerkMag_[mean|std].
tBodyGyroMag_[mean|std].
tBodyGyroJerkMag_[mean|std].

fBodyAcc_[mean|std]_[XYZ].
fBodyAccJerk_[mean|std]_[XYZ].
fBodyGyro_[mean|std]_[XYZ].
fBodyAccMag_[mean|std].
fBodyAccJerkMag_[mean|std].
fBodyGyroMag_[mean|std].
fBodyGyroJerkMag_[mean|std].


