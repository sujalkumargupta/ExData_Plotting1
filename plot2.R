# Read dataset
data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

# Convert date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# Filter dates
subset_data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# Create datetime
datetime <- strptime(paste(subset_data$Date, subset_data$Time),
                     "%Y-%m-%d %H:%M:%S")

# Convert column
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

# Save line plot
png("plot2.png",480,480)
plot(datetime,
     subset_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
