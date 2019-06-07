setwd("C:/Users/2014068/Downloads")

read_dat <- read.table(unz("exdata_data_household_power_consumption.zip", 
                           "household_power_consumption.txt"), sep = ";", 
                           header = TRUE, na.strings = "?")

data <- read_dat[(read_dat$Date == "1/2/2007" | read_dat$Date == "2/2/2007"),]

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# (1, 1)
plot(data$datetime, data$Global_active_power, pch = "",
     xlab = "", ylab = "Global Active Power")
lines(data$datetime, data$Global_active_power)

# (1, 2)
plot(data$datetime, data$Voltage, pch = "", xlab = "datetime", ylab = "Voltage")
lines(data$datetime, data$Voltage)

# (2, 1)
plot(data$datetime, data$Sub_metering_1, pch = "", xlab = "", 
     ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_1)
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                              "Sub_metering_3"), pt.cex = 1, lty = 1,
       col = c("black", "red", "blue"), bty = "n", cex = 0.9)

# (2, 2)
plot(data$datetime, data$Global_reactive_power, pch = "", 
     xlab = "datetime", ylab = "Global_reactive_power")
lines(data$datetime, data$Global_reactive_power)
dev.off()