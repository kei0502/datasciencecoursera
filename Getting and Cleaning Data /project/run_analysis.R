#Read files
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
subject_test<-read.table("test/subject_test.txt")
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
subject_train<-read.table("train/subject_train.txt")
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")
#Column bind y_test and subject_test and add column names 'Activity' and 'Subject' to A
A<-cbind(y_test,subject_test)
colnames(A)<-c("Activity","Subject")
#Column bind y_train and subject_train and add column names 'Activity' and 'Subject' to B
B<-cbind(y_train,Subject=subject_train)
colnames(B)<-c("Activity","Subject")
#Merge A and B to C
C<-rbind(A,B)
#Merge X_train and X_test data to D
D<-rbind(x_test,x_train)
#Change column names of D from features.txt
colnames(D)<-features$V2
#Eliminate columns from D which do not have "mean" or "std" in the column names to E
E<-D[,grep("-mean\\(\\)|-std\\(\\)",colnames(D))]
#Column bind C and E to F
F<-cbind(C,E)
#Take mean of observations per activity per subject
sp<-split(F,F[,c("Activity","Subject")])
result<-aggregate(F[,3:ncol(F)], F[,c("Activity","Subject")],mean)
#Replace activity numbers with Activity names from activity_lables
as.character(result$Activity)
for(i in 1:nrow(activity_labels)){
  result$Activity<-gsub(activity_labels[i,1],activity_labels[i,2],result$Activity)
}
#Appropriately labels the data set with descriptive variable names
colnames(result)<-gsub("^t","time",colnames(result))
colnames(result)<-gsub("^f","frequency",colnames(result))
colnames(result)<-gsub("Acc","Accelerometer",colnames(result))
colnames(result)<-gsub("Gyro","Gyroscope",colnames(result))
colnames(result)<-gsub("Mag","Magnitude",colnames(result))
#Use write.table to get a text file from the above Data Frame
write.table(result,"tidyDataSet.txt",row.name=FALSE)