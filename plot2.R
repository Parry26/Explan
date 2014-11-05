
## Reconstruction of plot2, which examines how household energy usage varies over 
## a 2-day period from 1 to 2 February 2007. Data is from the UC Irvine Machine 
## Learning Repository.


# Clear variables 
remove(list = ls())

# Set working directory
setwd("C:/Users/u4945667/Coursera/Expl/ExData_Plotting1")

# Check if Dataset.zip is already present in working directory; if not, download
if(sum(grepl("Dataset.zip", list.files())) <1 ) { 
        
        message("Downloading \"Dataset.zip\"...", "\n")
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, "Dataset.zip")
}

# Check if Dataset.zip is unzipped in working directory; if not, unzip
if(sum(grepl("household_power_consumption.txt", list.files())) <1 ) {
        
        message("Unzipping \"Dataset.zip\"...", "\n")
        unzip("Dataset.zip")        
}

# Read the data file
powerData <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Subset the data for the required dates 
idx <- powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007"
powerDataSubset <- powerData[idx, ]

# process date and time info and add to new data column
x <- paste(powerDataSubset$Date, powerDataSubset$Time)
powerDataSubset$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(powerDataSubset) <- 1:nrow(powerDataSubset)

# set up the graphics device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## Plot 2
plot(powerDataSubset$DateTime, powerDataSubset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
 
## Saving to file
dev.off()
