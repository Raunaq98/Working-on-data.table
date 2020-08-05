# calculating the total number of trips for each start station

head(using_df <- data %>% group_by(start_station) %>% count(),3)
#    start_station         n
#     <chr>             <int>
#  1 2nd at Folsom      7993
#  2 2nd at South Park  9448
#  3 2nd at Townsend   12935


head(data [, .( .N ) , by = .( start_station ) ] , 3 )
#             start_station     N
# 1: San Francisco City Hall  2145
# 2:  Embarcadero at Sansome 12879
# 3:       Steuart at Market 11579

head(data [, .(number_trip =  .N ) , by=.(station = start_station) ] , 3 )
#              station        number_trip
#1: San Francisco City Hall        2145
#2:  Embarcadero at Sansome       12879
#3:       Steuart at Market       11579

head(data [, .( .N ) , by=.(start_station,subscription_type) ] , 3 )
#        start_station         subscription_type      N
#1: San Francisco City Hall        Subscriber      1561
#2:  Embarcadero at Sansome        Subscriber      7904
#3:       Steuart at Market          Customer      1530             



# number of trips from each start station per month

start_month_total<- data[, .(trips= .N), by= .( station = start_station, month = month(start_date))] %>% arrange(station)

#filtering for march
start_march_total<- data[, .(trips= .N), by= .( station = start_station,month(start_date))] %>% arrange(station) %>% filter(month==3)


#multiple computation and multiple grouping
aggregate_mean_trips <- data[,.(mean_duration=mean(duration),total_trips= .N),by=.(start_station,end_station)]

