library(lubridate)

## Reading in file, skipping rows 
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
data <- read.table(file="household_power_consumption.txt", header= F, col.names = header , sep=";", dec=".", na.strings="?", skip = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))-1, nrows=2880 )

# Transform Date variable 

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Plot 1
png(filename = "plot1.png")
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()
