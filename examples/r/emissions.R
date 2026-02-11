# Load required packages
library(tspredbench)
library(daltoolbox)
library(harbinger)
library(tspredit)

# Load the emissions list object and inspect
data(emissions)
head(emissions, 5)

# Select Brazil methane emissions (name pattern: <country>_<gas>)
series <- emissions$brazil_ch4
series

years <- as.numeric(names(series))
values <- as.numeric(series)
plot(years, values, type = "l",
     main = "Methane (CH4) emissions – Brazil",
     ylab = "kt CO2e", xlab = "Year")

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
