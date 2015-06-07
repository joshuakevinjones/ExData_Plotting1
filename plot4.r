## plot4.r

setwd("C://Users//JKJ//Desktop//DS Courses//04 - Exploratory Data Analysis//Project 1//exdata-data-household_power_consumption//")
	#Set wd to avoid having to type long filename

dataset <- read.table("newDataset.txt",
					   header = T,
					   sep = "\t",
					   #colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 
                       #'numeric', 'numeric', 'numeric', 'numeric'),
					   na.strings = "?")

x <- paste(dataset$Date, dataset$Time)
dataset$DT <- strptime(x, "%d/%m/%Y %H:%M:%S")

dataset<-na.omit(dataset)

png(filename = "plot4.png")
	#Open the device in the for output to the working directory

##Lower left plot (Plot 3)
y <- dataset
plot(y[,10],y[,7],
	   type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(y[,10],y[,8],
	   col = "red")
lines(y[,10],y[,9],
	   col = "blue")
	   
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
	   #Do the plot
	   
##Upper left plot (Plot 2)
plot(dataset$DT,dataset$Global_active_power,
	   type = "l",
	   #main = "",
	   col = "black",
	   xlab = "",
	   ylab = "Global Active Power (kilowatts)")
	   #Do the plot

##Upper right plot (new plot)
plot(dataset$DT,dataset$Voltage,
	   type = "l",
	   #main = "",
	   col = "black",
	   xlab = "Date & Time",
	   ylab = "Voltage")
	   #Do the plot   

##Lower right plot (new plot)	   
plot(dataset$DT,dataset$Global_reactive_power,
	   type = "l",
	   #main = "",
	   col = "black",
	   xlab = "Date & Time",
	   ylab = "Global_reactive_power")
	   #Do the plot  
	   
dev.off()
	#Close the device
       