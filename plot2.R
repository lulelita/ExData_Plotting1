#script to create the first plot:

#read the data into R:
mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ';',
                    na.strings="?")


#change the date column to a "date" type in R: 
mydata$Date = as.Date(mydata$Date, format="%d/%m/%Y")
# mydata$Time = strptime(mydata$Time, format="%H:%M:%S")

#subset the data to use only the data referring to the two dates: 01 and 02 February 2007.
mydata2 = subset(mydata, mydata$Date=="2007/02/01" | mydata$Date =="2007/02/02")

#create a new column with the date and time combined:
mydata2$DateAndTime = strptime(paste(mydata2$Date, mydata2$Time), format="%Y-%m-%d %H:%M:%S")
#plot #2:
png("plot2.png")
plot(mydata2$DateAndTime, mydata2$Global_active_power, 
     ylab="Global Active Power (kilowatts)", xlab="", type="n")
lines(mydata2$DateAndTime, mydata2$Global_active_power, lwd=2)
dev.off()