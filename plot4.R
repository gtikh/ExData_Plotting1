data<-read.csv("household_power_consumption.txt",sep=";",
    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
data$DateTime<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
use<-data$DateTime>="2007-02-01"&data$DateTime<"2007-02-03"
data<-data[use,]

png("plot4.png")

par("mfcol"=c(2,2))

plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")

plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$DateTime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(data$DateTime,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")



dev.off()
