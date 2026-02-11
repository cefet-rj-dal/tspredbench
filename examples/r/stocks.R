# Load required packages
library(tspredbench)
library(daltoolbox)
library(harbinger)
library(tspredit)

# Load the stocks list object and inspect a known ticker (if present)
data(stocks)
if ("VALE3" %in% names(stocks)) head(stocks$VALE3, 5) else head(stocks[[1]], 5)

# Prefer VALE3 if available, otherwise pick the first ticker
if ("VALE3" %in% names(stocks)) {
  series_df <- stocks$VALE3
  ticker <- "VALE3"
} else {
  ticker <- names(stocks)[1]
  series_df <- stocks[[1]]
}
head(series_df, 5)

years <- series_df$date
values <- series_df$close
plot(years, values, type = "l",
     main = paste0("Closing Price (", ticker, ")"),
     ylab = "Close (R$)", xlab = "Date")

ts <- ts_data(values, sw = 1)
samp <- ts_sample(ts, test_size = 5)
io_train <- ts_projection(samp$train)
io_test  <- ts_projection(samp$test)

model <- ts_arima()
model <- fit(model, x = io_train$input, y = io_train$output)

prediction <- predict(model, x = io_test$input[1, ], steps_ahead = 5)
pred <- as.vector(prediction)
real <- as.vector(io_test$output)
ev_test <- evaluate(model, real, pred)
ev_test
