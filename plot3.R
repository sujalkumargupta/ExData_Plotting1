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

# Convert columns
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

# Save plot
png("plot3.png",480,480)

plot(datetime, subset_data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(datetime, subset_data$Sub_metering_2, col="red")
lines(datetime, subset_data$Sub_metering_3, col="blue")

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1)

dev.off()