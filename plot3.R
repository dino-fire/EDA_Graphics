
#####################################################################
## Coursera Exploratory Data Analysis
## Week 1 Project
##
## Dino Fire
## August 8, 2014
## plot3.r
#####################################################################

# Import the data and create a data frame

fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(fileUrl, destfile = 'household_power_consumption.zip', method = 'curl')

dat <- read.table(unz('household_power_consumption.zip', "household_power_consumption.txt"), header = T, sep = ';')

# Subset the data by date limits
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
subdat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]

subdat$newtime <- as.POSIXlt(paste(subdat$Date,subdat$Time))

# Convert variable to a number
subdat$Global_active_power <- as.numeric(as.character(subdat$Global_active_power))

png('./plot3.png', width = 480, height = 480, units='px')
# Sub meter 1
plot(y = as.numeric(as.character(subdat$Sub_metering_1)), x = subdat$newtime, type = 's', main = '', xlab = '', ylab = 'Energy sub metering', yaxt = 'n', col = 'darkgray', lwd= 0.5)

# Sub meter 2
points( y = as.numeric(as.character(subdat$Sub_metering_2)), x = subdat$newtime, type = 's', col = 'red', lwd = 1.5)

# Sub meter 3
points(y = as.numeric(as.character(subdat$Sub_metering_3)), x = subdat$newtime, type = 's', col = 'blue',lwd = 1.5)

# set the legend
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1, 1, 1), lwd = c(2.5, 2.5, 2.5), col = c('darkgray', 'red', 'blue'))
dev.off()
