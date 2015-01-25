# read RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#get SCC of coal combustion-related sources and subset NEI data
SCC_coal<-SCC[grep("coal",SCC$Short.Name, ignore.case=TRUE),]
NEI_coal<-NEI[NEI$SCC %in% SCC_coal$SCC,]
#calculate the total emission from coal sources
sp<-split(NEI_coal,NEI_coal[,"year"])
result<-sapply(sp,FUN=function(x) sum(x$Emissions))
#draw and save the plot
plot(names(result),result,type="o",main="Total Emissions from Coal Sources in United States",
     xlab="Year",ylab="Total PM2.5 Emission")
dev.copy(png, file="plot4.png")
dev.off()