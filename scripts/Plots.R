qplot(WeekdayNum, ScanCount.x, data=dtrainAgg) +  labs(list(title = "Scancount vs DayOfWeek", x = "DayOfWeek", y = "Scancount"))

qplot(WeekdayNum, DeptType, data=dt) +  labs(list(title = "DeptType vs DayOfWeek", x = "DayOfWeek", y = "DeptType"))

qplot(WeekdayNum, TripTypeNorm, data=dtrainAgg) +  labs(list(title = "Scancount vs TripType", x = "DayOfWeek", y = "TripType"))

qplot(ScanCount.x, TripTypeNorm, data=dtrainAgg) +  labs(list(title = "ScanCount vs TripType", x = "ScanCount", y = "TripType"))

qplot(ScanCount, DeptType, data=dt) +  labs(list(title = "DeptType vs ScanCount", x = "ScanCount", y = "DeptType"))