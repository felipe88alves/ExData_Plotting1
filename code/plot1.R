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

#-------------------------------------------------------------
#Plot 1
hist(as.numeric(as.character(exData$Global_active_power)), 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#-------------------------------------------------------------
#copy plot as PNG
dev.copy(png, 
         file = "../figure/plot1.png",
         width     = 480,
         height    = 480,
         units = "px")

dev.off()

