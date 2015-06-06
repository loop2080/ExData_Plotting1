# load the data and filter
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# create a Date_time column 
Date_time <- strptime(apply(data, 1, function(x) paste(x[1], x[2])), format='%d/%m/%Y %H:%M:%S')
data <- cbind(Date_time, data)

# remove the original "Date" and "Time" columns
data <- subset(data, select = -c(Date, Time))

#Plot 2
png("plot2.png", width=480, height=480)
plot(data$Date_time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off