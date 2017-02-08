
### Setting the Working Directory
setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 1/Primeiro teste")


### Reading the files 
a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
a_1<- a[a$Date %in% c("1/2/2007","2/2/2007") ,]

### Preparing Variables 
#### Date1: will be used in the graphic
Date1<-strptime(paste(a_1$Date, a_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering1<- as.numeric(a_1$Sub_metering_1)
sub_metering2<- as.numeric(a_1$Sub_metering_2)
sub_metering3<- as.numeric(a_1$Sub_metering_3)

######## Setting and buildinf the graphic
png("plot3.png", width=480, height=480)
plot(Date1, sub_metering1, type = "n", ylab = "Energy Submetering", xlab = "")
lines(Date1, sub_metering1)
lines(Date1, sub_metering2, col="red")
lines(Date1, sub_metering3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)
dev.off()
