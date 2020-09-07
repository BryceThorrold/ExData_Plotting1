
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


dev.print(png, file = "./plot1.png", width = 480, height = 480)
png(file = "plot1.png", bg = "transparent")
hist(smallertable$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()








