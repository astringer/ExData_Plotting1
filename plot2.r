# Plot2
# Start PNG
png(file = "plot2.png", width = 480, height = 480)

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
with(mydata2,
     plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
     )

# Close PNG
dev.off()