######## From Project Codes File Google Drive ########
# Loading
data(mtcars)
summary(mtcars)
# Load the mtcars dataset
data(mtcars)
str(mtcars)
#Train and test
subset=sample(nrow(mtcars), nrow(mtcars) *0.90)
mtcars_train = mtcars[subset, ]               
mtcars_test = mtcars[-subset, ]
#boxplot
boxplot(mtcars_train)
# zoom in on the y-axis of box plot
ylim <- c(15, 30)
boxplot(mtcars_train$mpg, ylim = ylim)
#normalized box plot
mtcars_train_norm <- as.data.frame(scale(mtcars_train))

par(mfrow=c(4, 3))
for (i in 1:ncol(mtcars_train_norm)) {
  boxplot(mtcars_train_norm[,i], main = colnames(mtcars_train_norm)[i], ylab = "Normalized Value")
}

# Fit a linear regression model to predict mpg based on other variables
lm_model <- lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data = mtcars)
#Summary
summary(lm_model)
#MSE of the regression
model_summary = summary(lm_model)
(model_summary$sigma)^2
#R squared
model_summary$r.squared
#Adjusted R squared
model_summary$adj.r.squared
#AIC 
AIC(lm_model)
#BIC
BIC(lm_model)

#Out-of-sample prediction (test error)
# pi is a vector that contains predicted values for test set.
pi <- predict(object = lm_model, newdata = mtcars_test)
pi <- predict(lm_model, mtcars_test)

#Out of sample MSE
mean((pi - mtcars_test$medv)^2)
mse <- mean((mtcars_test$mpg - pi)^2)
mse

#backward selection
nullmodel= lm(mpg ~ 1, data = mtcars_train)
fullmodel = lm(mpg ~ ., data = mtcars_train)
model.step = step(fullmodel, direction = "backward")
summary(model.step)
AIC(model.step)
BIC(model.step)
#MSE of the regression
model_summarybw = summary(model.step)
(model_summarybw$sigma)^2

#Plot backward selection - residual diagnosis
plot(model.step)

#Best subset regression
library(leaps)
subset_result <- regsubsets(mpg ~ ., data = mtcars_train, nbest = 2, nvmax = 14)
summary(subset_result)
#Plot subset
plot(subset_result, scale = "bic")





nullmodel= lm(mpg ~ 1, data = mtcars_train)
fullmodel = lm(mpg ~ ., data = mtcars_train)
model.step = step(fullmodel, direction = "backward")

#Plot Results Residual
plot(lm_model1, which = 1)

# View the summary of the model
summary(lm_model)
#Do lm model on weight qsec and am only
lm_model1 <- lm(mpg ~ wt + qsec+am, data = mtcars)
summary(lm_model1)


#Ten fold cross validation
# Define the linear regression model
lm_model <- lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data = mtcars)

library(boot)
# Define the linear regression model
lm_model <- lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data = mtcars)

# Define the function to calculate the mean squared error
mse <- function(y, yhat) mean((y - yhat)^2)

# Perform 5-fold cross-validation
library(boot)
model_2 = glm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data = mtcars)
cv.glm(data = mtcars, glmfit = model_2, K = 11)$delta[2]




################################## Random Forest ########################################
install.packages("rsq")
library(rsq)
library(randomForest)


set.seed(123)
train <- sample(nrow(mtcars), 0.9 * nrow(mtcars))
mtcars_train <- mtcars[train, ]
mtcars_test <- mtcars[-train, ]

# Fit a random forest regression model
rf_model <- randomForest(mpg ~ ., data = mtcars_train, ntree = 500, importance = TRUE)

# Print the model summary
print(rf_model)


#Plot
plot(rf_model)

# Calculate the test set MSE
rf_mse <- mean((rf_pred - mtcars_test$mpg)^2)
cat("Random Forest MSE:", rf_mse, "\n")
# Calculate the training set MSE
rf_mse2 <- mean((rf_pred - mtcars_train$mpg)^2)
cat("Random Forest MSE:", rf_mse2, "\n")


# Predict on the test set
rf_pred <- predict(rf_model, newdata = mtcars_test)

# Calculate the R-squared value manually
rf_rsq <- 1 - sum((mtcars_test$mpg - rf_pred)^2) / sum((mtcars_test$mpg - mean(mtcars_test$mpg))^2)

# Print the R-squared value
cat("Random Forest R-squared:", rf_rsq, "\n")


# Calculate the test set RMSE
rf_rmse <- sqrt(mean((rf_pred - mtcars_test$mpg)^2))
cat("Random Forest RMSE:", rf_rmse, "\n")
# Calculate the training set RMSE
rf_rmse2 <- sqrt(mean((rf_pred - mtcars_train$mpg)^2))
cat("Random Forest RMSE:", rf_rmse2, "\n")


library(randomForest)
library(randomForest)
data(mtcars)
rf_model1 <- randomForest(mpg ~ ., data = mtcars, ntree = 1000, importance = TRUE)
varImpPlot(rf_model1, main = "Feature Importance Plot")
# Fit the random forest model
rf_model <- randomForest(mpg ~ ., data = mtcars_train, ntree = 500)



