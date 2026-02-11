# Load required packages
library(tspredbench)
library(daltoolbox)
library(harbinger)
library(tspredit)

# Load the GDP list object and inspect
data(gdp)
head(gdp, 5)

# Select Brazil GDP series (name pattern: <country>_gdp)
series <- gdp$brazil_gdp
series

years <- as.numeric(names(series))         # year labels
values <- as.numeric(series)               # GDP values

plot(years, values, type = "l",
     main = "Brazil GDP",
     ylab = "US$ (current or constant, per source)", xlab = "Year")

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
