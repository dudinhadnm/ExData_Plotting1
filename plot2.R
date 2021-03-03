##reads the data file
library(chron)
electricpower <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
## turns the date and time data into the correct format
electricpower$Time <- times(electricpower$Time)
electricpower$Date <- as.Date(electricpower$Date, "%d/%m/%Y")
## creates subset with only the data for 2007-02-01 and 2007-02-02
electric <- subset(electricpower, Date == "2007-02-01"| Date == "2007-02-02")
electric$datetime <- strptime(paste(electric$Date, electric$Time, sep =" "), format = "%Y-%m-%d%H:%M:%S")


plot(electric$datetime, electric$Global_active_power, pch = ".")
lines(electric$datetime, electric$Global_active_power)
