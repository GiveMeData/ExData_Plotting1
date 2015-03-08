#Loading data for the given program

loaded_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)

# Changing the format of dates
loaded_data$Date <- as.Date(loaded_data$Date, format="%d/%m/%Y")

#Subsetting the required data
subset_data <- subset(loaded_data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Plot.1
hist(subset_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to PNG file format
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()