temp_DT<- data.table( id=c(1,1,2,2,1,1), val1 = 1:6 , val2 = letters[6:1])
#    id val1 val2
#1:  1    1    f
#2:  1    2    e
#3:  2    3    d
#4:  2    4    c
#5:  1    5    b
#6:  1    6    a

temp_DT[, c("id","new_id") := .(NULL,5:10),]
#     val1 val2 new_id
#1:    1    f      5
#2:    2    e      6
#3:    3    d      7
#4:    4    c      8
#5:    5    b      9
#6:    6    a     10

t<- data[duration>3600,.(mean_dur=mean(duration)),by=.(start_station)][order(-mean_dur)][,`:=`(mean_dur=mean_dur/100)]


# now we want to change the third element of temp_DT under val2

temp_DT[3,val2 := "D",]
#     val1 val2 new_id
#1:    1    f      5
#2:    2    e      6
#3:    3    D      7
#4:    4    c      8
#5:    5    b      9
#6:    6    a     10

# changing all duration values less that 100 to NA

data[duration<100,duration := NA,]


# we now want data only for the entries with greater than 1000 trips per zip code

zip_1000 <- data[,total_trips := .N, by=.(zip_code)][total_trips>1000][,total_trips := NULL]
# we removed the total trips column as it was not required by us


# replacing all NA values of duration with the mean of that month
data[, mean_dur := mean(duration, na.rm = TRUE), by = month(start_date)][is.na(duration), duration := mean_dur]

## adding multiple columns
data[,c("end_dur_first","end_dur_last"):= .(duration[1],duration[.N]),by= .(end_station)]


### advanced topics

#for each unique combination of start_station and end_station 
# set " short" if median duration < 600
# set " medium" if 600< median duration < 1800
# set " long" otherwise

data[,c("trip_category") := {
  med_dur=median(duration, na.rm=TRUE)
  if( med_dur < 600)"short"
  else if( 600< med_dur & med_dur>1800)"medium"
  else"long"
  }, by= .(start_station,end_station)]

# OR

bin_median_dur <- function(x){
  med_dur=median(x, na.rm=TRUE)
  if( med_dur < 600)"short"
  else if( 600< med_dur & med_dur>1800)"medium"
  else"long"}
data[,c("trip_category") := bin_median_dur(duration),by=.(start_station,end_station)]


