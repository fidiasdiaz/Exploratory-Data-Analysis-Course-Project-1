setwd("C:/Users/2014068/Downloads")

read_dat <- read.table(unz("exdata_data_household_power_consumption.zip", 
                           "household_power_consumption.txt"), sep = ";", 
                       header = TRUE, na.strings = "?")

data <- read_dat[(read_dat$Date == "1/2/2007" | read_dat$Date == "2/2/2007"),]

png("plot3.png", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1, pch = "", xlab = "", 
     ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_1)
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                              "Sub_metering_3"), pt.cex = 1, lty = 1,
       col = c("black", "red", "blue"), cex = 0.95)
dev.off()