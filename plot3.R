library(lubridate)
hpow <- read.delim('data/household_power_consumption.txt', sep =';',na.strings = "?")[66638:69517,]
hpow$Date <- dmy(hpow$Date)
hpow$datetime <- ymd_hms(paste(hpow$Date, hpow$Time, sep = " "))
png("plot3.png", width = 480, height = 480)
plot.new()
with(hpow, {
    plot(datetime,Sub_metering_1, ann = FALSE, type = "n")
    plot(datetime,Sub_metering_2, ann = FALSE, type = "n")
    plot(datetime,Sub_metering_3, ann = FALSE, type = "n",
         ylim = c(0, max(hpow[c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')])))
    lines(datetime,Sub_metering_1, col = "black")
    lines(datetime,Sub_metering_2, col = "red")
    lines(datetime,Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"),
           lty = 1)
    title(ylab = "Energy sub metering")
    
})

dev.off()
