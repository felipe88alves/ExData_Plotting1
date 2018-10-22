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

#-------------------------------------------------------------
#Plot 2
plot(exData$Time, as.numeric(exData$Global_active_power), 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

#-------------------------------------------------------------
#copy plot as PNG
dev.copy(png, 
         file = "../figure/plot2.png",
         width     = 480,
         height    = 480,
         units = "px")

dev.off()