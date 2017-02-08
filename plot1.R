
### Setting the Working Directory
setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 1/Primeiro teste")

a<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
a$Date1<-paste(a$Date, a$Time)
a$Date1<- strptime(a$Date1, "%d/%m/%y %H:%M:%OS")

### Selecting just the date it will be used
a_1 <- a[a$Date %in% c("1/2/2007","2/2/2007") ,]

a_1$Global_active_power=as.numeric(a_1$Global_active_power)

######## Setting the graphic device
png("plot1.png", width=480, height=480)
hist(a_1$Global_active_power, main="Global Active Power", col = "red", xlab="Global Acitive Power (kilowatts)", breaks=15)
dev.off()