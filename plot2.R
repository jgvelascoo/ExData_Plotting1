## Plot 2

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
png('plot2.png', width = 480, height = 480)
plot(x = data$DateTime, y = data$Global_active_power, type = 'l', 
     xlab = NA, ylab = 'Global Active Power (kilowatts)')
dev.off()
