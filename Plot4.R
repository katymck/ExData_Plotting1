#Subsetting the data
dat<-read.table(file="household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

Date1<-as.Date("01/02/2007", format="%d/%m/%Y")
Date2<-as.Date("02/02/2007", format="%d/%m/%Y")

datsub<-dat[as.Date(dat$Date, format="%d/%m/%Y") >= Date1 & as.Date(dat$Date, format="%d/%m/%Y") <= Date2,]


#Making a date-time column
datsub2 <- cbind(paste(datsub$Date,datsub$Time),datsub)
colnames(datsub2)[colnames(datsub2)=="paste(datsub$Date, datsub$Time)"] <- "times"

#Create PNG
png(filename="plot4.png",width = 480, height = 480, units = "px")

#Plotting the data
par(mfrow=c(2,2))
#1
plot(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#2
plot(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Voltage, type="l", xlab="datetime", ylab="Voltage")

#3
with(datsub2, plot(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"), col="black")
with(datsub2, points(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Sub_metering_2, type="l", col="red"))
with(datsub2, points(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Sub_metering_3, type="l", col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"), pch=c(NA,NA,NA))

#4
plot(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()