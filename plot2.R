plot2 <- function(){
  
  #Read data of 01/02/2007 & 02/02/2007 and store in a data frame
  df2 <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header = TRUE,sep = ";",nrows=2881,skip=66636)
  names(df2)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  
  # Convert to Date class
  df2$Date <- strptime(paste(df2$Date,df2$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")
  
  # Creating a base plot
  with(df2,plot(Date,Global_active_power,type='l',xlab = "",ylab = "Global Active Power (kilowatts)"))
  
  
  # Save to Graphics Device - PNG
  dev.copy(png,"plot2.png")
  dev.off()
  
  
}