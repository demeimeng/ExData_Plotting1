# read data in
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# convert the Date column from Charactor to Date
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# filter date range
epc <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# convert the Date and Time variables to a new column
epc$DateTime <- strptime(paste(epc$Date, epc$Time), "%Y-%m-%d %H:%M:%S")

# plot 4
epc$DateTime <- as.POSIXct(epc$DateTime)
# set layout
par(mfrow = c(2, 2), mar=c(4,4,1,1), oma=c(0,0,1,0))
# show plot 2 at top left
plot(epc$Global_active_power ~ epc$DateTime, type = "l", xlab = "", ylab = "Global Active Power")
# draw new plot at top right
plot(epc$Voltage ~ epc$DateTime, type = "l", xlab = "datetime", ylab = "Voltage")
# show plot 3 at bottom left
plot(epc$Sub_metering_1 ~ epc$DateTime, type = "l", xlab = "", ylab = "Energe sub metering")
lines(epc$Sub_metering_2 ~ epc$DateTime, col = "Red")
lines(epc$Sub_metering_3 ~ epc$DateTime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty="n", cex = 0.8, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# draw new plot at bottom right
plot(epc$Global_reactive_power ~ epc$DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
# create the PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()