
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
cWriteCsvHeader <- c("VisitNumber","TripType_3","TripType_4","TripType_5","TripType_6","TripType_7","TripType_8","TripType_9","TripType_12","TripType_14","TripType_15","TripType_18","TripType_19","TripType_20","TripType_21","TripType_22","TripType_23","TripType_24","TripType_25","TripType_26","TripType_27","TripType_28","TripType_29","TripType_30","TripType_31","TripType_32","TripType_33","TripType_34","TripType_35","TripType_36","TripType_37","TripType_38","TripType_39","TripType_40","TripType_41","TripType_42","TripType_43","TripType_44","TripType_999")

