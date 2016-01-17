#function for filtering and merging datasets
dataProcessor <- function(file, activityFile, subjectFile, measuresNames, activityNames){
        # Read dataset
        message("Reading dataset '", file, "'...")
        dataset <- read.csv2(file, col.names=measuresNames, sep="", header = FALSE,
                             dec=".", colClasses=rep("numeric",length(measuresNames)))
        # Filter columns getting only mean and std ones
        dataset <- dataset[,grepl("mean|std", names(dataset))]
        dataset
        # Read activity dataset
        activityDs <- read.csv2(activityFile, sep="", header = FALSE)
        # Set meaningful names for activities
        activityDs$V1 <- factor(activityDs$V1, labels=activityNames)
        # Add to main dataset activity column read from activity dataset
        dataset <- mutate(dataset, activity=activityDs$V1)
        # Read subject dataset
        subjectDs <- read.csv2(subjectFile, sep="", header = FALSE)
        # Add to main dataset subject column read from subject dataset
        dataset <- mutate(dataset, subject=subjectDs$V1)
}

message("Start tidying UCI HAR Dataset")

library(dplyr)

if (!file.exists("./UCI HAR Dataset")){
        # Dowload the dataset in the current directory
        if (!file.exists("UCI HAR Dataset.zip"))
                download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip")
        # Unzip the dataset in the current directory
        unzip("UCI HAR Dataset.zip")
}
# read measures names
measuresNames <- read.csv2("./UCI HAR Dataset/features.txt", sep="", header = FALSE, col.names = c("Id", "Name"))$Name
#To avoid incuding meanFreq in output data
measuresNames <- gsub("meanFreq", "freq", measuresNames)
measuresNames <- gsub("\\(\\)", "", measuresNames)
measuresNames <- gsub("-", "_", measuresNames)
# Read activity names
activityNames <- read.csv2("./UCI HAR Dataset/activity_labels.txt", sep="", header = FALSE, col.names = c("Id", "Name"))$Name

# Read train dataset
trainDs <- dataProcessor("./UCI HAR Dataset/train/X_train.txt", 
                         "./UCI HAR Dataset/train/y_train.txt",
                         "./UCI HAR Dataset/train/subject_train.txt", 
                         measuresNames,
                         activityNames)
# Read test dataset
testDs <- dataProcessor("./UCI HAR Dataset/test/X_test.txt", 
                         "./UCI HAR Dataset/test/y_test.txt",
                         "./UCI HAR Dataset/test/subject_test.txt", 
                         measuresNames,
                         activityNames)

# Merge data of train and test datasets
dataset <- rbind(trainDs, testDs)

tidyDataset <- dataset %>% group_by(activity, subject) %>% summarise_each(funs(mean))

message("Writing tidy UCI HAR Dataset...")
write.table(tidyDataset, "UCI_HAR_Dataset.txt", row.name=FALSE)
message("End tidying UCI HAR Dataset")
