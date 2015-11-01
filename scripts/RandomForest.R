start.time <- Sys.time()
start.time

setwd("./ml")

#preload libraries
library(sqldf)
library(randomForest)
library(dplyr)

#Read the values into Data Frames
dt <- read.csv("data/train.csv")
dtest <- read.csv("data/test.csv")

#Load files
source("scripts/Constants.R")
source("scripts/Functions.R")


#Start music
#dt$isWeekday <- ifelse(dt$Weekday %in% cWeekDayOnly, 1, 0)
#dtest$isWeekday <- ifelse(dtest$Weekday %in% cWeekDayOnly, 1, 0)
dt$WeekdayNum <- as.numeric(match(dt$Weekday, cWeekDay[[1]]))
dtest$WeekdayNum <- as.numeric(match(dtest$Weekday, cWeekDay[[1]]))

dt$DeptType <- as.numeric(match(dt$DepartmentDescription, cDept[[1]]))
dtest$DeptType <- as.numeric(match(dtest$DepartmentDescription, cDept[[1]]))

dt = deriveDeptType(dt)
dtest = deriveDeptType(dtest)

dtrainBuyAgg <- sqldf('select VisitNumber, max(TripType) as TripType, sum(ScanCount) as ScanCount, max(WeekdayNum) as WeekdayNum,
                  sum(Dept_1)/sum(Dept_1) as Dept_1, sum(Dept_2)/sum(Dept_2) as Dept_2, sum(Dept_3)/sum(Dept_3) as Dept_3, sum(Dept_4)/sum(Dept_4) as Dept_4, sum(Dept_5)/sum(Dept_5) as Dept_5, sum(Dept_6)/sum(Dept_6) as Dept_6, sum(Dept_7)/sum(Dept_7) as Dept_7, sum(Dept_8)/sum(Dept_8) as Dept_8, sum(Dept_9)/sum(Dept_9) as Dept_9, sum(Dept_10)/sum(Dept_10) as Dept_10, sum(Dept_11)/sum(Dept_11) as Dept_11, sum(Dept_12)/sum(Dept_12) as Dept_12, sum(Dept_13)/sum(Dept_13) as Dept_13, sum(Dept_14)/sum(Dept_14) as Dept_14, sum(Dept_15)/sum(Dept_15) as Dept_15, sum(Dept_16)/sum(Dept_16) as Dept_16, sum(Dept_17)/sum(Dept_17) as Dept_17, sum(Dept_18)/sum(Dept_18) as Dept_18, sum(Dept_19)/sum(Dept_19) as Dept_19, sum(Dept_20)/sum(Dept_20) as Dept_20, sum(Dept_21)/sum(Dept_21) as Dept_21, sum(Dept_22)/sum(Dept_22) as Dept_22, sum(Dept_23)/sum(Dept_23) as Dept_23, sum(Dept_24)/sum(Dept_24) as Dept_24, sum(Dept_25)/sum(Dept_25) as Dept_25, sum(Dept_26)/sum(Dept_26) as Dept_26, sum(Dept_27)/sum(Dept_27) as Dept_27, sum(Dept_28)/sum(Dept_28) as Dept_28, sum(Dept_29)/sum(Dept_29) as Dept_29, sum(Dept_30)/sum(Dept_30) as Dept_30, sum(Dept_31)/sum(Dept_31) as Dept_31, sum(Dept_32)/sum(Dept_32) as Dept_32, sum(Dept_33)/sum(Dept_33) as Dept_33, sum(Dept_34)/sum(Dept_34) as Dept_34, sum(Dept_35)/sum(Dept_35) as Dept_35, sum(Dept_36)/sum(Dept_36) as Dept_36, sum(Dept_37)/sum(Dept_37) as Dept_37, sum(Dept_38)/sum(Dept_38) as Dept_38, sum(Dept_39)/sum(Dept_39) as Dept_39, sum(Dept_40)/sum(Dept_40) as Dept_40, sum(Dept_41)/sum(Dept_41) as Dept_41, sum(Dept_42)/sum(Dept_42) as Dept_42, sum(Dept_43)/sum(Dept_43) as Dept_43, sum(Dept_44)/sum(Dept_44) as Dept_44, sum(Dept_45)/sum(Dept_45) as Dept_45, sum(Dept_46)/sum(Dept_46) as Dept_46, sum(Dept_47)/sum(Dept_47) as Dept_47, sum(Dept_48)/sum(Dept_48) as Dept_48, sum(Dept_49)/sum(Dept_49) as Dept_49, sum(Dept_50)/sum(Dept_50) as Dept_50, sum(Dept_51)/sum(Dept_51) as Dept_51, sum(Dept_52)/sum(Dept_52) as Dept_52, sum(Dept_53)/sum(Dept_53) as Dept_53, sum(Dept_54)/sum(Dept_54) as Dept_54, sum(Dept_55)/sum(Dept_55) as Dept_55, sum(Dept_56)/sum(Dept_56) as Dept_56, sum(Dept_57)/sum(Dept_57) as Dept_57, sum(Dept_58)/sum(Dept_58) as Dept_58, sum(Dept_59)/sum(Dept_59) as Dept_59, sum(Dept_60)/sum(Dept_60) as Dept_60, sum(Dept_61)/sum(Dept_61) as Dept_61, sum(Dept_62)/sum(Dept_62) as Dept_62, sum(Dept_63)/sum(Dept_63) as Dept_63, sum(Dept_64)/sum(Dept_64) as Dept_64, sum(Dept_65)/sum(Dept_65) as Dept_65, sum(Dept_66)/sum(Dept_66) as Dept_66, sum(Dept_67)/sum(Dept_67) as Dept_67, sum(Dept_68)/sum(Dept_68) as Dept_68, sum(Dept_69)/sum(Dept_69) as Dept_69
                   from dt where DepartmentDescription != "NULL" and ScanCount >= 0 group by VisitNumber')

dtrainRetAgg <- sqldf('select VisitNumber, max(TripType) as TripType, sum(ScanCount * -1) as ScanCount, max(WeekdayNum) as WeekdayNum, sum(Dept_1)/sum(Dept_1) as Dept_1, sum(Dept_2)/sum(Dept_2) as Dept_2, sum(Dept_3)/sum(Dept_3) as Dept_3, sum(Dept_4)/sum(Dept_4) as Dept_4, sum(Dept_5)/sum(Dept_5) as Dept_5, sum(Dept_6)/sum(Dept_6) as Dept_6, sum(Dept_7)/sum(Dept_7) as Dept_7, sum(Dept_8)/sum(Dept_8) as Dept_8, sum(Dept_9)/sum(Dept_9) as Dept_9, sum(Dept_10)/sum(Dept_10) as Dept_10, sum(Dept_11)/sum(Dept_11) as Dept_11, sum(Dept_12)/sum(Dept_12) as Dept_12, sum(Dept_13)/sum(Dept_13) as Dept_13, sum(Dept_14)/sum(Dept_14) as Dept_14, sum(Dept_15)/sum(Dept_15) as Dept_15, sum(Dept_16)/sum(Dept_16) as Dept_16, sum(Dept_17)/sum(Dept_17) as Dept_17, sum(Dept_18)/sum(Dept_18) as Dept_18, sum(Dept_19)/sum(Dept_19) as Dept_19, sum(Dept_20)/sum(Dept_20) as Dept_20, sum(Dept_21)/sum(Dept_21) as Dept_21, sum(Dept_22)/sum(Dept_22) as Dept_22, sum(Dept_23)/sum(Dept_23) as Dept_23, sum(Dept_24)/sum(Dept_24) as Dept_24, sum(Dept_25)/sum(Dept_25) as Dept_25, sum(Dept_26)/sum(Dept_26) as Dept_26, sum(Dept_27)/sum(Dept_27) as Dept_27, sum(Dept_28)/sum(Dept_28) as Dept_28, sum(Dept_29)/sum(Dept_29) as Dept_29, sum(Dept_30)/sum(Dept_30) as Dept_30, sum(Dept_31)/sum(Dept_31) as Dept_31, sum(Dept_32)/sum(Dept_32) as Dept_32, sum(Dept_33)/sum(Dept_33) as Dept_33, sum(Dept_34)/sum(Dept_34) as Dept_34, sum(Dept_35)/sum(Dept_35) as Dept_35, sum(Dept_36)/sum(Dept_36) as Dept_36, sum(Dept_37)/sum(Dept_37) as Dept_37, sum(Dept_38)/sum(Dept_38) as Dept_38, sum(Dept_39)/sum(Dept_39) as Dept_39, sum(Dept_40)/sum(Dept_40) as Dept_40, sum(Dept_41)/sum(Dept_41) as Dept_41, sum(Dept_42)/sum(Dept_42) as Dept_42, sum(Dept_43)/sum(Dept_43) as Dept_43, sum(Dept_44)/sum(Dept_44) as Dept_44, sum(Dept_45)/sum(Dept_45) as Dept_45, sum(Dept_46)/sum(Dept_46) as Dept_46, sum(Dept_47)/sum(Dept_47) as Dept_47, sum(Dept_48)/sum(Dept_48) as Dept_48, sum(Dept_49)/sum(Dept_49) as Dept_49, sum(Dept_50)/sum(Dept_50) as Dept_50, sum(Dept_51)/sum(Dept_51) as Dept_51, sum(Dept_52)/sum(Dept_52) as Dept_52, sum(Dept_53)/sum(Dept_53) as Dept_53, sum(Dept_54)/sum(Dept_54) as Dept_54, sum(Dept_55)/sum(Dept_55) as Dept_55, sum(Dept_56)/sum(Dept_56) as Dept_56, sum(Dept_57)/sum(Dept_57) as Dept_57, sum(Dept_58)/sum(Dept_58) as Dept_58, sum(Dept_59)/sum(Dept_59) as Dept_59, sum(Dept_60)/sum(Dept_60) as Dept_60, sum(Dept_61)/sum(Dept_61) as Dept_61, sum(Dept_62)/sum(Dept_62) as Dept_62, sum(Dept_63)/sum(Dept_63) as Dept_63, sum(Dept_64)/sum(Dept_64) as Dept_64, sum(Dept_65)/sum(Dept_65) as Dept_65, sum(Dept_66)/sum(Dept_66) as Dept_66, sum(Dept_67)/sum(Dept_67) as Dept_67, sum(Dept_68)/sum(Dept_68) as Dept_68, sum(Dept_69)/sum(Dept_69) as Dept_69
                   from dt where DepartmentDescription != "NULL" and ScanCount < 0 group by VisitNumber')

dtestBuyAgg <- sqldf('select VisitNumber, max(WeekdayNum) as WeekdayNum,  sum(ScanCount) as ScanCount, sum(Dept_1)/sum(Dept_1) as Dept_1, sum(Dept_2)/sum(Dept_2) as Dept_2, sum(Dept_3)/sum(Dept_3) as Dept_3, sum(Dept_4)/sum(Dept_4) as Dept_4, sum(Dept_5)/sum(Dept_5) as Dept_5, sum(Dept_6)/sum(Dept_6) as Dept_6, sum(Dept_7)/sum(Dept_7) as Dept_7, sum(Dept_8)/sum(Dept_8) as Dept_8, sum(Dept_9)/sum(Dept_9) as Dept_9, sum(Dept_10)/sum(Dept_10) as Dept_10, sum(Dept_11)/sum(Dept_11) as Dept_11, sum(Dept_12)/sum(Dept_12) as Dept_12, sum(Dept_13)/sum(Dept_13) as Dept_13, sum(Dept_14)/sum(Dept_14) as Dept_14, sum(Dept_15)/sum(Dept_15) as Dept_15, sum(Dept_16)/sum(Dept_16) as Dept_16, sum(Dept_17)/sum(Dept_17) as Dept_17, sum(Dept_18)/sum(Dept_18) as Dept_18, sum(Dept_19)/sum(Dept_19) as Dept_19, sum(Dept_20)/sum(Dept_20) as Dept_20, sum(Dept_21)/sum(Dept_21) as Dept_21, sum(Dept_22)/sum(Dept_22) as Dept_22, sum(Dept_23)/sum(Dept_23) as Dept_23, sum(Dept_24)/sum(Dept_24) as Dept_24, sum(Dept_25)/sum(Dept_25) as Dept_25, sum(Dept_26)/sum(Dept_26) as Dept_26, sum(Dept_27)/sum(Dept_27) as Dept_27, sum(Dept_28)/sum(Dept_28) as Dept_28, sum(Dept_29)/sum(Dept_29) as Dept_29, sum(Dept_30)/sum(Dept_30) as Dept_30, sum(Dept_31)/sum(Dept_31) as Dept_31, sum(Dept_32)/sum(Dept_32) as Dept_32, sum(Dept_33)/sum(Dept_33) as Dept_33, sum(Dept_34)/sum(Dept_34) as Dept_34, sum(Dept_35)/sum(Dept_35) as Dept_35, sum(Dept_36)/sum(Dept_36) as Dept_36, sum(Dept_37)/sum(Dept_37) as Dept_37, sum(Dept_38)/sum(Dept_38) as Dept_38, sum(Dept_39)/sum(Dept_39) as Dept_39, sum(Dept_40)/sum(Dept_40) as Dept_40, sum(Dept_41)/sum(Dept_41) as Dept_41, sum(Dept_42)/sum(Dept_42) as Dept_42, sum(Dept_43)/sum(Dept_43) as Dept_43, sum(Dept_44)/sum(Dept_44) as Dept_44, sum(Dept_45)/sum(Dept_45) as Dept_45, sum(Dept_46)/sum(Dept_46) as Dept_46, sum(Dept_47)/sum(Dept_47) as Dept_47, sum(Dept_48)/sum(Dept_48) as Dept_48, sum(Dept_49)/sum(Dept_49) as Dept_49, sum(Dept_50)/sum(Dept_50) as Dept_50, sum(Dept_51)/sum(Dept_51) as Dept_51, sum(Dept_52)/sum(Dept_52) as Dept_52, sum(Dept_53)/sum(Dept_53) as Dept_53, sum(Dept_54)/sum(Dept_54) as Dept_54, sum(Dept_55)/sum(Dept_55) as Dept_55, sum(Dept_56)/sum(Dept_56) as Dept_56, sum(Dept_57)/sum(Dept_57) as Dept_57, sum(Dept_58)/sum(Dept_58) as Dept_58, sum(Dept_59)/sum(Dept_59) as Dept_59, sum(Dept_60)/sum(Dept_60) as Dept_60, sum(Dept_61)/sum(Dept_61) as Dept_61, sum(Dept_62)/sum(Dept_62) as Dept_62, sum(Dept_63)/sum(Dept_63) as Dept_63, sum(Dept_64)/sum(Dept_64) as Dept_64, sum(Dept_65)/sum(Dept_65) as Dept_65, sum(Dept_66)/sum(Dept_66) as Dept_66, sum(Dept_67)/sum(Dept_67) as Dept_67, sum(Dept_68)/sum(Dept_68) as Dept_68, sum(Dept_69)/sum(Dept_69) as Dept_69
                  from dtest  where ScanCount >= 0 group by VisitNumber')

dtestRetAgg <- sqldf('select VisitNumber, max(WeekdayNum) as WeekdayNum, sum(ScanCount * -1) as ScanCount,  sum(Dept_1)/sum(Dept_1) as Dept_1, sum(Dept_2)/sum(Dept_2) as Dept_2, sum(Dept_3)/sum(Dept_3) as Dept_3, sum(Dept_4)/sum(Dept_4) as Dept_4, sum(Dept_5)/sum(Dept_5) as Dept_5, sum(Dept_6)/sum(Dept_6) as Dept_6, sum(Dept_7)/sum(Dept_7) as Dept_7, sum(Dept_8)/sum(Dept_8) as Dept_8, sum(Dept_9)/sum(Dept_9) as Dept_9, sum(Dept_10)/sum(Dept_10) as Dept_10, sum(Dept_11)/sum(Dept_11) as Dept_11, sum(Dept_12)/sum(Dept_12) as Dept_12, sum(Dept_13)/sum(Dept_13) as Dept_13, sum(Dept_14)/sum(Dept_14) as Dept_14, sum(Dept_15)/sum(Dept_15) as Dept_15, sum(Dept_16)/sum(Dept_16) as Dept_16, sum(Dept_17)/sum(Dept_17) as Dept_17, sum(Dept_18)/sum(Dept_18) as Dept_18, sum(Dept_19)/sum(Dept_19) as Dept_19, sum(Dept_20)/sum(Dept_20) as Dept_20, sum(Dept_21)/sum(Dept_21) as Dept_21, sum(Dept_22)/sum(Dept_22) as Dept_22, sum(Dept_23)/sum(Dept_23) as Dept_23, sum(Dept_24)/sum(Dept_24) as Dept_24, sum(Dept_25)/sum(Dept_25) as Dept_25, sum(Dept_26)/sum(Dept_26) as Dept_26, sum(Dept_27)/sum(Dept_27) as Dept_27, sum(Dept_28)/sum(Dept_28) as Dept_28, sum(Dept_29)/sum(Dept_29) as Dept_29, sum(Dept_30)/sum(Dept_30) as Dept_30, sum(Dept_31)/sum(Dept_31) as Dept_31, sum(Dept_32)/sum(Dept_32) as Dept_32, sum(Dept_33)/sum(Dept_33) as Dept_33, sum(Dept_34)/sum(Dept_34) as Dept_34, sum(Dept_35)/sum(Dept_35) as Dept_35, sum(Dept_36)/sum(Dept_36) as Dept_36, sum(Dept_37)/sum(Dept_37) as Dept_37, sum(Dept_38)/sum(Dept_38) as Dept_38, sum(Dept_39)/sum(Dept_39) as Dept_39, sum(Dept_40)/sum(Dept_40) as Dept_40, sum(Dept_41)/sum(Dept_41) as Dept_41, sum(Dept_42)/sum(Dept_42) as Dept_42, sum(Dept_43)/sum(Dept_43) as Dept_43, sum(Dept_44)/sum(Dept_44) as Dept_44, sum(Dept_45)/sum(Dept_45) as Dept_45, sum(Dept_46)/sum(Dept_46) as Dept_46, sum(Dept_47)/sum(Dept_47) as Dept_47, sum(Dept_48)/sum(Dept_48) as Dept_48, sum(Dept_49)/sum(Dept_49) as Dept_49, sum(Dept_50)/sum(Dept_50) as Dept_50, sum(Dept_51)/sum(Dept_51) as Dept_51, sum(Dept_52)/sum(Dept_52) as Dept_52, sum(Dept_53)/sum(Dept_53) as Dept_53, sum(Dept_54)/sum(Dept_54) as Dept_54, sum(Dept_55)/sum(Dept_55) as Dept_55, sum(Dept_56)/sum(Dept_56) as Dept_56, sum(Dept_57)/sum(Dept_57) as Dept_57, sum(Dept_58)/sum(Dept_58) as Dept_58, sum(Dept_59)/sum(Dept_59) as Dept_59, sum(Dept_60)/sum(Dept_60) as Dept_60, sum(Dept_61)/sum(Dept_61) as Dept_61, sum(Dept_62)/sum(Dept_62) as Dept_62, sum(Dept_63)/sum(Dept_63) as Dept_63, sum(Dept_64)/sum(Dept_64) as Dept_64, sum(Dept_65)/sum(Dept_65) as Dept_65, sum(Dept_66)/sum(Dept_66) as Dept_66, sum(Dept_67)/sum(Dept_67) as Dept_67, sum(Dept_68)/sum(Dept_68) as Dept_68, sum(Dept_69)/sum(Dept_69) as Dept_69
                  from dtest  where ScanCount < 0 group by VisitNumber')

#Aggregate
dtrainBuyRetAgg <- merge(dtrainBuyAgg,dtrainRetAgg,by="VisitNumber", all.x = TRUE, all.y = TRUE)
dBuyFinelineNumer <- deriveBuyFinelineNumer(dt);
dRetFinelineNumer <- deriveRetFinelineNumer(dt);

dtrainBuyRetBuyFinlineAgg <- merge(dtrainBuyRetAgg,dBuyFinelineNumer,by="VisitNumber", all.x = TRUE, all.y = TRUE)
dtrainAgg <- merge(dtrainBuyRetBuyFinlineAgg,dRetFinelineNumer,by="VisitNumber", all.x = TRUE, all.y = TRUE)


dtestBuyRetAgg <- merge(dtestBuyAgg,dtestRetAgg,by="VisitNumber", all.x = TRUE, all.y = TRUE)
dBuyTestFinelineNumer <- deriveBuyTestFinelineNumer(dt);
dRetTestFinelineNumer <- deriveRetTestFinelineNumer(dt);

dtestBuyRetBuyFinlineAgg <- merge(dtestBuyRetAgg,dBuyTestFinelineNumer,by="VisitNumber", all.x = TRUE, all.y = TRUE)
dtestAgg <- merge(dtestBuyRetBuyFinlineAgg,dRetTestFinelineNumer,by="VisitNumber", all.x = TRUE, all.y = TRUE)



dtrainAgg$TripTypeNorm <- ifelse(is.na(dtrainAgg$TripType.x), match(dtrainAgg$TripType.y, cTrip), match(dtrainAgg$TripType.x, cTrip))
dtrainAgg$WeekdayNum <- ifelse(is.na(dtrainAgg$WeekdayNum.x), dtrainAgg$WeekdayNum.y, dtrainAgg$WeekdayNum.x)
dtestAgg$WeekdayNum <- ifelse(is.na(dtestAgg$WeekdayNum.x), dtestAgg$WeekdayNum.y, dtestAgg$WeekdayNum.x)


dtrainAgg[is.na(dtrainAgg)] <- 0
dtestAgg[is.na(dtestAgg)] <- 0

dtrainAgg$data <- subset(dtrainAgg, , -c(TripType.x, VisitNumber, TripTypeNorm, TripType.y, WeekdayNum.y))

data <- as.matrix(dtrainAgg$data)
label <- as.numeric(dtrainAgg$TripTypeNorm)

#Build the randomForestClassifier
clf <- randomForest(factor(label) ~ ., data=data, ntree=150,keep.forest=TRUE)

#Run the Prediction
dtestAgg$data <- subset(dtestAgg, , -c(VisitNumber, WeekdayNum.y))
predprob = predict(clf, dtestAgg$data, type="prob")

plist <- as.data.frame(predprob)
plist["VisitNumber"] <- dtestAgg$VisitNumber

filename <- paste0("submit/", format(now, "%Y%m%d_%H%M%S_"), "submit.csv")
write.csv(plist[,cWriteCsvHeader],  file=filename,  row.names=FALSE, quote=FALSE)

end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

