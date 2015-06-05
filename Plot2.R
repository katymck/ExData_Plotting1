#Subsetting the data
dat<-read.table(file="household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

Date1<-as.Date("01/02/2007", format="%d/%m/%Y")
Date2<-as.Date("02/02/2007", format="%d/%m/%Y")

datsub<-dat[as.Date(dat$Date, format="%d/%m/%Y") >= Date1 & as.Date(dat$Date, format="%d/%m/%Y") <= Date2,]

#Create PNG
png(filename="plot2.png",width = 480, height = 480, units = "px")

#Making a date-time column:
datsub2 <- cbind(paste(datsub$Date,datsub$Time),datsub)
colnames(datsub2)[colnames(datsub2)=="paste(datsub$Date, datsub$Time)"] <- "times"

#Plotting the data
plot(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()