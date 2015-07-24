## Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

setwd("~/Desktop/CP2/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dir()
head(NEI)
summary(NEI)
str(NEI)

## MERGE the 2 data sets on the common factor of variable SCC
total <- merge(NEI,SCC,by="SCC")
## then we can match the SCC code to the data in NEI and subset for just coal
totes <- subset(total, EI.Sector == "Fuel Comb - Electric Generation - Coal")

str(totes)
##Convert year to factor
totes$year_C <- as.factor(totes$year)

## Create summed variable adding up all emissions points by year
aggregate(Emissions ~ year_C, data = totes, sum)
e <- aggregate(Emissions ~ year_C, data = totes, sum)
str(e)

## Graph for Q4
plot4 <- ggplot(data=e, aes(x=year_C, y=Emissions)) + geom_bar(stat="identity", position=position_dodge(), fill="#FF9999") + theme_bw() + xlab("Year") + ylab("Total Emissions") + ggtitle("Coal Emissions in the US")

## Create png file for Plot 4
dev.copy (png, 'plot4.png')
dev.off()
