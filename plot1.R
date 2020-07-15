hpow <- read.delim('data/household_power_consumption.txt', sep =';',na.strings = "?")[66638:69517,]

# head(hpow)
png("plot1.png", width = 480, height = 480)
plot.new()
hist(hpow$Global_active_power, col = "red", ann = FALSE)
title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab ="Frequency")
dev.off()
