
# Read data
data <- read.table( "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

# Convert date
data$Date <- as.Date( data$Date, format = "%d/%m/%Y" )

# Subset data
data <- data[ data$Date >= as.Date( "2007-02-01" ) & data$Date <= as.Date( "2007-02-02" ), ]

png( file = "plot3.png" )

# Convert time
time <- strptime( paste( data$Date, data$Time, sep = " " ), format = "%Y-%m-%d %H:%M:%S" )

# Plot
plot( time, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", col= "black" )

# Add additional lines
lines( time, data$Sub_metering_2, col = "red" )
lines( time, data$Sub_metering_3, col = "blue" )

# Add legend
legend( "topright", legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lty = 1, col = c( "black", "red", "blue" ) )

dev.off()
