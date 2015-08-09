# Set up working directory
setwd("C:/Users/jerem_000/Dropbox/Academics/Coursera - Data Science/4 - Exploratory Data Analysis/Course Project 1/ExData_Plotting1")

# Set up data directory
dataDir = "C:/Users/jerem_000/Dropbox/Academics/Coursera - Data Science/4 - Exploratory Data Analysis/Course Project 1/Data/household_power_consumption.txt";

# Read data in with ; as deliminater, set column classes appropriately and set ? entries to NA values
allData = read.delim(dataDir,header = TRUE,sep=";",colClasses = c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")

# Concatenate Date and Time columns and rename to "DateTime" 
allData$Time <- paste(allData$Date, allData$Time, sep=" ")
colnames(allData)[2] = "DateTime";

# Change class of DateTime column to Time format
allData$DateTime = strptime(allData$DateTime,format="%d/%m/%Y %H:%M:%S")

# Change class of Date column to Date format
allData$Date = as.Date(allData$Date,format="%d/%m/%Y")

# Find index of relevant dates
startDate = as.Date("2007-02-01");
endDate = as.Date("2007-02-02");
indDates = (allData$Date >= startDate) & (allData$Date <= endDate);

# Limit data to indDates
allData = allData[indDates,];

# Make plot and save as .png
graphics.off()
plotFileName = "plot3.png"
png(plotFileName, width = 480, height = 480)
plot(allData$DateTime,allData$Sub_metering_1,ylab = "Energy sub metering",main="",xlab="",type="l",col = "black")
lines(allData$DateTime,allData$Sub_metering_2,ylab = "Energy sub metering",main="",xlab="",type="l",col = "red")
lines(allData$DateTime,allData$Sub_metering_3,ylab = "Energy sub metering",main="",xlab="",type="l",col = "blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black", "red", "blue"))
dev.off()

