## Setting the Working Directory
setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 1/Primeiro teste")


### Reading the files 
a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
a_1<- a[a$Date %in% c("1/2/2007","2/2/2007") ,]

### Preparing Variables 
#### Date1: will be used in the graphic
Global_active_power <- as.numeric(a_1$Global_active_power)
Voltage<-as.numeric(a_1$Voltage)
Global_reative_power<-as.numeric(a_1$Global_reactive_power)
Date1<-strptime(paste(a_1$Date, a_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering1<- as.numeric(a_1$Sub_metering_1)
sub_metering2<- as.numeric(a_1$Sub_metering_2)
sub_metering3<- as.numeric(a_1$Sub_metering_3)

######## Setting and buildinf the graphic
png("plot4.png", width=480, height=480)

par(mfcol=c(2,2))

### first plot
plot(Date1, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


### Second plot
plot(Date1, sub_metering1, type = "n", ylab = "Energy Submetering", xlab = "")
lines(Date1, sub_metering1)
lines(Date1, sub_metering2, col="red")
lines(Date1, sub_metering3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0, col=c("black", "red", "blue"), lty=1, lwd=2)

### Third plot
plot(Date1,Voltage, ylab="Voltage", xlab="datetime", type="l")


### Fouth Plot

plot(Date1,Global_reative_power, ylab="Global_reactive_power", xlab="datetime", type="l")


dev.off()