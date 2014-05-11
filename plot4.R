
# Read data
data <- read.table( "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

# Convert date
data$Date <- as.Date( data$Date, format = "%d/%m/%Y" )

# Subset data
data <- data[ data$Date >= as.Date( "2007-02-01" ) & data$Date <= as.Date( "2007-02-02" ), ]

png( file = "plot4.png" )

# Convert time
time <- strptime( paste( data$Date, data$Time, sep = " " ), format = "%Y-%m-%d %H:%M:%S" )

# Create plot grid
par( "mfrow" = c( 2, 2) )

# Plot top left
plot( time, data$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l" )

# Plot top right
plot( time, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l" )

# Plot bot left
plot( time, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", col= "black" )
lines( time, data$Sub_metering_2, col = "red" )
lines( time, data$Sub_metering_3, col = "blue" )
legend( "topright", legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), bty = "n", lty = 1, col = c( "black", "red", "blue" ) )

# Plot bot right
plot( time, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l" )

dev.off()