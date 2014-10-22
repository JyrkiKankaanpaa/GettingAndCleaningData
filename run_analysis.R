## R script was made for Coursera Course Getting and Cleaning data
## Further information about the script in Readme and CodeBook files


## take data.table library use
library(data.table)

## Read all needed data

readfile <- "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt"
features <- read.table(readfile, header = FALSE)
features<-features[,2]
##Replace spaces
features<-gsub(" |-", "_", features)



##read activity labels
readfile <- "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"
activity_labels <- fread(readfile, header = FALSE, stringsAsFactors=FALSE)
setnames(activity_labels,c("V1","V2"),c("Activity_ID","Activity_Description"))

##read  labels
readfile <- "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"
training_labels <- fread(readfile, header = FALSE, stringsAsFactors=FALSE)
readfile <- "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"
test_labels <- fread(readfile, header = FALSE, stringsAsFactors=FALSE)

##merge labels
all_labels <- rbind(training_labels,test_labels)


## remove unnescessary data
rm(training_labels,test_labels)

##Set names
setnames(all_labels,"V1","Activity_ID")

##reading data
readfile <- "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/x_train.txt"
training_data <- read.table(readfile, header = FALSE)
readfile <- "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/x_test.txt"
test_data <- read.table(readfile, header = FALSE)

##merge data
all_data <- rbind(training_data,test_data)

##deleting unnescessary data
rm(training_data,test_data)

##change datamodel
all_data <- as.data.table(all_data)


## merge labels and data
## Appropriately labels the data set with descriptive variable names.
all_data <- cbind(all_labels,all_data)
##set keys
setkey(activity_labels, Activity_ID)
setkey(all_data, Activity_ID)

## Uses descriptive activity names to name the activities in the data set
all_data_training_test <- merge(activity_labels,all_data)

##delete unnescessery data
rm(all_data,activity_labels,all_labels)

##set features
oldcolnames<-colnames(all_data_training_test)[3:563]
setnames(all_data_training_test,as.character(oldcolnames),as.character(features))

##subset
#Extracts only the measurements on the mean and standard deviation for each measurement.
list_of_cols<-{grepl( "Activity_ID|mean()|std()" , names( all_data_training_test ) )}
subset_std_mean <- all_data_training_test[ ,list_of_cols , with = FALSE]


##crete tidy data
##tidy_data<-ddply(subset_std_mean,.(Activity_ID), function(df) mean(df[,7]))
tidy_data<-subset_std_mean[, lapply(.SD, mean), by=Activity_ID]
tidy_data <- as.data.table(tidy_data)
setkey(tidy_data, Activity_ID)
tidy_data <- merge(activity_labels,tidy_data)

## Writing tidy data to file
write.table(tidy_data, "./tidy_data.txt", sep="\t",row.name=FALSE)
