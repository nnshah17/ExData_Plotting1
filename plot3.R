plot3 <- function(){
  
  #Read data of 01/02/2007 & 02/02/2007 and store in a data frame
  df3 <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header = TRUE,sep = ";",nrows=2881,skip=66636)
  names(df3)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  # Convert to Date class
  df3$Date <- strptime(paste(df3$Date,df3$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

  # Creating base plot with multiple varaibles
  with(df3,plot(Date,Sub_metering_1,type='l',xlab = "",ylab = "Energy sub metering"))
  with(df3,points(Date,Sub_metering_2,type='l',col='red'))
  with(df3,points(Date,Sub_metering_3,type='l',col='blue'))
  legend("topright",pch="_", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  #Save to Graphics Device - PNG
  dev.copy(png,"plot3.png")
  dev.off()
  
  
}