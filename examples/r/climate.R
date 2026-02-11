# Load required packages for data handling, modeling, and plotting
library(tspredbench)
library(daltoolbox)
library(harbinger)
library(tspredit)

# Load the climate list object and quickly inspect
data(climate)
head(climate, 5)

# Select Brazil's annual temperature change series
series <- climate$brazil_clima
series

# Convert named vector (years as names) into numeric vectors for plotting
years <- as.numeric(names(series))
values <- as.numeric(series)

# Plot temperature anomalies for Brazil
plot(years, values, type = "l",
     main = "Surface temperature anomalies – Brazil",
     ylab = "Temperature change (°C)", xlab = "Year")

# Create time-series dataset with sliding window of 1 (one-step lag)
ts <- ts_data(values, sw = 1)

# Split into train/test (final 5 observations as test)
samp <- ts_sample(ts, test_size = 5)

# Build input/output supervised matrices
io_train <- ts_projection(samp$train)
io_test  <- ts_projection(samp$test)

# Create and fit ARIMA on the supervised training data
model <- ts_arima()
model <- fit(model, x = io_train$input, y = io_train$output)

# Forecast next 5 steps using the first test input row
prediction <- predict(model, x = io_test$input[1, ], steps_ahead = 5)

# Convert predictions and ground truth to numeric vectors
pred <- as.vector(prediction)
real <- as.vector(io_test$output)

# Evaluate predictive performance (e.g., MAE, RMSE, MAPE)
ev_test <- evaluate(model, real, pred)
ev_test
