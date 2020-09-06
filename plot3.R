
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

plot(smallertable$fulldate,smallertable$Sub_metering_1, type = "n", ylab = "Energy sub metering")
lines(smallertable$fulldate,smallertable$Sub_metering_1, col = "grey")
lines(smallertable$fulldate,smallertable$Sub_metering_2, col = "red")
lines(smallertable$fulldate,smallertable$Sub_metering_3, col = "blue")
##plot(smallertable$fulldate,smallertable$Global_active_power,  type="n", main = "Global Active Power", ylab = "Global Active Power (kilowatts)", xlab = "")
##lines(smallertable$fulldate,smallertable$Global_active_power)


##dev.print(png, file = "./plot3.png", width = 480, height = 480)
##png(file = "./plot3.png", bg = "transparent")
##plot(smallertable$fulldate,smallertable$Global_active_power,  type="n", main = "Global Active Power", ylab = "Global Active Power (kilowatts)", xlab = "")
##lines(smallertable$fulldate,smallertable$Global_active_power)
##dev.off()
