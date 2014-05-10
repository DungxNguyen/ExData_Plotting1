

data <- read.table( "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

data$Date <- as.Date( data$Date, format = "%d/%m/%Y" )

data <- data[ data$Date >= as.Date( "2007-02-01" ) & data$Date <= as.Date( "2007-02-02" ), ]

png( file = "plot1.png" )

hist( data$Global_active_power, col = "red", main = "Global Active Prower", xlab= "Global Active Power (kilowatts)" )

dev.off()
