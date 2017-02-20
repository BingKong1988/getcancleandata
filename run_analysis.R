#this program needs dplyr
library(dplyr)
#read features name
featurename <- read.table("./UCI HAR Dataset/features.txt")
#read training data
training_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
training_activity <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
training_data <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = featurename[,2])
#read test data
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = featurename[,2])
#read activity lables
activity_lables <- read.table("./UCI HAR Dataset/activity_labels.txt")
#combine data
alldata <- rbind(cbind(training_subject, training_activity, training_data),
                 cbind(test_subject, test_activity, test_data))
#extract only mean and std measurement
selecteddata <- alldata[, c(1, 2, grep(".*mean.*|.*std.*", featurename[,2]) + 2)]
#change activity lables
selecteddata$activity <- as.factor(selecteddata$activity)
levels(selecteddata$activity) <- activity_lables[,2]
#change data set names
names(selecteddata) <- tolower(names(selecteddata))
selecteddata$activity <- tolower(selecteddata$activity)
names(selecteddata) <- gsub("()", "", names(selecteddata))
#create tidy secondary data set
tidydata <- selecteddata %>% group_by(subject, activity) %>% summarise_each(funs(mean))
write.table(tidydata, "tidydata.txt")