#Subsetting the data
dat<-read.table(file="household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

Date1<-as.Date("01/02/2007", format="%d/%m/%Y")
Date2<-as.Date("02/02/2007", format="%d/%m/%Y")

datsub<-dat[as.Date(dat$Date, format="%d/%m/%Y") >= Date1 & as.Date(dat$Date, format="%d/%m/%Y") <= Date2,]

#Create PNG
png(filename="plot3.png",width = 480, height = 480, units = "px")

#Making a date-time column:
datsub2 <- cbind(paste(datsub$Date,datsub$Time),datsub)
colnames(datsub2)[colnames(datsub2)=="paste(datsub$Date, datsub$Time)"] <- "times"


#plot(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
#This plots one of the meters, but now I need to subset them to get all 3 and plot them together. Next:


with(datsub2, plot(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"), col="black")
with(datsub2, points(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Sub_metering_2, type="l", col="red"))
with(datsub2, points(strptime(datsub2$times, format="%d/%m/%Y %H:%M:%S"), datsub2$Sub_metering_3, type="l", col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"), pch=c(NA,NA,NA))

dev.off()