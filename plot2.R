setwd("C:/Users/2014068/Downloads")

read_dat <- read.table(unz("exdata_data_household_power_consumption.zip", 
                           "household_power_consumption.txt"), sep = ";", 
                       header = TRUE, na.strings = "?")

data <- read_dat[(read_dat$Date == "1/2/2007" | read_dat$Date == "2/2/2007"),]

data$datetime <- as.POSIXlt(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time))

png("plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, pch = "",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$datetime, data$Global_active_power)
dev.off()