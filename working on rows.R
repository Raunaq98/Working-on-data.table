# DT[i,j,by]
# "i" is used to subset or filter rows

library(data.table)
library(bikeshare14)

data<- as.data.table(batrips)

# to subset 3rd and fourth rows :
data[3:4,]

# to subset everything except first five rows :
data[-(1:5),]

data[.N]
# returns last row

data[1:(.N-10)]
#returns all rows except the last ten

# to subset rows which have Subscriber under subscriber_type
data[subscription_type == "Subscriber",]
# in case of data frames we have to use $ signs to access these objects

# to subset where start_terminal=58 and end_terminal is not 65
data[start_terminal==58 & end_terminal != 65]

# the data.table also keeps a "indices" vector that hold the info
# regarding the previous column operation
indices(data)
# [1] "subscription_type"
# showing that previous step(current is on terminals) worked on subs_type

data[trip_id>=13500,]
indices(data)


#### helper functions

data[start_station %in% c("MLK Station","San Francisco City Hall"),]
# checks for rows with these 2 char strings under start_station

data[start_station %chin% c("MLK Station","San Francisco City Hall"),]
# faster way of doing %in%

data[start_station %like% "MLK" ,]
# checks for rows containing "MLK" under start station column

data[duration %between% c(2000,3000),]
# checks for duration>2000 & duration <3000
