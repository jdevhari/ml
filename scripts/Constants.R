
#Declare constants
cDept <- c("FINANCIAL SERVICES"          ,"SHOES"                       ,"PERSONAL CARE"               ,"PAINT AND ACCESSORIES"       ,"DSD GROCERY"                 ,"MEAT - FRESH & FROZEN",      
           "DAIRY"                       ,"PETS AND SUPPLIES"           ,"HOUSEHOLD CHEMICALS/SUPP"                           ,"IMPULSE MERCHANDISE"         ,"PRODUCE"                    ,
           "CANDY, TOBACCO, COOKIES"     ,"GROCERY DRY GOODS"           ,"BOYS WEAR"                   ,"FABRICS AND CRAFTS"          ,"JEWELRY AND SUNGLASSES"      ,"MENS WEAR"                  ,
           "ACCESSORIES"                 ,"HOME MANAGEMENT"             ,"FROZEN FOODS"                ,"SERVICE DELI"                ,"INFANT CONSUMABLE HARDLINES" ,"PRE PACKED DELI"            ,
           "COOK AND DINE"               ,"PHARMACY OTC"                ,"LADIESWEAR"                  ,"COMM BREAD"                  ,"BAKERY"                      ,"HOUSEHOLD PAPER GOODS"      ,
           "CELEBRATION"                 ,"HARDWARE"                    ,"BEAUTY"                      ,"AUTOMOTIVE"                  ,"BOOKS AND MAGAZINES"         ,"SEAFOOD"                    ,
           "OFFICE SUPPLIES"             ,"LAWN AND GARDEN"             ,"SHEER HOSIERY"               ,"WIRELESS"                    ,"BEDDING"                     ,"BATH AND SHOWER"            ,
           "HORTICULTURE AND ACCESS"     ,"HOME DECOR"                  ,"TOYS"                        ,"INFANT APPAREL"              ,"LADIES SOCKS"                ,"PLUS AND MATERNITY"         ,
           "ELECTRONICS"                 ,"GIRLS WEAR, 4-6X  AND 7-14"  ,"BRAS & SHAPEWEAR"            ,"LIQUOR,WINE,BEER"            ,"SLEEPWEAR/FOUNDATIONS"       ,"CAMERAS AND SUPPLIES"       ,
           "SPORTING GOODS"              ,"PLAYERS AND ELECTRONICS"     ,"PHARMACY RX"                 ,"MENSWEAR"                    ,"OPTICAL - FRAMES"            ,"SWIMWEAR/OUTERWEAR"         ,
           "OTHER DEPARTMENTS"           ,"MEDIA AND GAMING"            ,"FURNITURE"                   ,"OPTICAL - LENSES"            ,"SEASONAL"                    ,"LARGE HOUSEHOLD GOODS"      ,
           "1-HR PHOTO"                  ,"CONCEPT STORES"              ,"HEALTH AND BEAUTY AIDS"     )
cDept <- as.data.frame(cDept)

cWeekDay <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
cWeekDay <- as.data.frame(cWeekDay)

cWeekDayOnly <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
cWeekEndOnly <- c("Sunday", "Saturday")

cTrip <- as.integer(c(3,4,5,6,7,8,9,12,14,15,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,999))
cWriteCsvHeader <- c("VisitNumber","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38")
