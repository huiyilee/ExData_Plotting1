## Read in household power consumption data set

power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## Filter out only rows in SCC data set relating to 1 Feb 2007 and 2 Feb 2007

subset <- power[which(power$Date == "1/2/2007" | power$Date == "2/2/2007"), ]

## Combine date and time variables to create a "datetime" variable, and convert this into a variable of Date/Time class

subset$datetime <- paste(subset$Date, subset$Time, sep = " ")
subset$datetime <- strptime(subset$datetime, "%d/%m/%Y %H:%M:%S")

## Check class of new "datetime" variable and convert to "POSIXlt" class object

class(subset$datetime)
subset$datetime <- as.POSIXlt(subset$datetime)

# set output
png("plot4.png", width=480, height=480)

## Create graphs of different variables (e.g. global active power, voltage, energy sub metering, global reactive power) over time, based on the "subset" dataset

par(mfrow=c(2,2))

plot(subset$datetime, subset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(subset$datetime,subset$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(subset$datetime, subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset$datetime, subset$Sub_metering_2, col="red")
lines(subset$datetime, subset$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "), lty=c(1,1), bty="n", cex=.5) 

plot(subset$datetime, subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Reset device

dev.off()