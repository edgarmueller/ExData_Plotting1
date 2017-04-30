# requires package sqldf 
library(sqldf)

data = read.csv.sql(file = "household_power_consumption.txt",
                    sql  = "SELECT * FROM file WHERE `Date`='1/2/2007' OR `Date`='2/2/2007'",
                    sep  = ";", 
                    stringsAsFactors = FALSE,
                    header = TRUE)

datetime = with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

# upper left plot
plot(
  x    = datetime, 
  y    = as.numeric(data$Global_active_power),
  type = "l", 
  xlab = "",  # no x-axis label wanted
  ylab = "Global Active Power"
)

# upper right plot
plot(
  x    = datetime, 
  y    = as.numeric(data$Voltage),
  type = "l", 
  ylab = "Voltage"
)

# lower left 
plot(
  x    = datetime,  
  y    = as.numeric(data$Sub_metering_1), 
  type = "l", 
  xlab = "", # no x-axis label wanted
  ylab = "Energy sub metering"
)
lines(
  x    = datetime,  
  y    = as.numeric(data$Sub_metering_2), 
  col = "red"
)
lines(
  x    = datetime,  
  y    = as.numeric(data$Sub_metering_3), 
  col  = "blue"
)
legend(
  "topright", 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  lwd    = 2,  # line width of 2
  col    = c("black", "red", "blue"), 
  bty    = "n" # no box around legend
)

# lower right
plot(
  x = datetime, 
  y = as.numeric(data$Global_reactive_power), 
  type = "l", 
  ylab = "Global_reactive_power"
)

closeAllConnections()
dev.off()
