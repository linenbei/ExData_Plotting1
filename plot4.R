## Objective: create four line graphs showing 1) Global Active Power over time, 2) Voltage over time,
## 3) Energy sub metering over time, and 4) Globacl reactive power over time from the dataset,
## "household_power_consumption.txt".

# Set up data
rawdata <- read.csv("household_power_consumption.txt",
                    sep = ";",
                    stringsAsFactors = FALSE
                    )
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")                               #converting "Dates" to date class
subsetdata <- subset(rawdata,
                     Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2")  #subset of data to be used
                     )
datetime <- strptime(paste(subsetdata$Date,                                     #combine date and time
                           subsetdata$Time,
                           sep = " "
                           ),
                     "%Y-%m-%d %H:%M:%S"
                     )

# Plot graphs
png("plot4.png", width = 480, height = 480)                                     #designating png plotting device
par(mfrow = c(2,2))                                                             #setting up 2x2 matrix
plot(datetime,                                                                  #1st plot
     Global_active_power_kilowatts,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power"
     )
plot(datetime,                                                                  #2nd plot
     subsetdata$Voltage,
     type = "l",
     ylab = "Voltage"
     )
plot(datetime,                                                                  #3rd plot
     subsetdata$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = " ",
     ylab = "Energy sub metering"
     )
     lines(datetime,                                                            #adding Sub_metering_2
           subsetdata$Sub_metering_2,
           type = "l",
           col = "red"
           )
     lines(datetime,                                                            #adding Sub_metering_3
           subsetdata$Sub_metering_3,
           type = "l",
           col = "blue"
           )
     legend("topright",
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col = c("black", "red", "blue"),
            lty = 1,
            bty = "n",                                                          #removing border
            cex = 0.85                                                          #sizing legend
            )
plot(datetime,                                                                  #4th plot
     subsetdata$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power"
     )
dev.off()