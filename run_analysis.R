#run_analysis.R
# 
# Courcera - Cleaning Data Course - May / 2015
# 
# Cource Project - You can find details in README.md
#
# This script create one R script called run_analysis.R that does the following: (according to the specification) 
#
# 1 - Merges the training and the test sets to create one data set.                            
#                                              -------------------
#                                                      \_____________ Write a txt tyde file with the merge source files
#
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names. 
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#                                 ----------------
#                                        \__________________ Final file that meets the project
#

# Working variables

WhereIsFeatures  <- 'UCI HAR Dataset/features.txt'            # Local and name of the features file
WhereIsX_test    <- 'UCI HAR Dataset/test/X_test.txt'         # Local and name of the test  X file
WhereIsX_train   <- 'UCI HAR Dataset/train/X_train.txt'       # Local and name of the train X file
WhereIsY_test    <- 'UCI HAR Dataset/test/Y_test.txt'         # Local and name of the test  Y file
WhereIsY_train   <- 'UCI HAR Dataset/train/Y_train.txt'       # Local and name of the train Y file
WhereIsSub_test  <- 'UCI HAR Dataset/test/subject_test.txt'   # Local and name of the test  subject file
WhereIsSub_train <- 'UCI HAR Dataset/train/subject_train.txt' # Local and name of the train subject file
WhereIsActivity  <- 'UCI HAR Dataset/activity_labels.txt'     # Local and name of the activity labels file
WhereWriteMerge  <- './data_merged.txt'                       # Local and name of the merged data
WhereWriteTidy   <- './tidy_data.txt'                         # Local and name of the tidy data final

# Read file feature.txt
features <- read.table(WhereIsFeatures)
# Identifying  mean and standard deviation 
MeanStd  <- grepl('mean\\(',features[,2]) | grepl('std\\(',features[,2])

# Adjust labels
AdjLabels <- gsub('-','_',features[,2])
AdjLabels <- gsub('\\(|\\)','',AdjLabels)
ColumnClass <- rep('NULL', length(MeanStd))
ColumnClass[MeanStd] <- 'numeric'

# Read and joining  X files
FileTestX  <- read.table(WhereIsX_test ,col.names = AdjLabels,colClasses=ColumnClass)
FileTrainX <- read.table(WhereIsX_train,col.names = AdjLabels,colClasses=ColumnClass)
JoinedX <- rbind(FileTestX,FileTrainX)

# Read and joining  Y files
FileTestY  <- read.table(WhereIsY_test ,col.names = 'Activity')
FileTrainY <- read.table(WhereIsY_train,col.names = 'Activity')
JoinedY <- rbind(FileTestY,FileTrainY)

# Read and joining  subject files
TestSub  <- read.table(WhereIsSub_test ,col.names = 'Subject')
TrainSub <- read.table(WhereIsSub_train,col.names = 'Subject')
JoinedSub  <- rbind(TestSub,TrainSub)

# Merge data
MergedData = cbind(JoinedSub,JoinedY,JoinedX)     
ActLabels = read.table(WhereIsActivity,col.names = c('Activity','Activity_Label'))
MergedData = merge(ActLabels,MergedData)[,-1]

## Write a txt tyde file with the merged source files
write.table(MergedData, file = WhereWriteMerge, row.names=F)

## Final file that meets the project
tidy_data = aggregate(. ~ Subject + Activity_Label, data=MergedData, FUN=mean)
write.table(tidy_data, file = WhereWriteTidy, row.names=F)

## Clean the environment
remove(WhereIsFeatures)
remove(WhereIsX_test)
remove(WhereIsX_train)
remove(WhereIsY_test)
remove(WhereIsY_train) 
remove(WhereIsSub_test)
remove(WhereIsSub_train)
remove(WhereIsActivity)
remove(WhereWriteMerge)
remove(WhereWriteTidy)
remove(MeanStd)
remove(features)
remove(ColumnClass)
remove(FileTestX,FileTrainX)
remove(FileTestY,FileTrainY)
remove(TestSub,TrainSub)
remove(JoinedSub,JoinedX,JoinedY)
remove(ActLabels)
remove(AdjLabels)
##
