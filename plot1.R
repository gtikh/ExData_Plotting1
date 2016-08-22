data<-read.csv("household_power_consumption.txt",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
data$Date<-strptime(data$Date,format="%d/%m/%Y")
use<-data$Date>="2007-02-01"&data$Date<="2007-02-02"
data<-data[use,]

png("plot1.png")
hist(data$Global_active_power,col="red",breaks=16,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
