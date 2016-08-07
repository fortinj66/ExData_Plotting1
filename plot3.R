
hpcColClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc = read.table("household_power_consumption.txt", sep = ";", na.strings = c('?'), colClasses = hpcColClasses, header = TRUE)
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

subsetDates = as.Date(c("2007-02-01","2007-02-02"))

subsetHPC = hpc[as.Date(hpc$DateTime) %in% subsetDates,]

png("plot3.png")

plot(subsetHPC$DateTime, subsetHPC$Sub_metering_1, 
      type = 'l',
      xlab = '',
      ylab = "Energy sub metering",
      col = "black",
      lwd=c(1,1,1)
)
points(subsetHPC$DateTime, subsetHPC$Sub_metering_2, 
      type = 'l',
      col = "red",
      lwd=c(1,1,1)
      
)
points(subsetHPC$DateTime, subsetHPC$Sub_metering_3, 
      type = 'l',
      col = "blue",
      lwd=c(1,1,1)
)
legend(x="topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = c(1,1,1), 
       lwd=c(1,1,1)
)

dev.off()
