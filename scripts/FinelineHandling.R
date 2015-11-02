dt <- read.csv("data/train.csv")
source("scripts/DataProcess.R")
dt$DeptType <- as.numeric(match(dt$DepartmentDescription, cGroupDept$DepartmentDescription))


for(i in 1000:1005){
  colnam <- paste("Dept_", i, sep="")
  cData <- ifelse(dt$FinelineNumber == i, 1, 0)
  dt <- cbind(dt,cData)
  colnames(dt)[length(dt)] <- colnam
}

