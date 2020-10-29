## Plot 4

# Load Data
data <- read.table('household_power_consumption.txt', header = FALSE, 
                   stringsAsFactors = F, na.strings = "?", sep = ';',
                   quote = "", skip = 66637, nrows = 2880)

# Name the columns
colnames(data) <- names(read.table('household_power_consumption.txt', 
                                   header=TRUE,sep=";",nrows=1))

# Convert the Date and Time variables to Date/Time classes
data$DateTime <- strptime(paste(data$Date, data$Time), 
                          format = '%d/%m/%Y %H:%M:%S')
data <- data[, c(10, 3:9)]

# Plot
png('plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2)) 
## Plot 4-1
plot(x = data$DateTime, y = data$Global_active_power, 
     type = 'l', xlab = NA, ylab = 'Global Active Power')
## Plot 4-2
plot(x = data$DateTime, y = data$Voltage, 
     type = 'l', xlab = 'datetime', ylab = 'Voltage')
## Plot 4-3
plot(x = data$DateTime, y = data$Sub_metering_1, type = 'l', xlab = NA, 
     ylab = 'Energy sub metering')
lines(x = data$DateTime, y = data$Sub_metering_2, col = 'red')
lines(x = data$DateTime, y = data$Sub_metering_3, col = 'blue')
legend('topright',col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd = 1, bty = 'n', lty=c(1,1), cex=.5)
## Plot 4-4
plot(x = data$DateTime, y = data$Global_active_power, type = 'l',
     xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()
