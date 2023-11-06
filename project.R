# Loading
data(mtcars)
summary(mtcars)
# Load the mtcars dataset
data(mtcars)
#Train and test
subset=sample(nrow(mtcars), nrow(mtcars) *0.90)
mtcars_train = mtcars[subset, ]               
mtcars_test = mtcars[-subset, ]

# Fit a linear regression model to predict mpg based on other variables
lm_model <- lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data = mtcars)
nullmodel= lm(mpg ~ 1, data = mtcars_train)
fullmodel = lm(mpg ~ ., data = mtcars_train)
model.step = step(fullmodel, direction = "backward")


final_model <- step(lm_model, direction = "backward") 
plot(final_model)

# View the summary of the model
summary(lm_model)
#Do lm model on weight only
lm_model1 <- lm(mpg ~ wt, data = mtcars)
summary(lm_model1)


# Predict the response variable (mpg) for the test data set using the model
mpg_pred <- predict(lm_model1, newdata = mtcars_test)

# Calculate the MSE of the predicted values and the actual values of the response variable in the test data set
mse_test <- mean((mtcars_test$mpg - mpg_pred)^2)

# Print the MSE of the testing data set
mse_test
