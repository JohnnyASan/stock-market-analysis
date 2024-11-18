library(quantmod)
library(dplyr)
library(ggplot2)
library(forecast)
library(pdfetch)
library(lubridate)

fileLocation <- paste(getwd(), '/data/DRUG_08-12-2024_11-12-2024.csv', sep="")

data <- read.csv(fileLocation)

nrow(data)
ncol(data)
colnames(data)
str(data)

data$Date <- dmy(data$Date)
data <- data %>% arrange(Date)


# Plot closing prices
ggplot(data, aes(x = Date, y = Close)) +
  geom_line() +
  labs(title = "DRUG Closing Prices", x = "Date", y = "Closing Price") #+
 scale_x_date(date_labels="%b %y", date_breaks = "1 month")

