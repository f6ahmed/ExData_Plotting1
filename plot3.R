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
#Plot3
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(data_filt$Sub_metering_1, xaxt = "n", type = "n", xlab ="", ylab = "Energy sub metering")
lines(data_filt$Sub_metering_1)
lines(data_filt$Sub_metering_2, col = "red")
lines(data_filt$Sub_metering_3, col = "blue")
axis(1, at= c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
dev.off()