data<-read.csv("household_power_consumption.txt",sep=";",
    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
data$DateTime<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
use<-data$DateTime>="2007-02-01"&data$DateTime<"2007-02-03"
data<-data[use,]

png("plot2.png")
plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
