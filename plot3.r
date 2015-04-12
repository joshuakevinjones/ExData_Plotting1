## plot3.r

setwd("C://Users//JKJ//Desktop//DS Courses//04 - Exploratory Data Analysis//Project 1//exdata-data-household_power_consumption//")
	#Set wd to avoid having to type long filename

dataset <- read.table("newDataset.txt",
					   header = T,
					   sep = "\t",
					   #colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 
                       #'numeric', 'numeric', 'numeric', 'numeric'),
					   na.strings = "?")

##dataset$Date<-paste(dataset[,1],dataset[,2])

x <- paste(dataset$Date, dataset$Time)
dataset$DT <- strptime(x, "%d/%m/%Y %H:%M:%S")

dataset<-na.omit(dataset)
y<-dataset

png(filename = "plot3.png")
	#Open the device in the for output to the working directory

plot(y[,10],y[,7],
	   type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(y[,10],y[,8],
	   col = "red")
lines(y[,10],y[,9],
	   col = "blue")
	   
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
	   
dev.off()
	#Close the device
       