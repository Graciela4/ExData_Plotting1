library(lubridate)

## Reading in file, skipping rows 
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
data <- read.table(file="household_power_consumption.txt", header= F, col.names = header , sep=";", dec=".", na.strings="?", skip = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))-1, nrows=2880 )

# Transform Date variable 

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

## Plot 4
png(filename = "plot4.png")
par(mfrow = c(2,2))
## First plot
with(data, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
## Second plot
with(data, plot(datetime, Voltage, type = "l" ))
## Third plot
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
points(data$datetime, data$Sub_metering_2, type = "l", col = "red")
points(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.9 )
## Fourth plot
with(data, plot(datetime, Global_reactive_power, type = "l"))
dev.off()
