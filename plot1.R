epc <-read.csv("C:/Users/zakarya.ramde/Desktop/Coursera/Data Scientist/Exploration analytique des données/Course Project 1/exdata-data-household_power_consumption/household_power_consumption.txt", h=T, sep=";", na.strings="?", stringsAsFactors=F)
epc$Date<-as.Date(epc$Date, format="%d/%m/%Y")
str(epc)

##Subsetting data
epcSub<-subset(epc, subset=(Date>="2007-02-01" & Date <="2007-02-02"))

##Plot1 
hist(epcSub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowats)",
     ylab = "Frequency", col = "Red")

##Saving file 
dev.copy(png, file= "plot1.png", height=480, width=480)
dev.off()
