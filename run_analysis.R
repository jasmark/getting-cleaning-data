
library(utils)
library(plyr)

## load the test set, train set, and feature names
test_df = read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
train_df = read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
features_df = read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[[2]]

## combine the two dataframes into one
combined_df = rbind(test_df, train_df)

## add feature names, select out just the ones that are means or std devs
colnames(combined_df) = features_df
mean_names = grep("mean()", features_df, fixed = TRUE)
std_names = grep("std()", features_df, fixed = TRUE)
combined_df = combined_df[,(c(mean_names, std_names))]

## clean up variable names, replace abbreviations with reader-friendly words
friendly_names = names(combined_df)
friendly_names = gsub(pattern="^t", replacement="time", x=friendly_names)
friendly_names = gsub(pattern="^f", replacement="freq", x=friendly_names)
friendly_names = gsub(pattern="-?mean[(][)]-?",replacement="Mean",x=friendly_names)
friendly_names = gsub(pattern="-?std[(][)]-?",replacement="StdDev",x=friendly_names)
names(combined_df) = friendly_names


## read the activity labels and give the dataframe column names
activity_labels_df = read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
colnames(activity_labels_df) = c("ID", "Label")

## read the activity values from the two sets, merge them together, add ID column
test_activities_df = read.table("./UCI HAR Dataset/test/y_test.txt", stringsAsFactors =FALSE)
train_activities_df = read.table("./UCI HAR Dataset/train/y_train.txt", stringsAsFactors =FALSE)
all_activities_df = rbind(test_activities_df, train_activities_df)
colnames(all_activities_df)[1] = "ID"

## merge the labels in based on the IDs, add the resulting column back to the original dataframe
all_activities = join(all_activities_df, activity_labels_df, by="ID")
combined_df$Activity = all_activities$Label

test_subjects_df = read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
train_subjects_df = read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)
all_subjects_df = rbind(test_subjects_df, train_subjects_df)

combined_df$Subject = all_subjects_df$V1

final_df = combined_df[order(combined_df$Subject, combined_df$Activity),]

write.table(final_df, file="output.txt", row.names = FALSE)
