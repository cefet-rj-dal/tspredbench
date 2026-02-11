# Load required packages
library(tspredbench)
library(daltoolbox)
library(harbinger)
library(tspredit)

# Load the bioenergy list object and inspect
data(bioenergy)
head(bioenergy, 5)

# Select Brazil bioenergy production series (name pattern: <country>_bio_production)
series <- bioenergy$brazil_bioprod
series

# Convert named vector (years as names) into numeric vectors for plotting
years <- as.numeric(names(series))
values <- as.numeric(series)

plot(years, values, type = "l",
     main = "Bioenergy production – Brazil",
     ylab = "Production (TJ)", xlab = "Year")

# Build supervised dataset with 1-step lag
ts <- ts_data(values, sw = 1)

# Hold out last 5 observations for testing
samp <- ts_sample(ts, test_size = 5)

# Input/output projections
io_train <- ts_projection(samp$train)
io_test  <- ts_projection(samp$test)

# Train ARIMA model on training inputs/outputs
model <- ts_arima()
model <- fit(model, x = io_train$input, y = io_train$output)

# Predict next 5 years
prediction <- predict(model, x = io_test$input[1, ], steps_ahead = 5)

# Convert to numeric vectors
pred <- as.vector(prediction)
real <- as.vector(io_test$output)

# Evaluate forecast error metrics
ev_test <- evaluate(model, real, pred)
ev_test
