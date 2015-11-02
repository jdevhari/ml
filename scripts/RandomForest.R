#setwd("./ml")
source("scripts/utils/DataSetup.R")

#Build the randomForestClassifier
clf <- randomForest(factor(label) ~ ., data=wdata, ntree=300,keep.forest=TRUE)

#Run the Prediction
predprob = predict(clf, dtestAgg$data, type="prob")

plist <- as.data.frame(predprob)

outputdf <- data.frame(dtestAgg$VisitNumber, plist)
colnames(outputdf) <- cWriteCsvHeader

filename <- paste0("submit/", format(Sys.time(), "%Y%m%d_%H%M%S_"), "submit.csv")
write.csv(outputdf[,cWriteCsvHeader],  file=filename,  row.names=FALSE, quote=FALSE)
gzip(filename)

end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken
