setwd("C:/Users/2014068/Downloads")

read_dat <- read.table(unz("exdata_data_household_power_consumption.zip", 
                           "household_power_consumption.txt"), sep = ";", 
                       header = TRUE, na.strings = "?")

data <- read_dat[(read_dat$Date == "1/2/2007" | read_dat$Date == "2/2/2007"),]

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()