# read data in
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# convert the Date column from Charactor to Date
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# filter date range
epc <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# convert the Date and Time variables to a new column
epc$DateTime <- strptime(paste(epc$Date, epc$Time), "%Y-%m-%d %H:%M:%S")

# plot 2 - plot for Global Active Power v.s. DateTime
epc$DateTime <- as.POSIXct(epc$DateTime)
plot(epc$Global_active_power ~ epc$DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# create the PNG file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()