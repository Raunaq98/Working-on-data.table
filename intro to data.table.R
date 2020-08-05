# data.table is an enhanced form of data.frame
# it contains grouping as a vritual third dimension
# DT[i,j,by]
# take DT, filter rows in "i", compute "j" grouped by "by"

# 3 ways of creating :
# data.table()
# as.data.table()
# fread()

library(data.table)

x_df<- data.frame(id=1:2, name=c("a","b"))
#    id name
# 1  1    a
# 2  2    b

x_dt<- data.table(id=1:2, name=c("a","b"))
#     id name
# 1:  1    a
# 2:  2    b

y <- list(id=1:2,name=c("a","b"))
y_dt<- as.data.table(y)
class(y_dt)
# [1] "data.table" "data.frame"

rows<- nrow(y_dt)
cols<- ncol(y_dt)
