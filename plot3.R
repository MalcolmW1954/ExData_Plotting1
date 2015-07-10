setwd("C:/EDA-Project 1")
library(lubridate)

whole_table <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, na.strings = "?", header = TRUE )
required_data <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Date: Sub_metering_3)
required_data$Date <- dmy(required_data$Date)
required_data$Time <- hms(required_data$Time)

png(filename="plot3.png")

plot((required_data$Date + required_data$Time), required_data$Sub_metering_1, type= "l", ylab= "Energy sub metering", xlab="") 
lines ((required_data$Date + required_data$Time), required_data$Sub_metering_2,  type= "l", xlab="",  col= "red")
lines ((required_data$Date + required_data$Time), required_data$Sub_metering_3,  type= "l", xlab="",  col= "blue")
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
