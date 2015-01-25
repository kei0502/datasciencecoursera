library(ggplot2)
#read RDS
NEI <- readRDS("summarySCC_PM25.rds")
##SCC <- readRDS("Source_Classification_Code.rds")
#get data of Baltimore city
NEI_Baltimore<-NEI[NEI$fips=="24510",]
#draw and save the plot
p<-ggplot(data=NEI_Baltimore,aes(x=year,y=Emissions))+ggtitle("Total Emission from different types of sources in Baltimore City")+facet_grid(. ~ type)+ylab("Total PM2.5 Emissions")+xlab("Year")+geom_line()
ggsave("plot3.png")