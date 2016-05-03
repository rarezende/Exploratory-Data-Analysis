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

powerCons$Time <- paste(powerCons$Date, powerCons$Time)

powerCons$Time <- strptime(powerCons$Time, format = "%d/%m/%Y %H:%M:%S")

powerCons$Date <- strptime(powerCons$Date, format = "%d/%m/%Y")

windows()

with(powerCons, plot(Time, Global_active_power, type = "n"))

lines(powerCons$Time, powerCons$Global_active_power)


