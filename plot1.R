## Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for 
## each of the years 1999, 2002, 2005, and 2008.

setwd("~/Desktop/CP2/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dir()
head(NEI)
summary(NEI)
str(NEI)

## Create summed variable adding up all emissions points by year, turn year to factor
a <- aggregate(Emissions ~ year, data = NEI, sum)
a$year_C <- as.factor(a$year)
str(a)

## Line plot 
plot(a$year, a$Emissions, main="Total Emissions", xlab="Years", ylab="Total Emissions", type = "p")
lines(a$year, a$Emissions, col = "red")

##Bar plot 
barplot(a$Emissions, main="Total Emissions", xlab="Years", ylab="Total Emissions", names.arg=c("1999","2002","2005","2008"), type = "s")

## Two graphs displayed
plot1 <- par(mfrow=c(1,2))
plot(a$year, a$Emissions, main="Total Emissions", xlab="Years", ylab="Total Emissions", type = "p")
lines(a$year, a$Emissions, col = "red")
barplot(a$Emissions, main="Total Emissions", xlab="Years", ylab="Total Emissions", names.arg=c("1999","2002","2005","2008"), type = "s")

## Create png file for Plot 1
dev.copy (png, 'plot1.png')
dev.off()
