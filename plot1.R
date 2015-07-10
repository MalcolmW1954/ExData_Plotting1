setwd("C:/EDA-Project 1")

whole_table <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, na.strings = "?", header = TRUE )
required_data <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Date: Sub_metering_3)
required_data$Global_active_power <- as.numeric(required_data$Global_active_power)

png(filename="plot1.png")
hist ((required_data$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowats)", col = "red" )

dev.off()
