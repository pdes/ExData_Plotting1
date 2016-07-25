## Reads data from file.

data <- read.table('household_power_consumption.txt', sep = ';', header = T, stringsAsFactors=F)

## Subsetting data for 2007/02/01 & 2007/02/02

house_2day <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

## Convert the Global_active_power variable to numeric

house_2day$Global_active_power <- as.numeric(house_2day$Global_active_power)

## Save the histogram for Global Active Power in 'plot1.png'

png('plot1.png', width = 480, height = 480)

hist(house_2day$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

dev.off()
