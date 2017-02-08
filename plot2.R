### Setting the Working Directory
setwd("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 4/Semana 1/Primeiro teste")


### Reading the files 
    a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    a_1<- a[a$Date %in% c("1/2/2007","2/2/2007") ,]
    
### Preparing Variables 
#### Date1: will be used in the graphic
    Date1<-strptime(paste(a_1$Date, a_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    Global_active_power <- as.numeric(a_1$Global_active_power)

    ######## Setting and buildinf the graphic
    png("plot2.png", width=480, height=480)
    plot(Date1, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    dev.off()

