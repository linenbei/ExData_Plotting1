## Objective: create a line graph showing Energy submetering over time from the dataset,
## "household_power_consumption.txt", with Sub_metering_1, Sub_metering_2, and Sub_metering_3
## differentiated by color. Graph should also include a legend at the top right.

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

# Plot graph
png("plot3.png", width = 480, height = 480)                                     #designating png plotting device (480x480)
plot(datetime, subsetdata$Sub_metering_1, type = "l", col = "black",
     xlab = " ", 
     ylab = "Energy sub metering"
     )
lines(datetime, subsetdata$Sub_metering_2, type = "l", col = "red")            #adding Sub_metering_2 line
lines(datetime, subsetdata$Sub_metering_3, type = "l", col = "blue")           #adding Sub_metering_3 line
legend("topright",                                                             #adding legend
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1
       )
dev.off()