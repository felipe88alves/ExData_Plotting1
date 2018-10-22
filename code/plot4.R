#-------------------------------------------------------------
#remove any exisintg plot and plot definitions
dev.off()

#-------------------------------------------------------------
#Read in Data
exData <- read.csv("../data/household_power_consumption.txt", sep= ";")

#-------------------------------------------------------------
#Prepare date-related Data
exData$Date <- as.Date(as.character(exData$Date) , "%d/%m/%Y")

exData <- subset(exData, Date >= "2007-02-01")
exData <- subset(exData, Date <= "2007-02-02")

exData$Time <- as.POSIXct(paste(exData$Date, exData$Time))

par(mfrow = c(2,2))

#-------------------------------------------------------------
#Plot 4.1 (same as previous plot2)
plot(exData$Time, as.numeric(exData$Global_active_power), 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

#-------------------------------------------------------------
#Plot 4.2
plot(exData$Time, as.numeric(exData$Voltage), 
     type="l", 
     xlab="datetime",
     ylab="Voltage")

#-------------------------------------------------------------
#Plot 4.3 (same as plot3)
plot(exData$Time,
     as.numeric(exData$Sub_metering_1),
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

points(exData$Time, exData$Sub_metering_2, type = "l", col = "red")
points(exData$Time, exData$Sub_metering_3, type = "l", col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))

#-------------------------------------------------------------
#plot 4.4
plot(exData$Time, as.numeric(exData$Global_reactive_power), 
     type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")

#-------------------------------------------------------------
#copy plot as PNG
dev.copy(png, 
         file = "../figure/plot4.png",
         width     = 480,
         height    = 480,
         units = "px")

dev.off()
