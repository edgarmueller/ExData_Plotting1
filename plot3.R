# requires package sqldf 
library(sqldf)

data = read.csv.sql(file = "household_power_consumption.txt",
                    sql  = "SELECT * FROM file WHERE `Date`='1/2/2007' OR `Date`='2/2/2007'",
                    sep  = ";", 
                    stringsAsFactors = FALSE,
                    header = TRUE)

datetime = with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

png("plot3.png", width = 480, height = 480)

plot(
  x    = datetime,
  y    = as.numeric(data$Sub_metering_1),
  type = "l", 
  xlab = "",
  ylab = "Energy sub metering"
)
lines(
  x    = datetime,
  y    = as.numeric(data$Sub_metering_2), 
  col  = "red")
lines(
  x    = datetime, 
  y    = as.numeric(data$Sub_metering_3),
  col  = "blue"
)
legend(
  "topright", 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  lty = 1, 
  lwd = 2, 
  col = c("black", "red", "blue")
)

closeAllConnections()
dev.off()