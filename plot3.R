## Question 3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have 
## seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

setwd("~/Desktop/CP2/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dir()
head(NEI)
summary(NEI)
str(NEI)

library(ggplot2)

##Convert year to factor
d1$year_C <- as.factor(d1$year)

## Bar graph 
plot3 <- par(mfrow=c(1,1))
ggplot(data=d1, aes(x=year_C, y=Emissions, fill=type)) + geom_bar(stat="identity", position=position_dodge()) + theme_bw() + xlab("Year") + ylab("Total Emissions") + ggtitle("Emissions by Type in Baltimore") + scale_fill_manual("Legend", labels = c("Non-Road", "NonPoint","On-Road","Point"), values = c("pink", "blue","green","red"))

## Create png file for Plot 3
dev.copy (png, 'plot3.png')
dev.off()