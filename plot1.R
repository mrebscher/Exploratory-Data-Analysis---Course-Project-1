h_power_c <- file("~/Coursera/Exploratory Data Analysis - Course Project 1/Data/household_power_consumption.txt")

data <- read.table(text = grep("^[1,2]/2/2007", readLines(h_power_c), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

png(file = "Plot1.png", width = 480, height = 480, units = "px")

#Plot 1
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")

dev.off()

