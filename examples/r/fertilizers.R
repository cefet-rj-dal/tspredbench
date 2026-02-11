# Load required packages
library(tspredbench)
library(daltoolbox)
library(harbinger)
library(tspredit)

# Load the fertilizers list object and inspect
data(fertilizers)
head(fertilizers, 5)

# Select Brazil nitrogen usage series (name pattern: <country>_<nutrient>)
series <- fertilizers$brazil_n
series

# Convert named vector to numeric vectors for plotting
years <- as.numeric(names(series))
values <- as.numeric(series)

plot(years, values, type = "l",
     main = "Fertilizer use (N) – Brazil",
     ylab = "Tonnes", xlab = "Year")

ts <- ts_data(values, sw = 1)              # 1-step lag supervised dataset
samp <- ts_sample(ts, test_size = 5)       # hold out last 5 observations
io_train <- ts_projection(samp$train)      # training inputs/outputs
io_test  <- ts_projection(samp$test)       # test inputs/outputs

model <- ts_arima()                        # create ARIMA model
model <- fit(model, x = io_train$input, y = io_train$output)

prediction <- predict(model, x = io_test$input[1, ], steps_ahead = 5)
pred <- as.vector(prediction)
real <- as.vector(io_test$output)

ev_test <- evaluate(model, real, pred)     # error metrics
ev_test
