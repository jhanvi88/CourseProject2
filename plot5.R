## Question 5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

setwd("~/Desktop/CP2/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dir()
head(NEI)
summary(NEI)
str(NEI)

MVB <- subset(total, fips == "24510")
MVBtotes <- subset(MVB, EI.Sector == "Mobile - On-Road Diesel Heavy Duty Vehicles" | 
                     EI.Sector == "Mobile - On-Road Gasoline Heavy Duty Vehicles" | 
                     EI.Sector == "Mobile - On-Road Diesel Light Duty Vehicles" | 
                     EI.Sector == "Mobile - On-Road Gasoline Light Duty Vehicles")

## Create a table with the sums for each
g <- aggregate(Emissions ~ year + fips, data = MVBtotes, sum)
g

##Convert year to factor
g$year_C <- as.factor(g$year)

## Graph for Q5
plot5 <- ggplot(data=g, aes(x=year_C, y=Emissions)) + geom_bar(stat="identity", position=position_dodge(), fill="#FF9999") + theme_bw() + xlab("Year") + ylab("Total Emissions") + ggtitle("Motor Vehicle Emissions in Baltimore")

## Create png file for Plot 5
dev.copy (png, 'plot5.png')
dev.off()
