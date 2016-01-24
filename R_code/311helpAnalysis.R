setwd("C:/Users/Hetal/Desktop/Solutions Challenge/IBM")

library(zoo)
library(plyr)
library(MASS)
library(leaps)
library(scales)
library(ggplot2)

import.csv <- function(filename){
  return(read.csv(filename,sep="," ,header=TRUE))
}

mydata <-import.csv('comp_date_season.csv')
date <- as.Date(as.character(mydata[, 2]), '%m/%d/%Y')
mydata <- mydata[,-2]
mydata <- cbind.data.frame(mydata,date)



# plot num of calls, type and season
mydata$Season <- factor(mydata$Season,levels=c("Spring","Summer","Fall","Winter"))
p = ggplot(mydata, aes(x = Complaint.Type, y = X.Calls, fill = Season)) +
  geom_bar(width = .5,position = position_dodge(width = .5), stat = "identity")
# Axis labels
p = p + xlab("Year")
p = p + ylab("Type of complaints vs season")
print(p)


mydata.heating <- mydata[mydata$Complaint.Type=='HEATING',]

mydata.stlight <- mydata[mydata$Complaint.Type=='Street Light Condition',]

mydata.blockeddrive <- mydata[mydata$Complaint.Type=='Blocked Driveway',]

mydata.watersys <- mydata[mydata$Complaint.Type=='Water System',]

mydata.strtcond <- mydata[mydata$Complaint.Type=='Street Condition',]

mydata.sewer <- mydata[mydata$Complaint.Type=='Sewer',]

mydata.plumb <- mydata[mydata$Complaint.Type=='PLUMBING',]

mydata.plumb1 <- mydata[mydata$Complaint.Type=='Plumbing',]
mydata.plumb <- rbind.data.frame(mydata.plumb, mydata.plumb1)

mydata.paintplaster <- mydata[mydata$Complaint.Type=='PAINT - PLASTER',]

mydata.noise <- mydata[mydata$Complaint.Type=='Noise',]

mydata.park <-  mydata[mydata$Complaint.Type=='Illegal Parking',]

mydata.cons <- mydata[mydata$Complaint.Type=='GENERAL CONSTRUCTION',]

mydata.NONCONST <- mydata[mydata$Complaint.Type=='NONCONST',]
# create dataset for PC1 and date
p = ggplot(mydata.heating, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for Heating")

print(p)

p = ggplot(mydata.stlight, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for Street Light Condition")

print(p)

p = ggplot(mydata.blockeddrive, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for Blocked Driveway")

print(p)

p = ggplot(mydata.watersys, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for Water System")

print(p)

p = ggplot(mydata.sewer, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for Sewer")

print(p)

p = ggplot(mydata.plumb, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for Plumbing")

print(p)

p = ggplot(mydata.paintplaster, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for Paint-Plaster")

print(p)

p = ggplot(mydata.noise, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for Noise")

print(p)


p = ggplot(mydata.park, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for Illegal Parking")

print(p)

p = ggplot(mydata.cons, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for General Construction")

print(p)

p = ggplot(mydata.NONCONST, aes(x = date, y = X.Calls)) +
  geom_line()
# Axis labels
p = p + xlab("Year")
p = p + ylab("#Calls for NONCONST")

print(p)


