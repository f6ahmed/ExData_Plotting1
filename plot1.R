#Week1 project
library(lubridate)
library(dplyr)
#
data_hpc <-read.delim("household_power_consumption.txt", sep = ";", header = TRUE, na.strings= '?', stringsAsFactors=FALSE)
#
#clean data
good <-complete.cases(data_hpc)
data_hpc_clean <-data_hpc[good,]
#
#Transform dates/times
data_hpc_clean <- transform(data_hpc_clean, Date = dmy(Date))
data_hpc_clean <- transform(data_hpc_clean, Time = hms(Date))
#
#filter data
data_filt <- filter(data_hpc_clean, Date == "2007-02-01" | Date == "2007-02-02")
#
#Plot1
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(data_filt$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()