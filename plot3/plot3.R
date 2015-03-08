#Loading data for the given program

loaded_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)

# Changing the format of dates
loaded_data$Date <- as.Date(loaded_data$Date, format="%d/%m/%Y")

#Subsetting the required data
subset_data <- subset(loaded_data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Converting dates
datetime <- paste(subset_data$Date, subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

# Plot 3
with(subset_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()