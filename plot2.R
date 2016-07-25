## Reads data from file.

data <- read.table('household_power_consumption.txt', sep = ';', header = T, stringsAsFactors=F)

## Subsetting data for 2007/02/01 & 2007/02/02

house_2day <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

## Convert the Global_active_power variable to numeric and Date, Time variables to date & time

date_time <- strptime(paste(house_2day$Date, house_2day$Time), '%d/%m/%Y %H:%M:%S')
house_2day$Global_active_power <- as.numeric(house_2day$Global_active_power)

## Save the plot for Global Active Power vs date_time in 'plot2.png'

png('plot2.png', width = 480, height = 480)

plot(date_time, house_2day$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')

dev.off()