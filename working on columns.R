
data_frame<- as.data.frame(data)

temp1<- data_frame[,"trip_id"]
#   [1] 139545 139546 139547 139549 139550 139551 139552 139553 ...

temp2<- data[,"trip_id"]
#    trip_id
#1:  139545
#2:  139546
#3:  139547
#4:  139549
#5:  139550

# hence, df returns vector while dt returns another dt


duration_low1<- data[,c("trip_id","duration")]
head(duration_low1,3)
#   trip_id duration
#1:  139545      435
#2:  139546      432
#3:  139547     1523

duration_low2 <- data[,list(trip_id,dur=duration)]  #need to mention j as a list to return it as a DT
head(duration_low2,3)
#   trip_id  dur
#1:  139545  435
#2:  139546  432
#3:  139547 1523

####### list() == .()

duration_low3 <- data[,.(trip_id,dur=duration)]  
head(duration_low3,3)
#   trip_id  dur
#1:  139545  435
#2:  139546  432
#3:  139547 1523


# deselecting columns::
duration_lowww<- data[,-c("trip_id","duration")]

#### COMPUTATION ON COLUMNS

data[,mean(duration)]
# [1] 1131.967     # vector

data[,.(mean_dur=mean(duration))]
#   mean_dur
# 1: 1131.967         #DT

#### COMPUTING ON ROWS AND COLUMNS

# what si the mean of duration when start station is japantown

# using data frame :
library(dplyr)
japan <- data %>% filter(start_station=="Japantown") %>% summarise(mean(duration))
japan
#  2464.331

# using DT :
data[start_station == "Japantown",.( mean_dur=mean(duration))]
#    mean_dur
# 1: 2464.331

## how many trips started from Japantown

j_count <- data %>% filter(start_station=="Japantown") %>% count()
# [1] 902

data[start_station=="Japantown", .N]
# [1] 902



data[start_station == "Townsend at 7th" & duration < 500, hist(duration)]


