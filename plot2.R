#----------------------------------------------------------#
#            Exploratory Data Analysis Course
#
# Course Project 1
# Script for generating Plot 2
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
png("plot2.png")

with(powerCons, plot(Time, 
                     Global_active_power, 
                     type = "n", 
                     xlab = "", 
                     ylab = "Global Active Power (kilowatts)"))
     
with(powerCons, lines(Time, Global_active_power))

dev.off()

