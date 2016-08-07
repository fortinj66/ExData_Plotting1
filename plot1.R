
hpcColClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc = read.table("household_power_consumption.txt", sep = ";", na.strings = c('?'), colClasses = hpcColClasses, header = TRUE)
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

subsetDates = as.Date(c("2007-02-01","2007-02-02"))

subsetHPC = hpc[as.Date(hpc$DateTime) %in% subsetDates,]

png("plot1.png")
hist(subsetHPC$Global_active_power, 
     xlim = c(0,6),
     breaks = seq(0,10, by = .5),
     col = "red", 
     axes = FALSE,
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power"
)
axis(side = 1, at = c(0,2,4,6))
axis(side = 2, at = seq(0,1200, by = 200))
dev.off()
