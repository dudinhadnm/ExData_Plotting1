##reads the data file
library(chron)
electricpower <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
## turns the date and time data into the correct format
electricpower$Time <- times(electricpower$Time)
electricpower$Date <- as.Date(electricpower$Date, "%d/%m/%Y")
## creates subset with only the data for 2007-02-01 and 2007-02-02
electric <- subset(electricpower, Date == "2007-02-01"| Date == "2007-02-02")
electric$datetime <- strptime(paste(electric$Date, electric$Time, sep =" "), format = "%Y-%m-%d%H:%M:%S")

png("plot3.png")
with(electric, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
lines(electric$datetime, electric$Sub_metering_1, col = "black")
lines(electric$datetime, electric$Sub_metering_2, col = "red")
lines(electric$datetime, electric$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()