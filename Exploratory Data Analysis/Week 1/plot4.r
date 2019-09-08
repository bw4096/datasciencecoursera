## Aim of this script is to 
## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate 4 plots in 1 space (GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time)

## Parameters: none
## Assumes household_power_consumption.txt file located in working dir

## read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)

FullTimeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, FullTimeDate)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

## subset data
new_data <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## generate plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(new_data$FullTimeDate , as.numeric(new_data$Global_active_power),type="l", xlab="Day", ylab="Global Active Power (kilowatts)")
plot(new_data$FullTimeDate, as.numeric(new_data$Voltage),type = "l",xlab="datetime", ylab="Voltage") 
plot(new_data$FullTimeDate , as.numeric(new_data$Sub_metering_1) ,type="l", xlab="Day", ylab="Energy sub metering")
lines(new_data$FullTimeDate, new_data$Sub_metering_2,type="l", col= "red")
lines(new_data$FullTimeDate, new_data$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
plot(new_data$FullTimeDate, as.numeric(new_data$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()