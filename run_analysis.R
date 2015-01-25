library(plyr)
library(read.table)


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- file.path(getwd(), "getdata-projectfiles-UCI HAR Dataset.zip")

download.file(url,file)
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

# Step 1
# Merge the training and test sets to create one data set
###############################################################################

x_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

#create 'x' data set
x_data <- rbind(x_train, x_test)

#create 'y' data set
y_data <- rbind(y_train,y_test)

#create subject data set
Subject_data <- rbind(subject_train,subject_test)

# Step 2  
# Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

#retrieve only columns with mean and std deviation in them
mean_stddev_features <- grep("-(mean|std)\\(\\)",features[, 2])

#subset the desired columns
x_data <- x_data[,mean_stddev_features]

#rename the column names
names(x_data) <- features[mean_stddev_features, 2]

# Step 3
# Uses descriptive activity names to name the activities in the data set

activities <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

#match column names to y_data
y_data[,1] <- activities[y_data[,1],2]

#rename new column
names(y_data) <- "activity"

# Step 4
# Appropriately labels the data set with descriptive variable names. 

#name column of subject data
names(Subject_data) <- "subject"

#combine dataset
all_data <- cbind(x_data, y_data,Subject_data)

# Step 5
# From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

averages_all_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# write data to file
write.table(averages_all_data, "averages_all_data.txt", row.name=FALSE)
