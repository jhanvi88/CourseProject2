## Question 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
## sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in 
## motor vehicle emissions?

setwd("~/Desktop/CP2/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dir()
head(NEI)
summary(NEI)
str(NEI)

## Subset los angeles and baltimore to create data set with both cities
LAB <- subset(total, fips == "24510" | fips == "06037")
table(LAB$fips) ## to check if it came out correctly
str(LAB)

## subset LAB for motor vehicle
table(total$EI.Sector)
totes1 <- subset(LAB, EI.Sector == "Mobile - On-Road Diesel Heavy Duty Vehicles" | 
                   EI.Sector == "Mobile - On-Road Gasoline Heavy Duty Vehicles" | 
                   EI.Sector == "Mobile - On-Road Diesel Light Duty Vehicles" | 
                   EI.Sector == "Mobile - On-Road Gasoline Light Duty Vehicles")


## Create a table with the sums for each
f <- aggregate(Emissions ~ year + fips, data = totes1, sum)
f

##Convert year to factor
f$year_C <- as.factor(f$year)

## Line graph
ggplot(data=f, aes(x=year_C, y=Emissions, group=fips, colour=fips)) + geom_line() + geom_point() + xlab("Year") +  ylab("Total Emissions") + ggtitle("Motor Vehicle Emissions in LA vs. Baltimore") + theme_bw() + scale_color_manual("Legend", labels = c("LA", "Baltimore"), values = c("blue", "red"))

## Bar Graph 
ggplot(data=f, aes(x=year_C, y=Emissions, fill=fips)) + geom_bar(stat="identity", position=position_dodge()) + theme_bw() + xlab("Year") + ylab("Total Emissions") + ggtitle("Motor Vehicle Emissions in LA vs. Baltimore") + scale_fill_manual("Legend", labels = c("LA", "Baltimore"), values = c("blue", "red"))

## Two graphs displayed
require(gridExtra)
plot7 <- ggplot(data=f, aes(x=year_C, y=Emissions, group=fips, colour=fips)) + geom_line() + geom_point() + xlab("Year") + ylab("Total Emissions") + ggtitle("Motor Vehicle Emissions in LA vs. Baltimore") + theme_bw() + scale_color_manual("Legend", labels = c("LA", "Baltimore"), values = c("blue", "red"))
plot8 <- ggplot(data=f, aes(x=year_C, y=Emissions, fill=fips)) + geom_bar(stat="identity", position=position_dodge()) + theme_bw() + xlab("Year") + ylab("Total Emissions") + ggtitle("Motor Vehicle Emissions in LA vs. Baltimore") + scale_fill_manual("Legend", labels = c("LA", "Baltimore"), values = c("blue", "red"))
plot6 <- grid.arrange(plot7, plot8, ncol = 2) 

## Create png file for Plot 6
dev.copy (png, 'plot6.png')
dev.off()