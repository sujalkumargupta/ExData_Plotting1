# Read dataset
data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

# Convert date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# Filter required dates
subset_data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# Convert column
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

# Save histogram
png("plot1.png",480,480)
hist(subset_data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()