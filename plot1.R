# Set up working directory
setwd("C:/Users/jerem_000/Dropbox/Academics/Coursera - Data Science/4 - Exploratory Data Analysis/Course Project 1")

# Set up data directory
dataDir = "./exdata-data-household_power_consumption/household_power_consumption.txt";

# Read data in with ; as deliminater
allData = read.delim(dataDir,header = TRUE,sep=";")

# Change class of date column to Date format
allData$Date = as.Date(allData$Date)



