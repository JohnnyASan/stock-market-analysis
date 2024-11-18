library(quantmod)
library(dplyr)
library(ggplot2)
library(forecast)
library(pdfetch)
library(lubridate)
library(TTR)

fileLocation <- paste(getwd(), '/data/DRUG_08-12-2024_11-12-2024.csv', sep="")

data <- read.csv(fileLocation)

nrow(data)
ncol(data)
colnames(data)
str(data)

data$Date <- dmy(data$Date)
data <- data %>% arrange(Date)

# Calculate Moving Averages with a smaller window size
data$SMA5 <- SMA(data$Close, n = 5)
data$SMA10 <- SMA(data$Close, n = 10)

# Calculate RSI
data$RSI <- RSI(data$Close)

# Calculate Bollinger Bands
bb <- BBands(data$Close)
data <- cbind(data, bb)

# Add Lagged Features
data <- data %>%
  mutate(Lag1 = lag(Close, 1),
         Lag2 = lag(Close, 2),
         Lag3 = lag(Close, 3))

# Correlation Analysis
cor_matrix <- cor(data %>% select(-Date, -Volume))
print(cor_matrix)

# ARIMA Model for Forecasting
fit <- auto.arima(data$Close)
forecasted <- forecast(fit, h = 30)
plot(forecasted)

# Visualize Patterns
ggplot(data, aes(x = Date)) +
  geom_line(aes(y = Close), color = "blue") +
  geom_line(aes(y = SMA5), color = "red") +
  geom_line(aes(y = SMA10), color = "green") +
  labs(title = "DRUG Closing Prices with Moving Averages", x = "Date", y = "Price") +
  scale_x_date(date_labels="%b %y", date_breaks = "1 month")
