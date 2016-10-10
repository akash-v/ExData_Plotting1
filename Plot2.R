data <- read.table("household_power_consumption.txt", sep = ";" , dec = ".",header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_needed <-  data[data$Date == "2007-02-01" | data$Date== " 2007-02-02",]
png("plot2.png", width=480, height=480)
datetime <- strptime(paste(data_needed$Date, data_needed$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
plot(datetime, as.numeric(data_needed$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()