## read data from the file
data<-read.table("household_power_consumption.txt", nrow=70000, sep=";", na.string="?", header=TRUE)

## subset to only the 2 days in February 2007
data<- data[ which (data$Date == "1/2/2007" | data$Date == "2/2/2007"),  ]

## convert a new column named DateTime as date time object by pasting Date and Time column
##data$DateTime <- paste(data$Date, data$Time, sep=" ")
##data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

## draw the histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## copy the graph as png file
dev.copy(png, filename="plot1.png",width=480, height=480, units="px")
dev.off()
