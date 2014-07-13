household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", quote="")
data <-household_power_consumption[66637:69516,]

date <- as.character(data[,1])
time <- as.character(data[,2])
date.time <- paste(date, time)
date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")

Sub_metering_1<-as.numeric(levels(data[,7]))[data[,7]]
Sub_metering_2<-as.numeric(levels(data[,8]))[data[,8]]
Sub_metering_3<-data[,9]

png(file="plot3.png")
      plot(Sub_metering_1,ylab="Energy sub metering",xlab="",type="l",col="black")
      lines(Sub_metering_2,xlab="",type="l",col="red")
      lines(Sub_metering_3,xlab="",type="l",col="blue")
      legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()