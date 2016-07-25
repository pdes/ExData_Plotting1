## Reads data from file.

data <- read.table('household_power_consumption.txt', sep = ';', header = T, stringsAsFactors=F)

## Subsetting data for 2007/02/01 & 2007/02/02

house_2day <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

## Convert variable types to date time & numeric

date_time <- strptime(paste(house_2day$Date, house_2day$Time), '%d/%m/%Y %H:%M:%S')

house_2day$Global_active_power <- as.numeric(house_2day$Global_active_power)
house_2day$Global_reactive_power <- as.numeric(house_2day$Global_reactive_power)
house_2day$Voltage <- as.numeric(house_2day$Voltage)
house_2day$Global_intensity <- as.numeric(house_2day$Global_intensity)
house_2day$Sub_metering_1 <- as.numeric(house_2day$Sub_metering_1)
house_2day$Sub_metering_2 <- as.numeric(house_2day$Sub_metering_2)
house_2day$Sub_metering_3 <- as.numeric(house_2day$Sub_metering_3)


## Save the plost to plot4.png

png('plot4.png', width = 480, height = 480)

par(mfcol = c(2,2))

## Plot for Global Active Power vs date_time in 'plot2.png'

plot(date_time, house_2day$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')

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

## Create plot of date/time vs Voltage

plot(date_time, house_2day$Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')

## Create plot of date/time vs Global_reactive_power

plot(date_time, house_2day$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power', xlab = 'datetime')

dev.off()