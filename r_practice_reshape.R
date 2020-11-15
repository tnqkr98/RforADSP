#install.packages("reshape")
#install.packages("reshape2")
library(reshape)
library(reshape2)
data(airquality)

names(airquality)<-tolower(names(airquality))
print(names(airquality))

T<-melt(airquality,id=c("month","day"),na.rm=TRUE)
cast(T,day~month~variable)

a<-acast(T,month~variable,mean)
print(a)

b<-cast(T,month~variable,mean,margins=c("grand_row","grand_col"))
print(b)

e<-cast(T,day~month,mean,subset=variable=="ozone")
print(e)

f<-cast(T,month~variable,range)
print(f)