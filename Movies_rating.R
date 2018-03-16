###load the raw data
train<-read.csv(file.choose())
test<-read.csv(file.choose())
##calculate the overall mean
all_mean<-mean(train$rating)
movies_mean<-aggregate(rating~movie,data = train,mean)
rownames(movies_mean)<-movies_mean$movie
## create test data set
test$rating<-movies_mean[as.character(test$movie),"rating"]
test$rating[is.na(test$rating)]<-all_mean
## Output 
write.table(test[,c("ID","rating")],dec=".",sep = ",",file = "skmSubmission.csv")
