#Subsetting the data
dat<-read.table(file="household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

Date1<-as.Date("01/02/2007", format="%d/%m/%Y")
Date2<-as.Date("02/02/2007", format="%d/%m/%Y")

datsub<-dat[as.Date(dat$Date, format="%d/%m/%Y") >= Date1 & as.Date(dat$Date, format="%d/%m/%Y") <= Date2,]

#Create PNG
png(filename="plot1.png",width = 480, height = 480, units = "px")

#Plot #1: histogram of Global active power

hist(datsub$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power" )

dev.off()