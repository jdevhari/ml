deriveDeptType <- function(dtObj){
  
  dtObj = within(dtObj, {
    Dept_1 = ifelse(DeptType == 1, ScanCount * 1, 0)
    Dept_2 = ifelse(DeptType == 2, ScanCount * 1, 0)
    Dept_3 = ifelse(DeptType == 3, ScanCount * 1, 0)
    Dept_4 = ifelse(DeptType == 4, ScanCount * 1, 0)
    Dept_5 = ifelse(DeptType == 5, ScanCount * 1, 0)
    Dept_6 = ifelse(DeptType == 6, ScanCount * 1, 0)
    Dept_7 = ifelse(DeptType == 7, ScanCount * 1, 0)
    Dept_8 = ifelse(DeptType == 8, ScanCount * 1, 0)
    Dept_9 = ifelse(DeptType == 9, ScanCount * 1, 0)
    Dept_10 = ifelse(DeptType == 10, ScanCount * 1, 0)
    Dept_11 = ifelse(DeptType == 11, ScanCount * 1, 0)
    Dept_12 = ifelse(DeptType == 12, ScanCount * 1, 0)
    Dept_13 = ifelse(DeptType == 13, ScanCount * 1, 0)
    Dept_14 = ifelse(DeptType == 14, ScanCount * 1, 0)
    Dept_15 = ifelse(DeptType == 15, ScanCount * 1, 0)
    Dept_16 = ifelse(DeptType == 16, ScanCount * 1, 0)
    Dept_17 = ifelse(DeptType == 17, ScanCount * 1, 0)
    Dept_18 = ifelse(DeptType == 18, ScanCount * 1, 0)
    Dept_19 = ifelse(DeptType == 19, ScanCount * 1, 0)
    Dept_20 = ifelse(DeptType == 20, ScanCount * 1, 0)
    Dept_21 = ifelse(DeptType == 21, ScanCount * 1, 0)
    Dept_22 = ifelse(DeptType == 22, ScanCount * 1, 0)
    Dept_23 = ifelse(DeptType == 23, ScanCount * 1, 0)
    Dept_24 = ifelse(DeptType == 24, ScanCount * 1, 0)
    Dept_25 = ifelse(DeptType == 25, ScanCount * 1, 0)
    Dept_26 = ifelse(DeptType == 26, ScanCount * 1, 0)
    Dept_27 = ifelse(DeptType == 27, ScanCount * 1, 0)
    Dept_28 = ifelse(DeptType == 28, ScanCount * 1, 0)
    Dept_29 = ifelse(DeptType == 29,ScanCount * 1, 0)
    Dept_30 = ifelse(DeptType == 30,ScanCount * 1, 0)
    Dept_31 = ifelse(DeptType == 31, ScanCount * 1, 0)
    Dept_32 = ifelse(DeptType == 32, ScanCount * 1, 0)
    Dept_33 = ifelse(DeptType == 33, ScanCount * 1, 0)
    Dept_34 = ifelse(DeptType == 34, ScanCount * 1, 0)
    Dept_35 = ifelse(DeptType == 35, ScanCount * 1, 0)
    Dept_36 = ifelse(DeptType == 36, ScanCount * 1, 0)
    Dept_37 = ifelse(DeptType == 37, ScanCount * 1, 0)
    Dept_38 = ifelse(DeptType == 38, ScanCount * 1, 0)
    Dept_39 = ifelse(DeptType == 39, ScanCount * 1, 0)
    Dept_40 = ifelse(DeptType == 40, ScanCount * 1, 0)
    Dept_41 = ifelse(DeptType == 41, ScanCount * 1, 0)
    Dept_42 = ifelse(DeptType == 42, ScanCount * 1, 0)
    Dept_43 = ifelse(DeptType == 43, ScanCount * 1, 0)
    Dept_44 = ifelse(DeptType == 44, ScanCount * 1, 0)
    Dept_45 = ifelse(DeptType == 45, ScanCount * 1, 0)
    Dept_46 = ifelse(DeptType == 46, ScanCount * 1, 0)
    Dept_47 = ifelse(DeptType == 47, ScanCount * 1, 0)
    Dept_48 = ifelse(DeptType == 48, ScanCount * 1, 0)
    Dept_49 = ifelse(DeptType == 49, ScanCount * 1, 0)
    Dept_50 = ifelse(DeptType == 50, ScanCount * 1, 0)
    Dept_51 = ifelse(DeptType == 51, ScanCount * 1, 0)
    Dept_52 = ifelse(DeptType == 52, ScanCount * 1, 0)
    Dept_53 = ifelse(DeptType == 53, ScanCount * 1, 0)
    Dept_54 = ifelse(DeptType == 54, ScanCount * 1, 0)
    Dept_55 = ifelse(DeptType == 55, ScanCount * 1, 0)
    Dept_56 = ifelse(DeptType == 56, ScanCount * 1, 0)
    Dept_57 = ifelse(DeptType == 57, ScanCount * 1, 0)
    Dept_58 = ifelse(DeptType == 58, ScanCount * 1, 0)
    Dept_59 = ifelse(DeptType == 59, ScanCount * 1, 0)
    Dept_60 = ifelse(DeptType == 60, ScanCount * 1, 0)
    Dept_61 = ifelse(DeptType == 61, ScanCount * 1, 0)
    Dept_62 = ifelse(DeptType == 62, ScanCount * 1, 0)
    Dept_63 = ifelse(DeptType == 63, ScanCount * 1, 0)
    Dept_64 = ifelse(DeptType == 64, ScanCount * 1, 0)
    Dept_65 = ifelse(DeptType == 65, ScanCount * 1, 0)
    Dept_66 = ifelse(DeptType == 66, ScanCount * 1, 0)
    Dept_67 = ifelse(DeptType == 67, ScanCount * 1, 0)
    Dept_68 = ifelse(DeptType == 68, ScanCount * 1, 0)
    Dept_69 = ifelse(DeptType == 69, ScanCount * 1, 0)
    
  })
  return(dtObj)
}


deriveBuyFinelineNumer <- function(dt){
  dfNew <- count(dt, VisitNumber, FinelineNumber)
  dfNewEx <- sqldf('select VisitNumber, count(FinelineNumber) as FinelineBuyCount from dt where DepartmentDescription != "NULL" and ScanCount >0 group by VisitNumber ')
  return (dfNewEx)
}

deriveRetFinelineNumer <- function(dt){
  dfNew <- count(dt, VisitNumber, FinelineNumber)
  dfNewEx <- sqldf('select VisitNumber, count(FinelineNumber)  as FinelineRetCount from dt where DepartmentDescription != "NULL" and ScanCount <0 group by VisitNumber ')
  return (dfNewEx)
}

deriveBuyTestFinelineNumer <- function(dt){
  dfNew <- count(dt, VisitNumber, FinelineNumber)
  dfNewEx <- sqldf('select VisitNumber, count(FinelineNumber)  as FinelineBuyCount from dtest where ScanCount >0 group by VisitNumber ')
  return (dfNewEx)
}

deriveRetTestFinelineNumer <- function(dt){
  dfNew <- count(dt, VisitNumber, FinelineNumber)
  dfNewEx <- sqldf('select VisitNumber, count(FinelineNumber)  as FinelineRetCount from dtest where ScanCount <0 group by VisitNumber ')
  return (dfNewEx)
}




#Snippets
##dres <- as.data.frame(dtest %>% count(VisitNumber, TripType) %>% top_n(1) %>% slice(1))

