## Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

setwd("~/Desktop/CP2/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dir()
head(NEI)
summary(NEI)
str(NEI)

## Subsetting Baltimore City into a separate dataframe
d1 <- subset(NEI, fips == "24510")
table(d1$fips) ## to check if it came out correctly
str(d1)

## Create summed variable adding up all emissions points by year, convert year to factor
aggregate(Emissions ~ year, data = d1, sum)
b <- aggregate(Emissions ~ year, data = d1, sum)
b$year_C <- as.factor(b$year)
str(b)
b

## Line plot 
plot(b$year, b$Emissions, main="Total Emissions", xlab="Years", ylab="Total Emissions", type = "p")
lines(b$year, b$Emissions, col = "red")

## Bar plot for Q2
barplot(b$Emissions, main="Total Emissions in Baltimore", xlab = "Year", ylab = "Total Emissions", names.arg=c("1999","2002","2005","2008"), type = "s")

## Two graphs displayed
plot2 <- par(mfrow=c(1,2))
plot(b$year, b$Emissions, main="Total Emissions in Baltimore", xlab="Year", ylab="Total Emissions", type = "p")
lines(b$year, b$Emissions, col = "red")
barplot(b$Emissions, main="Total Emissions in Baltimore", xlab = "Year", ylab = "Total Emissions", names.arg=c("1999","2002","2005","2008"), type = "s")

## Create png file for Plot 2
dev.copy (png, 'plot2.png')
dev.off()
