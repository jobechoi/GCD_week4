run_analysis<-function(){
  # Set working directory to UCI HAR Dataset
  # setwd("./UCI HAR Dataset/")
  
  # Read label files
  acti_labels<-read.table("activity_labels.txt")
  feats<-read.table("features.txt")
  
  # Read the test and train data
  subj_test<-read.table("./test/subject_test.txt")
  X_test<-read.table("./test/X_test.txt")
  y_test<-read.table("./test/y_test.txt")
  
  subj_train<-read.table("./train/subject_train.txt")
  X_train<-read.table("./train/X_train.txt")
  y_train<-read.table("./train/y_train.txt")
  
  # Add variable $set to identify type of subject, 
  # then rename subject identifier variable to $subject_id
  subj_test$set<-"test"
  subj_train$set<-"train"
  
  colnames(subj_test)[1]<-"subject_id"
  colnames(subj_train)[1]<-"subject_id"
  
  # For descriptive measures, replace features as 
  # name of variables of X_train and X_test
  colnames(X_test)<-feats$V2
  colnames(X_train)<-feats$V2
  
  # Subset X_train and X_test for only variables names 
  # matching "mean()" and "std()"
  coltest<-grep("((mean|std)\\Q(\\E\\Q)\\E)",names(X_test), value = TRUE)
  X_test<-X_test[,coltest]
  coltrain<-grep("((mean|std)\\Q(\\E\\Q)\\E)",names(X_train), value = TRUE)
  X_train<-X_train[,coltrain]
  
  # Rename default variable of y_* to "activity"
  colnames(y_test)[1]<-"activity"
  colnames(y_train)[1]<-"activity"
  
  # Replace activity ids with activity labels
  y_train$activity<-acti_labels[match(y_train$activity,acti_labels$V1),2]
  y_test$activity<-acti_labels[match(y_test$activity,acti_labels$V1),2]
  
  # Merge activity variables to their measures (y_* to X_*) with temp df
  mtest<-data.frame(y_test,X_test)
  mtrain<-data.frame(y_train,X_train)
  
  # Cleanup
  rm(X_test);rm(X_train)
  rm(y_test);rm(y_train)
  rm(feats)
  
  # Merge subject variables to their measures (subject_* to X_*)
  mtest<-data.frame(subj_test,mtest)
  mtrain<-data.frame(subj_train,mtrain)
  
  # Row bind the test and train sets
  mfinal<-rbind(mtest,mtrain)
  
  # Set for final analysis, with $set excluded
  slvset<-mfinal[,-2]
  
  # Dataset of averages of each activity and each subject
  slv<-aggregate(.~activity+subject_id,slvset,mean,drop=FALSE)
  
  slv
}