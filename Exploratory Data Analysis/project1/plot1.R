#read the file to 'data'
data<-read.table("household_power_consumption.txt",sep=";",header=T,
                 stringsAsFactors=F,na.strings="?")
#get data of certain date
certainDate<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
#change format of the string of $Date and $Time to Date
certainDate$Date<-as.Date(certainDate$Date,"%d/%m/%Y")
certainDate$DateTime<-as.POSIXct(paste(certainDate$Date,certainDate$Time))
#draw plot1
hist(certainDate$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#save to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()