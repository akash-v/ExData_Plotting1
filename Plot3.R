
data <- read.table("household_power_consumption.txt", sep = ";" , dec = ".",header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_needed <-  data[data$Date == "2007-02-01" | data$Date== " 2007-02-02",]

data_needed$Date<- paste(data_needed$Date, data_needed$Time, sep=" ")
data_needed$Date<- strptime(data_needed$Date , "%Y-%m-%d %H:%M:%S")
 
png("plot3.png", width=480, height=480)

plot(data_needed$Date, data_needed$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data_needed$Date, data_needed$Sub_metering_2, type="l",col = "red")
lines(data_needed$Date, data_needed$Sub_metering_3, type="l",col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()