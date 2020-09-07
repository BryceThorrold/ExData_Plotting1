
setwd("~/R/Projects/Data_Plotting1")

if (!file.exists("./powerdata.zip")){
  fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  fileName = "household_power_consumption.txt"
  download.file(fileURL,"./powerdata.zip")
}

powerdata <- read.table(unz("./powerdata.zip",fileName),
                        header = TRUE,
                        sep = ";",
                        stringsAsFactors = FALSE,
                        na.strings = "?",
                        colClasses = c("character", "character", rep("numeric",7)),
                        dec=".")

smallertable <- subset(powerdata,as.Date(powerdata$Date,"%d/%m/%Y")=="2007-02-01" | 
                         as.Date(powerdata$Date,"%d/%m/%Y")=="2007-02-02")

smallertable$fulldate <- strptime(paste(smallertable$Date,smallertable$Time),"%d/%m/%Y %H:%M:%S", "")


dev.print(png, file = "./plot4.png", width = 480, height = 480)
png(file = "./plot4.png", bg = "transparent")

par(mfrow = c(2,2))

### Plot 1
plot(smallertable$fulldate,smallertable$Global_active_power, type = "n", ylab = "Active Power", xlab = "")
lines(smallertable$fulldate,smallertable$Global_active_power)

## Plot 2
plot(smallertable$fulldate,smallertable$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(smallertable$fulldate,smallertable$Voltage)

## Plot 3
plot(smallertable$fulldate,smallertable$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(smallertable$fulldate,smallertable$Sub_metering_1, col = "grey")
lines(smallertable$fulldate,smallertable$Sub_metering_2, col = "red")
lines(smallertable$fulldate,smallertable$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("grey", "red", "blue"), lty=1, cex=0.8)

## Plot 4
plot(smallertable$fulldate,smallertable$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(smallertable$fulldate,smallertable$Global_reactive_power)



dev.off()
