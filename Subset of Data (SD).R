x<- data.table( id=c(1,1,2,2,1,1), val1 = 1:6 , val2 = letters[6:1])
#    id val1 val2
#1:  1    1    f
#2:  1    2    e
#3:  2    3    d
#4:  2    4    c
#5:  1    5    b
#6:  1    6    a

x[,print(.SD),by=.(id)]
#   val1 val2
#1:    1    f
#2:    2    e
#3:    5    b
#4:    6    a
#    val1 val2
#1:    3    d
#2:    4    c

