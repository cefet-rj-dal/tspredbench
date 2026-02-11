# Load required packages
library(tspredbench)
library(daltoolbox)
library(harbinger)
library(tspredit)

# Load the consolidated M1 object (list with frequency buckets)
data(m1)
head(m1$monthly, 5)

# Select the monthly data frame and extract a single row as a numeric series
df <- m1$monthly
head(df, 5)

values <- as.numeric(df[2, ])           # choose the second series for illustration
values <- na.omit(values)                # remove missing values if any
points <- length(values)
time <- 1:points

plot(time, values, type = "l",
     main = "M1 monthly series",
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
