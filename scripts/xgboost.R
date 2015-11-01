#source("scripts/DataSetup.R")

bst <- xgboost(data = wdata, label = label, max.depth = 20, eta = 1, nround = 120,
               nthread = 2, eval_metric="mlogloss", objective = "multi:softprob",num_class=50)

testdata <- as.matrix(dtestAgg$data)
xgmat <- xgb.DMatrix(testdata)
predprob <- predict(bst, xgmat)

plist <- as.data.frame(predprob)

outputdf <- data.frame(dtestAgg$VisitNumber, plist)
colnames(outputdf) <- cWriteCsvHeader

filename <- paste0("submit/", format(Sys.time(), "%Y%m%d_%H%M%S_"), "xgboost.csv")
write.csv(outputdf[,cWriteCsvHeader],  file=filename,  row.names=FALSE, quote=FALSE)
gzip(filename)

end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken
