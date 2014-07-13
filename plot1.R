household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", quote="")
data <-household_power_consumption[66637:69516,]
subset<-as.numeric(levels(data[,3]))[data[,3]]

png(file="plot1.png")
      hist(subset,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()