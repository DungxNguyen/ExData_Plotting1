
data <- read.table( "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

data$Date <- as.Date( data$Date, format = "%d/%m/%Y" )

data <- data[ data$Date >= as.Date( "2007-02-01" ) & data$Date <= as.Date( "2007-02-02" ), ]

png( file = "plot4.png" )

time <- strptime( paste( data$Date, data$Time, sep = " " ), format = "%Y-%m-%d %H:%M:%S" )

par( "mfrow" = c( 2, 2) )

plot( time, data$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l" )

plot( time, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l" )

plot( time, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", col= "black" )
lines( time, data$Sub_metering_2, col = "red" )
lines( time, data$Sub_metering_3, col = "blue" )
legend( "topright", legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), bty = "n", lty = 1, col = c( "black", "red", "blue" ) )

plot( time, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l" )

dev.off()