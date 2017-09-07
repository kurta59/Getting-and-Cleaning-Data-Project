### Download and unzip dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")
### End download and unzip

### Part 1: Merge the training and the test sets to create one data set.
# Reading trainings tables
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Read test tables
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Read featuredr:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Read activity label:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
# End read tables

# Set column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')
# End set column names

# Merge table data sets
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAll <- rbind(mrg_train, mrg_test)
# End table data merge

### End Part 1

### Part 2: Extract only the measurements on the mean and standard deviation for each measurement.
# read and create vector of ID, mean and Std dev
colNames <- colnames(setAll)

mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

# make subset
subsetMeanAndStd <- setAll[ , mean_and_std == TRUE]

### End Part 2

### Part 3: Use descriptive activity names to name the activities in the data set
#
subsetActivityNames <- merge(subsetMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

### End Part 3

### Part 4: Appropriately labels the data set with descriptive variable names. 
# prefix t is replaced by time
# Acc is replaced by Accelerometer
# Gyro is replaced by Gyroscope
# prefix f is replaced by frequency
# Mag is replaced by Magnitude
# BodyBody is replaced by Body

names(subsetActivityNames)<-gsub("^t", "time", names(subsetActivityNames))
names(subsetActivityNames)<-gsub("^f", "frequency", names(subsetActivityNames))
names(subsetActivityNames)<-gsub("Acc", "Accelerometer", names(subsetActivityNames))
names(subsetActivityNames)<-gsub("Gyro", "Gyroscope", names(subsetActivityNames))
names(subsetActivityNames)<-gsub("Mag", "Magnitude", names(subsetActivityNames))
names(subsetActivityNames)<-gsub("BodyBody", "Body", names(subsetActivityNames))

### End Part 4

### Part 5: From the data set, create a second tidy data set with the average of each variable for each activity and each subject.
# create second set
secTidySet <- aggregate(. ~subjectId + activityId, subsetActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

# write set to text file
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)

### End Part 5