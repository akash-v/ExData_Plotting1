data <- read.table("household_power_consumption.txt", sep = ";" , dec = ".",header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_needed <-  data[data$Date == "2007-02-01" | data$Date== " 2007-02-02",]
png("plot1.png", width=480, height=480)
hist(as.numeric(data_needed$Global_active_power) , col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()


