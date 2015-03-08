#Loading data for the given program

loaded_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)

# Changing the format of dates
loaded_data$Date <- as.Date(loaded_data$Date, format="%d/%m/%Y")

#Subsetting the required data
subset_data <- subset(loaded_data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Converting dates
datetime <- paste(subset_data$Date, subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(subset_data$Global_active_power~subset_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Saving the plot in PNG format
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
