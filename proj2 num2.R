getwd() #sets the directory where the files are located
setwd("C:/Users/Jin/Documents/R Files")

library(data.table) #loads the package

power <- fread("household_power_consumption_data/household_power_consumption.txt", na.strings = "?") #reads the data
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ] #only reads the data from 1/2/2007to 2/2/2007

#plot 1------------------------------------------------------------------------------------------------------------------

png("plot1.png") #creates plot 1 png file
hist(power$Global_active_power, 
  xlab = "Global Active Power (kilowatts)",
  ylab = "",
  main = "Global Active Power",
  col = "Red") # makes a histogram plot with title Global Active Power (kilowatts) and red columns
dev.off() #finalizes the plot

#plot 2------------------------------------------------------------------------------------------------------------------

power$Date <- as.Date(power$Date, '%d/%m/%Y') #converts the Date column to the specified format (dd/mm/yy)
power$DateTime <- as.POSIXct(paste0(power$Date, power$Time)) #function converts data and time then stores it to column DateTime
png("plot2.png") #creates plot 2 png file
plot(power$DateTime,
  power$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)") #makes a line graph with DateTime at x-axis and Global Active Power (kilowatts) in y-axis
dev.off() #finalizes the plot

#plot 3------------------------------------------------------------------------------------------------------------------

png("plot3.png") #creates plot 3 png file
plot(power$DateTime,
  power$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy Sub Metering") #makes another line graph with Energy Sub Metering at y-axis
lines(power$DateTime, power$Sub_metering_2,col = 'red') #differentiates metering 2 from metering 3 by setting it into colors red and blue, respectively
lines(power$DateTime, power$Sub_metering_3,col = 'blue') 
legend("topright", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=1) #creates a legend at the topright corner
dev.off() #finalizes the plot

#plot 4------------------------------------------------------------------------------------------------------------------

png("plot4.png")
par(mfrow = c(2,2)) #layouts the plots as 2x2, by row

#[plot 1]
plot(power$DateTime,
  power$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatt)") 

#[plot 2]
plot(power$DateTime,
  power$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage") 

#[plot 3]
plot(power$DateTime,
  power$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy Sub Metering")
lines(power$DateTime, power$Sub_metering_2,col = 'red')
lines(power$DateTime, power$Sub_metering_3,col = 'blue')
legend("topright",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=1, bty = 'n')

#[plot 4]
plot(power$DateTime,
  power$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power") #makes a line graph with datetime at x-axis and Global_reactive_powe at y-axis

dev.off()#finalizes the plots
