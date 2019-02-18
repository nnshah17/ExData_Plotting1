plot4 <- function(){
  
  #Read data of 01/02/2007 & 02/02/2007 and store in a data frame
  df4 <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header = TRUE,sep = ";",nrows=2881,skip=66636)
  names(df4)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  # Convert to Date class
  df4$Date <- strptime(paste(df4$Date,df4$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")
  
  # Creating base plots
  
  #Set mfrow parameter to accomodate multiple plots
  par(mfrow = c(2,2))
  
  #Creating plot for index(0,0)
  with(df4,plot(Date,Global_active_power,type='l',xlab = "",ylab = "Global Active Power (kilowatts)"))
  
  #Creating plot for index(0,1)
  with(df4,plot(Date,Voltage,type='l',xlab = "datetime",ylab = "Voltage"))
  
  #Creating plot for index(1,0)
  with(df4,plot(Date,Sub_metering_1,type='l',xlab = "",ylab = "Energy sub metering"))
  with(df4,points(Date,Sub_metering_2,type='l',col='red'))
  with(df4,points(Date,Sub_metering_3,type='l',col='blue'))
  legend("topright",pch="_", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Creating plot for index(1,1)
  with(df4,plot(Date,Global_reactive_power,type='l',xlab = "datetime",ylab = "Global_reactive_power"))
  
  
  #Save to Graphics Device - PNG
  dev.copy(png,"plot4.png")
  dev.off()
  
  
}