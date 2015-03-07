
# Data file name
file.name <- "household_power_consumption.txt"

# Check first 100 rows to figure out the classes of each column
initial <- read.table(file.name, sep=";", na.strings="?", header = TRUE, nrows = 100)
classes <- sapply(initial, class)

# Read data
data <- read.table(file.name, sep=";", na.strings="?", header = TRUE, colClasses = classes)

# Convert Date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter data to requested dates
data <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

# Create a new column with Date Time info
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

# Create the plot
png("plot2.png")
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
