#dt <- read.csv("data/train.csv")
#source("scripts/DataProcess.R")
# dt$DeptType <- as.numeric(match(dt$DepartmentDescription, cGroupDept$DepartmentDescription))
# 
# 

processFineline <- function(dt){
  tt <- filter(dt, ScanCount >=0)
  tt <- group_by(tt, VisitNumber, DeptType)
  tBuy <- summarise(tt, uniBuy=n_distinct(FinelineNumber))
  tBuyDf <- select(tBuy, VisitNumber, DeptType, uniBuy)
  tBuyDf <- as.data.frame(tBuyDf)
  tBuyDfDt <- spread(tBuyDf, DeptType, uniBuy)
  colnames(tBuyDfDt) = paste("A", colnames(tBuyDfDt), sep="")
  
  tt <- filter(dt, ScanCount <0)
  tt <- group_by(tt, VisitNumber, DeptType)
  tRet <- summarise(tt, uniRet=n_distinct(FinelineNumber))
  tRetDf <- select(tRet, VisitNumber, DeptType, uniRet)
  tRetDf <- as.data.frame(tRetDf)
  tRetDfDt <- spread(tRetDf, DeptType, uniRet)
  colnames(tRetDfDt) = paste("A", colnames(tRetDfDt), sep="")
  
  dFineLine <- merge(tBuyDfDt,tRetDfDt,by="AVisitNumber", all.x = TRUE, all.y = TRUE)
  return (dFineLine)
}
