power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                       na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power1 <- subset(power_data, Date %in% c("1/2/2007","2/2/2007"))
power1$Date <- as.Date(power1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(power1$Date), power1$Time)
power1$Datetime <- as.POSIXct(datetime)
with(power1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)