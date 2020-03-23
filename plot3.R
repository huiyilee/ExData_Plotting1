## Read in household power consumption data set

power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## Filter out only rows in SCC data set relating to 1 Feb 2007 and 2 Feb 2007

subset <- power[which(power$Date == "1/2/2007" | power$Date == "2/2/2007"), ]

## Combine date and time variables to create a "datetime" variable, and convert this into a variable of Date/Time class

subset$datetime <- paste(subset$Date, subset$Time, sep = " ")
subset$datetime <- strptime(subset$datetime, "%d/%m/%Y %H:%M:%S")

## Check class of new "datetime" variable and convert to "POSIXct" class object

class(subset$datetime)
subset$datetime <- as.POSIXct(subset$datetime)

## Load ggplot2 package in R

install.packages("ggplot2")
library("ggplot2")

## Create file and set dimensions.

png("plot3.png", width=480, height=480)

## Create graph of energy sub metering over time, based on the "subset" dataset.

plot(subset$datetime, subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset$datetime, subset$Sub_metering_2,col="red")
lines(subset$datetime, subset$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

## Reset device

dev.off()