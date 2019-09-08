## Aim of this script is to 
## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate a histogram of global active power(kilowatts)

## Parameters: none
## Assumes household_power_consumption.txt file located in working dir

## read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)

## subset data
new_data <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")

## generate histogram
png("plot1.png", width=480, height=480)
hist(as.numeric(new_data$Global_active_power), col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()