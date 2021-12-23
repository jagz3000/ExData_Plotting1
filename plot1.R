#install.packages("sqldf")
library(sqldf)
# read file with filter date
hpc <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
close(file("household_power_consumption.txt"))

# create new column DateTime
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time,sep=" "),"%d/%m/%Y %H:%M:%S", tz="")

# create png

png(filename = "plot1.png",width = 480, height = 480, units = "px")
# plot1
hist(hpc$Global_active_power,col="red" ,xlab="Global Active Power (kilowatts)",main="Global Active Power")

# close png
dev.off()
