pdata <- read.table("powerdata/powerdata.txt",stringsAsFactors = FALSE,sep = ";",col.names = c("date","time","glactive","glreactive","vol","glint","submet1","submet2","submet3"))
pdata <- pdata[-1,]
pdata[pdata=="?"] <- NA
powerdata <- pdata
#jining and setting date and time
powerdata$datetime <- strptime(paste(pdata$date,pdata$time),format="%d/%m/%Y %H:%M:%S")

powerdata2 <- powerdata
#subsetting data based on date
powerdata3 <- subset(powerdata2,powerdata2$datetime>=as.POSIXlt("2007-02-01"))
powerdata3 <- subset(powerdata3,powerdata3$datetime<as.POSIXlt("2007-02-03"))

#plot4
par(mfcol=c(2,2))
##plot2
plot(powerdata3$datetime,powerdata3$glactive,type = "l",xlab = "",ylab = "Global Active Powers(kilowatts)")
##plot3
powerdata3$submet1 <- as.numeric(powerdata3$submet1)
powerdata3$submet2 <- as.numeric(powerdata3$submet2)
powerdata3$submet3 <- as.numeric(powerdata3$submet3)
plot(powerdata3$datetime,powerdata3$submet1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(powerdata3$datetime,powerdata3$submet2,col="red")
lines(powerdata3$datetime,powerdata3$submet3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
##two other plots
powerdata3$vol <- as.numeric(powerdata3$vol)
plot(powerdata3$datetime,powerdata3$vol,type = "l",xlab="datetime",ylab = "Voltage")
powerdata3$glreactive <- as.numeric(powerdata3$glreactive)
plot(powerdata3$datetime,powerdata3$glreactive,type = "l",xlab="datetime",ylab = "Global_reative_power")
dev.copy(png,file="plot4.png",width=480, height=480)
dev.off()
