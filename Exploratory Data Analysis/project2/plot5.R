# read RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#get SCC of coal combustion-related sources and subset NEI data
SCC_motor<-SCC[grep("motor",SCC$Short.Name, ignore.case=TRUE),]
NEI_Baltimore<-NEI[NEI$fips=="24510",]
NEI_Baltimore_motor<-NEI_Baltimore[NEI_Baltimore$SCC %in% SCC_motor$SCC,]
#calculate the total emission from motor vehicles in Baltimore city
sp<-split(NEI_Baltimore_motor,NEI_Baltimore_motor[,"year"])
result<-sapply(sp,FUN=function(x) sum(x$Emissions))
#draw and save the plot
plot(names(result),result,type="o",main="Total Emissions from Motor Sources in Baltimore City",
     xlab="Year",ylab="Total Emission from Motor Sources")
dev.copy(png, file="plot5.png")
dev.off()