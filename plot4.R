epc <-read.csv("C:/Users/zakarya.ramde/Desktop/Coursera/Data Scientist/Exploration analytique des données/Course Project 1/exdata-data-household_power_consumption/household_power_consumption.txt", h=T, sep=";", na.strings="?", stringsAsFactors=F)
epc$Date<-as.Date(epc$Date, format="%d/%m/%Y")
str(epc)

##Subsetting data
epcSub<-subset(epc, subset=(Date>="2007-02-01" & Date <="2007-02-02"))
dateandtime<-paste(as.Date(epcSub$Date), epcSub$Time)
epcSub$Datetime <-as.POSIXct(dateandtime)

##Plot 4 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(epcSub, {
        plot(Datetime, Global_active_power, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Datetime, Voltage, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Datetime, Sub_metering_1, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Datetime, Global_reactive_power, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

##Saving file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()