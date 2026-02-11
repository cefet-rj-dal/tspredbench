# Load required packages
library(tspredbench)
library(daltoolbox)
library(harbinger)
library(tspredit)

data(m3)
head(m3$monthly, 5)

series <- m3$monthly$M1111
values <- as.numeric(series)
time <- seq_along(values)

plot(time, values, type = "l",
     main = "M3 monthly series: M1111",
     ylab = "Value", xlab = "Time index")

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
