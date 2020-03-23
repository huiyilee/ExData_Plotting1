## Read in household power consumption data set

power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power2 <- as_tibble(power)

## To view variable names of data set

head(power) 

## Filter out only rows relating to 1 Feb 2007 and 2 Feb 2007

subset <- dplyr::filter(power, grepl('1/2/2007|2/2/2007', Date)) 

## Convert "Global_active_power" variable into object of numeric class

subset$Global_active_power <- as.numeric(subset$Global_active_power)

## Create file and set dimensions.

png("plot1.png", width=480, height=480)

## Create histogram of global active power based on the "subset" dataset.

plot1 <- hist(subset$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="Red")

## Reset device.
dev.off()