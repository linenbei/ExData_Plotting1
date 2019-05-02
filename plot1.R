## Objective: create a histogram for Global Active Power in kilowatts from the dataset,
## "household_power_consumption.txt".

#Set up data
rawdata <- read.csv("household_power_consumption.txt",
                    sep = ";"
                    )
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")                                   #converting "Dates" to date class
subsetdata <- subset(rawdata, 
                     Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2")      #subsetting data to be used
                     )

#Create Global Active Power histogram
Global_active_power_kilowatts <- as.numeric(subsetdata$Global_active_power)/500     #since the x axis of the histogram needs 
                                                                                    #to show values from 0-6 to show Global
                                                                                    #Active Power in kilowatts

png("plot1.png", width = 480, height = 480)                                         #designating png plotting device (480x480)
hist(Global_active_power_kilowatts,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red"
     )
dev.off()