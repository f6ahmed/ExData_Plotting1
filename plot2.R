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
#
#Plot2
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(data_filt$Global_active_power, type = "l",xlab ="", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at= c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()