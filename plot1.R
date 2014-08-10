# Script that will create a bar plot showing Global active power by Frequency

# Load data, subset to Feb 1 and 2, and convert to datetime
data = read.table("C:\\R_Coursera\\exdata-data-household_power_consumption\\household_power_consumption.txt", header = TRUE, sep = ";")
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
sub = data[data$Date == as.Date("2007-02-01", "%Y-%m-%d")|data$Date == as.Date("2007-02-02", "%Y-%m-%d"),]
dates = paste(sub$Date, sub$Time)
sub$DateTime = strptime(dates, "%Y-%m-%d %H:%M:%S")

png(file = "plot1.png", width = 480, height = 480)

# Plot histogram
hist(as.numeric(as.character(sub$Global_active_power)), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.off()
