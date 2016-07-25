## Reads data from file.

data <- read.table('household_power_consumption.txt', sep = ';', header = T, stringsAsFactors=F)

## Subsetting data for 2007/02/01 & 2007/02/02

house_2day <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

## Convert the sub_metering variables to numeric and Date, Time variables to date & time

date_time <- strptime(paste(house_2day$Date, house_2day$Time), '%d/%m/%Y %H:%M:%S')
house_2day$Sub_metering_1 <- as.numeric(house_2day$Sub_metering_1)
house_2day$Sub_metering_2 <- as.numeric(house_2day$Sub_metering_2)
house_2day$Sub_metering_3 <- as.numeric(house_2day$Sub_metering_3)


## Save the plot for Energy sub metering variables vs date_time in 'plot3.png'

png('plot3.png', width = 480, height = 480)

## Create plot of date/time vs Sub_metering_1

plot(date_time, house_2day$Sub_metering_1, type = 'n', ylab = 'Energy sub metering', xlab = '')

## Add a line graph of date/time vs Sub_metering_1

lines(date_time, house_2day$Sub_metering_1, type= 'l')

## Add a line graph of date/time vs Sub_metering_2

lines(date_time, house_2day$Sub_metering_2, type= 'l', col = 'red')

## Add a line graph of date/time vs Sub_metering_3

lines(date_time, house_2day$Sub_metering_3, type= 'l', col = 'blue')

## Add legend to the graph

legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), lwd = 2)

dev.off()