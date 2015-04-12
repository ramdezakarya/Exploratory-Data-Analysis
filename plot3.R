epc <-read.csv("C:/Users/zakarya.ramde/Desktop/Coursera/Data Scientist/Exploration analytique des données/Course Project 1/exdata-data-household_power_consumption/household_power_consumption.txt", h=T, sep=";", na.strings="?", stringsAsFactors=F)
epc$Date<-as.Date(epc$Date, format="%d/%m/%Y")
str(epc)

##Subsetting data
epcSub<-subset(epc, subset=(Date>="2007-02-01" & Date <="2007-02-02"))
dateandtime<-paste(as.Date(epcSub$Date), epcSub$Time)
epcSub$Datetime <-as.POSIXct(dateandtime)

##Plot 2
with(epcSub, {
        plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
        lines(Datetime, Sub_metering_2, col = "Red")
        lines(Datetime, Sub_metering_3, col = "Blue")
        })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Saving file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
