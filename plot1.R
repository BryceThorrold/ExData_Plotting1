

####################
##
##
##  16/12/2006;17:24:00;
##  dd/mm/yyyy
##
## Default comes in as yyyy-mm-dd
## as.Date(powerdata$Date,"%d/%m/%Y"
##



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

## mean(powerdata$Voltage, na.rm = TRUE)

## smallertable <- subset(powerdata,as.Date(powerdata$Date,"%d/%m/%Y")=="2007-02-01")
smallertable <- subset(powerdata,as.Date(powerdata$Date,"%d/%m/%Y")=="2007-02-01" | 
                         as.Date(powerdata$Date,"%d/%m/%Y")=="2007-02-02")

hist(smallertable$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")



dev.print(png, file = "./plot1.png", width = 480, height = 480)

png(file = "myplot.png", bg = "transparent")
plot(1:10)
rect(1, 5, 3, 7, col = "white")
dev.off()








