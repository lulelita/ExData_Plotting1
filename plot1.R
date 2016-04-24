#script to create the first plot:

#read the data into R:
mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ';',
                    na.strings="?")


#change the date column to a "date" type in R: 
mydata$Date = as.Date(mydata$Date, format="%d/%m/%Y")
# mydata$Time = strptime(mydata$Time, format="%H:%M:%S")

#subset the data to use only the data referring to the two dates: 01 and 02 February 2007.
mydata2 = subset(mydata, mydata$Date=="2007/02/01" | mydata$Date =="2007/02/02")

#plot #1:
png("plot1.png")
hist(mydata2$Global_active_power, col="red", breaks=12, main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()