# correlation analysis
cor(mtcars$hp, mtcars$mpg)
plot(mtcars$hp, mtcars$mpg)

# linear regression
model <- lm(mpg ~ hp, data = mtcars)
summary(model)




# TRAIN-TEST-SPLIT model training method
# split data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size= n*0.8)
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]

# train model
model <- lm(mpg ~ hp + wt + am, data = train_data)
p_train <- predict(model)
error_train <- train_data$mpg - p_train
rmse_train <- sqrt(mean(error_train ** 2))

# test model
p_test <- predict(model, newdata = test_data)
error_test <- test_data$mpg - p_test
rmse_test <- sqrt(mean(error_test ** 2))

# compare rmse of train vs. test
cat("RMSE train:", rmse_train,
    "\nRMSE test:", rmse_test)
