## plot1.r

setwd("C://Users//JKJ//Desktop//DS Courses//04 - Exploratory Data Analysis//Project 1//exdata-data-household_power_consumption//")
	#Set wd to avoid having to type long filename

dataset <- read.table("household_power_consumption.txt",
					   header = T,
					   sep = ";",
					   colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 
                       'numeric', 'numeric', 'numeric', 'numeric'),
					   na.strings = "?")
#head(dataset)
	#Used for testing

newDataset = dataset[(dataset$Date == '1/2/2007') | (dataset$Date == '2/2/2007'),]

#head(newDataset)
	#Used for testing

#write.table(newDataset, "newDataset.txt", sep="\t")
	#Saved the filtered results from original data set into a new file
	#I will plot the data from this new file.
	
#source("newDataset.txt")
	#Use newDataset.txt file as information source for the plot below

#str(newDataset)
	#Used to determine that newDataset is a data frame

png(filename = "plot2.png")
	#Open the device
	
plot(newDataset$timestamp,newDataset$Global_active_power,
	   type = "1",
	   #main = "",
	   #col = "black",
	   xlab = "",
	   ylab = "Global Active Power (kilowatts)")
	#Do the plot
	   
dev.off()
	#Close the device