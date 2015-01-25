#read RDS
NEI <- readRDS("summarySCC_PM25.rds")
##SCC <- readRDS("Source_Classification_Code.rds")
#split data according to fips and year, and calculate the total PM2.5 emission
NEI_Baltimore<-NEI[NEI$fips=="24510",]
sp<-split(NEI_Baltimore,NEI_Baltimore[,"year"])
result<-sapply(sp,FUN=function(x) sum(x$Emissions))
#draw and save the plot
plot(names(result),result,type="o",main="Total Emissions in Baltimore City",
     xlab="Year",ylab="Total PM2.5 Emission")
dev.copy(png, file="plot2.png")
dev.off()