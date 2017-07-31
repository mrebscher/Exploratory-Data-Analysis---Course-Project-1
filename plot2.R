h_power_c <- file("~/Coursera/Exploratory Data Analysis - Course Project 1/Data/household_power_consumption.txt")

data <- read.table(text = grep("^[1,2]/2/2007", readLines(h_power_c), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

## Converting dates and time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 
DateTime <- paste(as.Date(data$Date), data$Time) 
data$DateTime <- as.POSIXct(DateTime)

png(file = "Plot2.png", width = 480, height = 480, units = "px")

#Plot2
plot(data$Global_active_power ~ data$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
