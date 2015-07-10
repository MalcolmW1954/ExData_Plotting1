setwd("C:/EDA-Project 1")
library(lubridate)

whole_table <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, na.strings = "?", header = TRUE )
required_data <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Date: Sub_metering_3)
required_data$Date <- dmy(required_data$Date)
required_data$Time <- hms(required_data$Time)

png(filename="plot2.png")
plot((required_data$Date + required_data$Time), required_data$Global_active_power, type= "l", ylab= "Global Active Power (kilowatts)", xlab="")

dev.off()
