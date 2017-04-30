# requires package sqldf 
library(sqldf)

data = read.csv.sql(file = "household_power_consumption.txt",
                    sql  = "SELECT * FROM file WHERE `Date`='1/2/2007' OR `Date`='2/2/2007'",
                    sep  = ";", 
                    stringsAsFactors = FALSE,
                    header = TRUE)

png("plot2.png", width = 480, height = 480)

with(data,
  plot(
    x    = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
    y    = as.numeric(data$Global_active_power),
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
  )
)

closeAllConnections()
dev.off()
