library(lubridate)
hpow <- read.delim('data/household_power_consumption.txt', sep =';',na.strings = "?")[66638:69517,]
hpow$Date <- dmy(hpow$Date)
hpow$datetime <- ymd_hms(paste(hpow$Date, hpow$Time, sep = " "))
png("plot2.png", width = 480, height = 480)
plot.new()
with(hpow, {
    plot(datetime, Global_active_power, type = "n", ann = FALSE)
    lines(datetime, Global_active_power)
})
title(ylab = "Global Active Power (kilowatts)")
# dev.copy(png, "plot2.png", width = 480, height = 480)
# png("plot2.png", width = 480, height = 480)
dev.off()
