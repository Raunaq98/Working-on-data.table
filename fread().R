directory<- getwd()
URL<-"https://perso.telecom-paristech.fr/eagan/class/igr204/data/cereal.csv"
  
download.file(URL,paste0(directory,"/data_down.csv"),method="curl")
data_down<- fread(paste0(directory,"/data_down.csv"))

#fread() or fast read reads data very efficiently and can make its way around headers and other arguments


### choosing rows
data_3_rows <- fread(paste0(directory,"/data_down.csv"), nrows= 3)

data_not_first_50 <- fread(paste0(directory,"/data_down.csv"), skip=50)


#### choosing column
## if we want only mfr and type columns ie. 1 and 2nd column
data_first2<- fread(paste0(directory,"/data_down.csv"),select=c("mfr","type"))
#or
data_first22<- fread(paste0(directory,"/data_down.csv"),select=c(1,2))



## if we want all columns except protein column ie. 4th column
data_not4 <- data_first2<- fread(paste0(directory,"/data_down.csv"),drop=c("protein"))
#or
data_not44<- fread(paste0(directory,"/data_down.csv"),drop=c(4))

