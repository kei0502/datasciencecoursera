#read the file to 'data'
data<-read.table("household_power_consumption.txt",sep=";",header=T,
                 stringsAsFactors=F,na.strings="?")
#get data of certain date
certainDate<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
#change format of the string of $Date and $Time to Date
certainDate$Date<-as.Date(certainDate$Date,"%d/%m/%Y")
certainDate$DateTime<-as.POSIXct(paste(certainDate$Date,certainDate$Time))
#draw plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(certainDate, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="datatime")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datatime")
})
#save to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()