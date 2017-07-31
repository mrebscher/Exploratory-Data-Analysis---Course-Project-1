h_power_c <- file("~/Coursera/Exploratory Data Analysis - Course Project 1/Data/household_power_consumption.txt")

data <- read.table(text = grep("^[1,2]/2/2007", readLines(h_power_c), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

## Converting dates and time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 
DateTime <- paste(as.Date(data$Date), data$Time) 
data$DateTime <- as.POSIXct(DateTime)

png(file = "Plot4.png", width = 480, height = 480, units = "px")

## Plot4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0)) # define a place for th four figures

with(data, {
  plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering",xlab = "")
  lines(Sub_metering_2 ~ DateTime, col = 'Red')
  lines(Sub_metering_3 ~ DateTime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ DateTime, type = "l", ylab = "Global_rective_power", xlab = "datetime")
})

dev.off()
