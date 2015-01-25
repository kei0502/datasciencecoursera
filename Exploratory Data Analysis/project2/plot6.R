# read RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#get SCC of coal combustion-related sources and subset NEI data
SCC_motor<-SCC[grep("motor",SCC$Short.Name, ignore.case=TRUE),]
NEI_Baltimore<-NEI[NEI$fips=="24510",]
NEI_Baltimore_motor<-NEI_Baltimore[NEI_Baltimore$SCC %in% SCC_motor$SCC,]
sp1<-split(NEI_Baltimore_motor,NEI_Baltimore_motor[,"year"])
result1<-sapply(sp1,FUN=function(x) sum(x$Emissions))
NEI_LACounty<-NEI[NEI$fips="06037",]
NEI_LACounty_motor<-NEI_LACounty[NEI_LACounty$SCC %in% SCC_motor$SCC,]
sp2<-split(NEI_LACounty_motor,NEI_LACounty_motor[,"year"])
result2<-sapply(sp2,FUN=function(x) sum(x$Emissions))
#draw and save the plot
BCLA_range<-range(0,result1,result2)
plot(names(result1),result1,type="o",ylim=BCLA_range,main="Total Emissions in Baltimore City and LA County",
     xlab="Year",ylab="Total Emission from Motor Sources")
lines(names(result2),result2,type="o",col="red")
legend("right", col=c("black", "red"),lty=1,lwd=2,legend=c("Baltimore", "LA County"))
dev.copy(png, file="plot6.png")
dev.off()
