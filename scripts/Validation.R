#setwd("./ml")
#Read the values into Data Frames
dtall <- read.csv("data/train.csv")
#Sampling
sample = sample.split(dtall, SplitRatio = 0.5)
dt = subset(dtall, sample == TRUE)
dtest = subset(dtall, sample == FALSE)

source("scripts/utils/DataSetup.R")

#Build the randomForestClassifier
clf <- randomForest(labelFactor ~ ., data=wdata, ntree=150,keep.forest=TRUE)

#Run the Prediction
predprob = predict(clf, dtestAgg$data, type="prob")

plist <- as.data.frame(predprob)

outputdf <- data.frame(dtestAgg$VisitNumber, plist)

MultiLogLoss <- function(act, pred)
{
  eps = 1e-15;
  nr <- nrow(pred)
  pred = matrix(sapply( pred, function(x) max(eps,x)), nrow = nr)      
  pred = matrix(sapply( pred, function(x) min(1-eps,x)), nrow = nr)
  ll = sum(act*log(pred) + (1-act)*log(1-pred))
  ll = ll * -1/(nrow(act))      
  return(ll);
}

# dtestAgg$data$A22 <- 0
# dtestAgg$data$B22 <- 0

tt <- group_by(dtest, VisitNumber)
tRet <- summarise(tt, TripType=min(TripType))
tRetDf <- as.data.frame(tRet)

dResult <- merge(dtestAgg,tRetDf,by="VisitNumber", all.x = TRUE, all.y = FALSE)
dResult <- select(dResult,VisitNumber, TripType)
dResult$cc <- 1
dResultN <- spread(dResult, TripType, cc)
colnames(dResultN) = paste("TripType_", colnames(dResult), sep="")

dResult["VisitNumber"] <- NULL
outputdf["VisitNumber"] <- NULL

MultiLogLoss(dResult, outputdf)