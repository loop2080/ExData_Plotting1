# load the data and filter
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# create a Date_time column 
Date_time <- strptime(apply(data, 1, function(x) paste(x[1], x[2])), format='%d/%m/%Y %H:%M:%S')
data <- cbind(Date_time, data)

# remove the original "Date" and "Time" columns
data <- subset(data, select = -c(Date, Time))

#Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
plot(data$Date_time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(data$Date_time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$Date_time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date_time, data$Sub_metering_2, col="red")
lines(data$Date_time, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.5)
plot(data$Date_time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off