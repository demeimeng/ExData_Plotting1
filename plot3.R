# read data in
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# convert the Date column from Charactor to Date
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# filter date range
epc <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# convert the Date and Time variables to a new column
epc$DateTime <- strptime(paste(epc$Date, epc$Time), "%Y-%m-%d %H:%M:%S")

# plot 3
epc$DateTime <- as.POSIXct(epc$DateTime)
plot(epc$Sub_metering_1 ~ epc$DateTime, type = "l", xlab = "", ylab = "Energe sub metering")
lines(epc$Sub_metering_2 ~ epc$DateTime, col = "Red")
lines(epc$Sub_metering_3 ~ epc$DateTime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# create the PNG file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()