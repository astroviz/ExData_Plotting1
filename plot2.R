household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", quote="")
data <-household_power_consumption[66637:69516,]

date <- as.character(data[,1])
time <- as.character(data[,2])
date.time <- paste(date, time)
date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")

subset<-as.numeric(levels(data[,3]))[data[,3]]

png(file="plot2.png")
      plot(date.time,subset, ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()