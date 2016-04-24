#script to create the first plot:

#read the data into R:
mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ';',
                    na.strings="?")


#change the date column to a "date" type in R: 
mydata$Date = as.Date(mydata$Date, format="%d/%m/%Y")



#subset the data to use only the data referring to the two dates: 01 and 02 February 2007.
mydata2 = subset(mydata, mydata$Date=="2007/02/01" | mydata$Date =="2007/02/02")

#create a new column with the date and time combined:
mydata2$DateAndTime = strptime(paste(mydata2$Date, mydata2$Time), format="%Y-%m-%d %H:%M:%S")

#plot #3:
png("plot3.png")
plot(mydata2$DateAndTime, mydata2$Sub_metering_1, type="n",ylab="Energy sub metering",xlab="")
lines(mydata2$DateAndTime, mydata2$Sub_metering_1,lty=1, lwd=2)
lines(mydata2$DateAndTime, mydata2$Sub_metering_2,lty=1, col="red",  lwd=2)
lines(mydata2$DateAndTime, mydata2$Sub_metering_3,lty=1, col="blue", lwd=2)
legend("topright", lty=1,lwd=2, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()