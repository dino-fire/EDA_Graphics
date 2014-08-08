
#####################################################################
## Coursera Exploratory Data Analysis
## Week 1 Project
##
## Dino Fire
## August 8, 2014
## plot1.r
#####################################################################

# Import the data and create a data frame

fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(fileUrl, destfile = 'household_power_consumption.zip', method = 'curl')

dat <- read.table(unz('household_power_consumption.zip', "household_power_consumption.txt"), header = T, sep = ';')

# Subset the data by date limits
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
subdat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]

# Convert variable to a number
subdat$Global_active_power <- as.numeric(as.character(subdat$Global_active_power))

# Send the file to a png device and save it
png('./plot1.png', width = 480, height = 480, units='px')
with(subdat, hist(Global_active_power, main = 'Global Active Power', 
                  xlab = 'Global Active Power (kilowatts)', col = 'red'))
dev.off()

# That's it!