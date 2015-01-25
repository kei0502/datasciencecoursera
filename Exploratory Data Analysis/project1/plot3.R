#read the file to 'data'
data<-read.table("household_power_consumption.txt",sep=";",header=T,
                 stringsAsFactors=F,na.strings="?")
#get data of certain date
certainDate<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
#change format of the string of $Date and $Time to Date
certainDate$Date<-as.Date(certainDate$Date,"%d/%m/%Y")
certainDate$DateTime<-as.POSIXct(paste(certainDate$Date,certainDate$Time))
#draw plot3
with(certainDate, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), cex=0.5)
#save to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()