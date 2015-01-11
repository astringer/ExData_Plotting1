# Plot1
# Start PNG
png(file = "plot1.png", width = 480, height = 480)

#Set background to transparent not white
par(bg = "transparent")

#Read in Data
mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subset data to just the required two dates
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata2 <- subset(mydata, mydata$Date>="2007-02-01" & mydata$Date<="2007-02-02")

#Create Histogram
with(mydata2,
     hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", )
     )

# Close PNG
dev.off()