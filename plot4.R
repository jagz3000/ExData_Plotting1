#install.packages("sqldf")
library(sqldf)
Sys.setlocale(category = "LC_ALL", locale = "english")

# read file with filter date
hpc <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
close(file("household_power_consumption.txt"))

# create new column DateTime
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time,sep=" "),"%d/%m/%Y %H:%M:%S", tz="")

# create png

png(filename = "plot4.png",width = 480, height = 480, units = "px")

par(mfcol=c(2,2))

# plot4

# 1

plot(hpc$DateTime,hpc$Global_active_power, type="l" , xlab="" ,ylab="Global Active Power (kilowatts)")

# 2

plot(hpc$DateTime,hpc$Sub_metering_1, type="l" , xlab="" ,ylab="Energy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_2, col="red")
lines(hpc$DateTime,hpc$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"), lwd=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 3
plot(hpc$DateTime,hpc$Voltage, type="l" , xlab="datetime" ,ylab="Voltage")
# 4

plot(hpc$DateTime,hpc$Global_reactive_power, type="l" , xlab="datetime" ,ylab="Global_reactive_power")
# close png
dev.off()
