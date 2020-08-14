library(lubridate)
rm(list = ls())
## Reading in file, skipping rows
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
data <- read.table(file="household_power_consumption.txt", header= F, col.names = header , sep=";", dec=".", na.strings="?", skip = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))-1, nrows=2880 )

# Transform Date variable 

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

## Plot 2
png(filename = "plot2.png")
with(data, plot(datetime, y= Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()