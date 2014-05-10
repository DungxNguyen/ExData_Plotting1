
data <- read.table( "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

data$Date <- as.Date( data$Date, format = "%d/%m/%Y" )

data <- data[ data$Date >= as.Date( "2007-02-01" ) & data$Date <= as.Date( "2007-02-02" ), ]

png( file = "plot2.png" )

time <- strptime( paste( data$Date, data$Time, sep = " " ), format = "%Y-%m-%d %H:%M:%S" )

plot( time, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l" )

dev.off()