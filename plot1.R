## Read in household power consumption data set

power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## To view variable names of data set

head(power) 

## Filter out only rows in SCC data set relating to 1 Feb 2007 and 2 Feb 2007

subset <- dplyr::filter(power, grepl('1/2/2007|2/2/2007', Date)) 

## Convert "Global_active_power" variable into object of numeric class

subset$Global_active_power <- as.numeric(subset$Global_active_power)

## Create histogram of global active power based on the "subset" dataset

plot1 <- hist(subset$Global_active_power, xlab = "Global Active Power", ylab = "Frequency")

##Create PNG file

png("plot1.png")
