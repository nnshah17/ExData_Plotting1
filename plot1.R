plot1 <- function(){
  df1 <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header = TRUE,sep = ";",nrows=2881,skip=66636,stringsAsFactors=FALSE)
  names(df1)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  hist(df1$Global_active_power,col="red",main="Global Active Power",xlab = "Global active power (kilowatts)")
  dev.copy(png,"plot1.png")
  dev.off()
  
}