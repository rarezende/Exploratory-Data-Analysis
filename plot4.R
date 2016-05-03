#----------------------------------------------------------#
#            Exploratory Data Analysis Course
#
# Course Project 1
# Script for generating Plot 4
#----------------------------------------------------------#

# Reads power comsuption data from file
fileName <- "./Data/household_power_consumption.txt"

varNames <- c("Date",
              "Time",
              "Global_active_power",
              "Global_reactive_power",
              "Voltage",
              "Global_intensity",
              "Sub_metering_1",
              "Sub_metering_2",
              "Sub_metering_3")

powerCons<-read.csv(fileName, 
                    sep = ";", 
                    col.names = varNames,
                    skip = 66636,
                    nrows = 2880)

# Converts Date and Time variables to Date/Time classes in R
powerCons$Time <- paste(powerCons$Date, powerCons$Time)
powerCons$Time <- strptime(powerCons$Time, format = "%d/%m/%Y %H:%M:%S")
powerCons$Date <- strptime(powerCons$Date, format = "%d/%m/%Y")


# Plots to file
png("plot4.png")

par(mfcol = c(2,2))

# First chart
with(powerCons, plot(Time, 
                     Global_active_power, 
                     type = "n", 
                     xlab = "", 
                     ylab = "Global Active Power (kilowatts)"))

with(powerCons, lines(Time, Global_active_power))

# Second chart
with(powerCons, plot(Time, 
                     Sub_metering_1, 
                     type = "n",
                     xlab = "", 
                     ylab = "Energy sub metering"))

with(powerCons, {
    lines(Time, Sub_metering_1, col="black")
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
})

legend("topright", 
       lty = 1, 
       bty = "n",
       col= c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Third chart
with(powerCons, plot(Time, 
                     Voltage, 
                     xlab = "datetime",
                     type = "n"))

with(powerCons, lines(Time, Voltage))

# Fourth chart
with(powerCons, plot(Time, 
                     Global_reactive_power, 
                     xlab = "datetime",
                     type = "n"))

with(powerCons, lines(Time, Global_reactive_power))


dev.off()
