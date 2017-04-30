# requires package sqldf 
library(sqldf)

data = read.csv.sql(file = "household_power_consumption.txt",
                    sql  = "SELECT * FROM file WHERE `Date`='1/2/2007' OR `Date`='2/2/2007'",
                    sep  = ";", 
                    stringsAsFactors = FALSE,
                    header = TRUE)

png("plot1.png", width = 480, height = 480)

hist(
  x    = as.numeric(data$Global_active_power),
  main = "Global Active Power", 
  xlab = "Global Active Power (kilowatts)",
  col  = "red"
)

closeAllConnections()
dev.off()