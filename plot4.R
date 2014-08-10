# A script to plot a 4 fact graph 

# Load data, subset to Feb 1 and 2, and convert to datetime
data = read.table("C:\\R_Coursera\\exdata-data-household_power_consumption\\household_power_consumption.txt", header = TRUE, sep = ";")
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
sub = data[data$Date == as.Date("2007-02-01", "%Y-%m-%d")|data$Date == as.Date("2007-02-02", "%Y-%m-%d"),]
dates = paste(sub$Date, sub$Time)
sub$DateTime = strptime(dates, "%Y-%m-%d %H:%M:%S")

# PLOT!

png(file = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2), mar = c(2, 4, 4, 2), oma = c(0, 0, 0, 0))

plot(sub$DateTime, as.numeric(as.character(sub$Global_active_power)), type="l", ylab = "Global Active Power", xlab = "")

plot(sub$DateTime, as.numeric(as.character(sub$Sub_metering_1)), type="l", col="black", xlab = "", ylab = "Energy sub metering")
lines(sub$DateTime, as.numeric(as.character(sub$Sub_metering_2)), type="l", col="red")
lines(sub$DateTime, as.numeric(as.character(sub$Sub_metering_3)), type="l", col="blue")
legend("topright", lty = 1, bty = "n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.85)

plot(sub$DateTime, as.numeric(as.character(sub$Voltage)), type="l", ylab = "Voltage", xlab = "datetime")

plot(sub$DateTime, as.numeric(as.character(sub$Global_reactive_power)), type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()