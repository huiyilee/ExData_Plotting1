## Read in household power consumption data set

power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## To view variable names of data set

head(power) 

## Filter out only rows in SCC data set relating to 1 Feb 2007 and 2 Feb 2007

subset <- power[which(power$Date == "1/2/2007" | power$Date == "2/2/2007"), ]

## Combine date and time variables to create a "datetime" variable, and convert this into a variable of Date/Time class

subset$datetime <- paste(subset$Date, subset$Time, sep = " ")
subset$datetime <- strptime(subset$datetime, "%d/%m/%Y %H:%M:%S")

## Check class of new "datetime" variable and convert to "POSIXlt" class object

class(subset$datetime)

## Create graph of global active power over time, based on the "subset" dataset

plot2 <- plot(subset$datetime, subset$Global_active_power, type = "l", xlab = "Day/Time", ylab = "Global Active Power (kilowatts)")

##Create PNG file

png("plot2.png")
