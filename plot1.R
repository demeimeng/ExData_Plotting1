# read data in
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# convert the Date column from Charactor to Date
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# filter date range
epc <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# convert the Date and Time variables to a new column
epc$DateTime <- strptime(paste(epc$Date, epc$Time), "%Y-%m-%d %H:%M:%S")

# plot 1 - histgram for Global Active Power v.s. Frequency
hist(epc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

# create the PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()