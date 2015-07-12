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

#plot1
powerdata3$glactive <- as.numeric(powerdata3$glactive)
hist(powerdata3$glactive,col = "red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()