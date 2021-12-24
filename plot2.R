#install.packages("sqldf")
library(sqldf)
Sys.setlocale(category = "LC_ALL", locale = "english")

# read file with filter date
hpc <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
close(file("household_power_consumption.txt"))

# create new column DateTime
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time,sep=" "),"%d/%m/%Y %H:%M:%S", tz="")

# create png

png(filename = "plot2.png",width = 480, height = 480, units = "px")

# plot2

plot(hpc$DateTime,hpc$Global_active_power, type="l" , xlab="" ,ylab="Global Active Power (kilowatts)")

# close png
dev.off()
