#read RDS
NEI <- readRDS("summarySCC_PM25.rds")
##SCC <- readRDS("Source_Classification_Code.rds")
#split data according to year and calculate the total PM2.5 emission
sp<-split(NEI,NEI[,"year"])
result<-sapply(sp,FUN=function(x) sum(x$Emissions))
#draw and save the plot
plot(names(result),result,type="o",main="Total Emissions in the United States",
     xlab="Year",ylab="Total PM2.5 Emission")
dev.copy(png, file="plot1.png")
dev.off()