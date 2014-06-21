
setwd("Z:/CourseraStuff/CleaningData/test")
X_test<-(read.table("X_test.txt"))
Y_test<-(read.table("y_test.txt"))
subject_test<-(read.table("subject_test.txt"))

colnames(Y_test)[1]<-'v1_Y'
colnames(subject_test)[1]<-'v1_subject'
  
testdata<-cbind(X_test,Y_test,subject_test)

setwd("Z:/CourseraStuff/CleaningData/train")
X_train<-(read.table("X_train.txt"))
Y_train<-(read.table("y_train.txt"))
subject_train<-(read.table("subject_train.txt"))

traindata<-cbind(X_train,Y_train, subject_train)

colnames(Y_train)[1]<-'v1_Y'
colnames(subject_train)[1]<-'v1_subject'


alldata<-rbind(traindata,testdata)


features<-(read.table("Z:/CourseraStuff/CleaningData/features2.txt"))
names(features)

alldata2<-alldata
names(alldata2)<-features$V2

colnames(alldata2)[562]<-"v1_Y"
colnames(alldata2)[563]<-"v1_subject"
colnames(alldata2) %in% "std()"

alldata_std=grep(pattern='std()',x=names(alldata2),value=TRUE)
alldata_mean=grep(pattern='mean()',x=names(alldata2),value=TRUE) 

  
alldata3=alldata2[,c(alldata_std,alldata_mean,'v1_Y','v1_subject')]
##removing the meanfreq's
alldata3=alldata3[,c(1:56,60:62,66:68,72,74,76,78,80:81)]
names(alldata3)


colnames(alldata3)[67]<-"Activity"
colnames(alldata3)[68]<-"Subject"
names(alldata3)

meansalldata3 <- aggregate(.~ Activity + Subject, data = alldata3, mean)

dim(meansalldata3)
names(meansalldata3)
