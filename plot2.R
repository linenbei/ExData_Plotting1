## Objective: create a line graph showing Global Active Power in kilowatts over time from the dataset,
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
datetime <- strptime(paste(subsetdata$Date,                                     #Combine date & time
                           subsetdata$Time,
                           sep = " "
                           ),
                    "%Y-%m-%d %H:%M:%S"
                    )

#Plot line graph
png("plot2.png", width = 480, height = 480)                                     #designating png plotting device (480x480)
plot(datetime, Global_active_power_kilowatts,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
     )
dev.off()