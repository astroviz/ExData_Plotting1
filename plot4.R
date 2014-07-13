household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", quote="")
data <-household_power_consumption[66637:69516,]

date <- as.character(data[,1])
time <- as.character(data[,2])
date.time <- paste(date, time)
date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")

Global_Active_Power<-as.numeric(levels(data[,3]))[data[,3]]
Global_Reactive_Power<-as.numeric(levels(data[,4]))[data[,4]]
Voltage<-as.numeric(levels(data[,5]))[data[,5]]
Sub_metering_1<-as.numeric(levels(data[,7]))[data[,7]]
Sub_metering_2<-as.numeric(levels(data[,8]))[data[,8]]
Sub_metering_3<-data[,9]


png(file="plot4.png")
par(mfrow=c(2,2))
plot(date.time,Global_Active_Power, ylab="Global Active Power",xlab="",type="l")

plot(date.time,Voltage, ylab="Voltage",xlab="datetime",type="l")

plot(Sub_metering_1,ylab="Energy sub metering",xlab="",type="l",col="black")
lines(Sub_metering_2,xlab="",type="l",col="red")
lines(Sub_metering_3,xlab="",type="l",col="blue")
legend("topright", col = c("black", "red", "blue"),bty="n",lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

plot(date.time,Global_Reactive_Power, ylab="Global_reactive_power",xlab="datetime",type="l")

dev.off()