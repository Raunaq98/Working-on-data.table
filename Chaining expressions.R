### chaining can be done by x[...][...][...]...


# finding 3 shortest trips that have duration above 3600
data[duration>3600,][order(duration),][1:3,]

# finding the top 3 stations with the lowest mean duration
data[, .(mean_dur=mean(duration)),by=.(start_station)][order(mean_dur),][1:3,]




### uniqueN function

id<- c(1,2,3,1)
uniqueN(id)
# [1] 3
x<- data.table(id,val=1:4)
#   id val
#1:  1   1
#2:  2   2
#3:  3   3
#4:  1   4
uniqueN(x)
# [1] 4         # all rows are unique when all obs are considered
uniqueN(x,by="id")
# [1] 3
## calculating the unique number of bike ids each month
data[, .(bikes = uniqueN(bike_id)) , by = .( month = month(start_date))]
#    month bikes
#1:     1   605
#2:     2   608
#3:     3   631
#4:     4   637
#5:     5   625
#6:     6   618
#7:     7   620
#8:     8   628
#9:     9   642
#10:    10   635
#11:    11   636
#12:    12   592


# Top five most popular destinations
top_5 <- data[, .(.N), by = .(end_station)][order(-N)][1:5]
top_5

# Find the first and last ride for each start_station
data[order(start_date), .(start_end = start_date[c(1,.N)]),  by = .(start_station)]

