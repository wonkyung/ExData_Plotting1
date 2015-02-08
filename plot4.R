## read data from the file
data<-read.table("household_power_consumption.txt", nrow=70000, sep=";", na.string="?", header=TRUE)

## subset to only the 2 days in February 2007
data<- data[ which (data$Date == "1/2/2007" | data$Date == "2/2/2007"),  ]

## convert a new column named DateTime as date time object by pasting Date and Time column
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

#Set locale to English
Sys.setlocale("LC_TIME", "English")

## set 2 rows and 2 columns
par(mfrow=c(2,2))

#Draw the first plot
plot(y = data$Global_active_power, x=data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Draw the second plot
plot(y = data$Voltage, x=data$DateTime, type="l", ylab="Voltage", xlab="datetime")

## draw the third plot
with(data, plot(y=Sub_metering_1, x=DateTime, col="black", type="l", 
                ylab="Energy sub metering",  xlab=""))
with(data, points(y=Sub_metering_2, x=DateTime, col="red", type="l"))
with(data, points(y=Sub_metering_3, x=DateTime, col="blue", type="l"))
#legend("topright", lty=c(1,1,1), cex=0.7, text.width = c(40000,40000,40000),
legend("topright", lty=c(1,1,1), cex=0.4, text.width = c(50000,50000,50000), y.intersp=0.4,
              col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#Draw the fourth plot
plot(y = data$Global_reactive_power, x=data$DateTime, type="l", ylab="Global_reactive_power", xlab="datetime")


## copy the graph as png file
dev.copy(png, filename="plot4.png",width=480, height=480, units="px")
dev.off()
