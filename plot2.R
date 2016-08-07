
hpcColClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc = read.table("household_power_consumption.txt", sep = ";", na.strings = c('?'), colClasses = hpcColClasses, header = TRUE)
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

subsetDates = as.Date(c("2007-02-01","2007-02-02"))

subsetHPC = hpc[as.Date(hpc$DateTime) %in% subsetDates,]

png("plot2.png")
plot(subsetHPC$DateTime, subsetHPC$Global_active_power, 
     type = 'l',
     xlab = '',
     ylab = "Global Active Power (kilowatts)",
)

dev.off()
