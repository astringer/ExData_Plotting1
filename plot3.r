# Plot3
# Start PNG
png(file = "plot3.png", width = 480, height = 480)

#Set background to transparent not white
par(bg = "transparent")

#Read in Data
mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subset data to just the required two dates
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata2 <- subset(mydata, mydata$Date>="2007-02-01" & mydata$Date<="2007-02-02")

#Create column DateTime
mydata2$DateTime <- paste(mydata2$Date, mydata2$Time)
mydata2$DateTime <- strptime(mydata2$DateTime, "%Y-%m-%d %H:%M:%S")

#Create Graph
with(mydata2, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
lines(mydata2$DateTime, mydata2$Sub_metering_1, type = "l", col = "black")
lines(mydata2$DateTime, mydata2$Sub_metering_2, type = "l", col = "red")
lines(mydata2$DateTime, mydata2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, pt.cex = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close PNG
dev.off()