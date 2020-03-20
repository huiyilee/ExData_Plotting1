## Read in household power consumption data set

power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## To view variable names of data set

head(power) 

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

## Create graph of energy sub metering over time, based on the "subset" dataset

plot3 <- {ggplot() + 
                geom_line(data = subset, aes(x = datetime, y = Sub_metering_1), color = "black") + 
                geom_line(data = subset, aes(x = datetime, y = Sub_metering_2), color = "red") + 
                geom_line(data = subset, aes(x = datetime, y = Sub_metering_3), color = "blue") + 
                xlab('Day/Time') + 
                ylab('Energy sub metering') }

##Create PNG file

png("plot3.png")
