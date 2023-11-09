<<<<<<< HEAD
## README

Repository for Motor Trend Car Road Tests data
San Jose State University
Department of Marketing and Business Analytics



Introduction:

This project is based on the data analysis of the mt cars dataset retrieved from R Studio. Information on 11 variables were taken from 32 automobiles where miles per gallon was the predictor variable. The goal of this project is to determine which variables significantly affect the fuel efficiency of a car. 


Exploratory Analysis:

Shown below is the exploratory analysis of the project. To interpret the variable cylinder (cyl), we can see that the lowest number of cylinders in an automobile from the data set is 4 and the highest number is 8. 25% of the data has 4 cylinders, on average there are 6 cylinders, and 75% of the data set has 8 cylinders. The interpretations would be the same for the rest of the 10 variables. 

Linear Regression 
Model Performance
When conducting the linear regression, the data shows that all variables except weight (wt) had p values higher than 0.05. By doing this, I was able to narrow down which variable is most significant to the problem we are trying to solve. Weight is the most relevant variable in finding out which car is most fuel efficient.The mean squared error (MSE) of the regression is 7.023544, the R squared value is 0.8690158, and the adjusted R squared is  0.8066423. R squared suggests that 81% of the variability in the response variable mpg is explained by the predictor variables which means that the predictor values explain a significant amount of variability in the response variable ‘mpg’.
The adjusted R suggests that the model is not overfitting to the data. The AIC is 163.7098 and the BIC is 183.2986. The regression MSE os 2.283353. 


. 
Box plot
The figure below is a visual of the box plot on the linear regression. Some notable takeaways are that VS and AM have values that are tightly clustered  (no outliers), and the variable gear has no minimum values outside the range of the box plot. 

Using variable selection
Using backwards selection, the  starting AIC was 65.52. After taking away all but disp, weight, qsec, and am, AIC was 55.45. This variable selection process shows that the optimal model is lmmodel_1 = mpg ` disp + wt + qsec + am . The p values for weight, qsec, and am are all under 0.05 which shows that they are significant to predicting the response variable. The Multiple R-squared is 0.8671 and adjusted R squared is 0.844 which are fairly high. There is a 86% chance that the  response variable is predicted by the predictor variables. We can see that the R squared values are similar in both models, so looking at the AIC is a better indicator that this is  the optimal model compared to the model using all variables. . 
Residuals vs. Fitted
In the Residuals vs fitted plot below, all values of the predicted values are randomly scattered around zero. Since there is no pattern, we can see that this model is appropriate for the data. 

 


Random forest model
Model Performance
For the random forest model, a 90% training set and 10% testing set was used. The out of sample mean squared error (MSE) on the testing data set is 2.353272 and the in sample MSE is 60.7849. R squared is 0.843187 and percent variance is 80.48. This means that the predictor variables in the  random forest model explain 80.48% of the variance in the response variable mpg. The mean squared residuals is 7.015532. 
Feature Importance Plot
The plot below shows that taking away the variables weight (wt), horsepower (hp), cylinders (cyl), and displacement (disp) will result in the model to have the largest decrease in accuracy. This means that weight is the most important variable that predicts fuel efficiency since it is at the top.  


Conclusions
The optimal linear regression model had less error than the random forest. We can see this because the MSE in the optimal linear regression was less than the MSE on the random forest model, meaning there was less error. Additionally, the optimal linear regression model had a higher adjusted r square, which indicates it is a better fit for the original regression model. 

According to the optimal linear regression, the variables that had the most effect on gas mileage on a vehicle are weight, quarter mile time, automatic/manual transmission,and horsepower. The random forest indicates the variables weight, displacement, cylinders, and horsepower have the most effect on gas mileage. 

To conclude, we would use the optimal linear regression model when determining which variables have the most effect on gas mileage. Hence, weight, quarter mile time, automatic/manual transmission, and horsepower are the variables that affect a vehicle's gas mileage the most. 

=======
# jdhanjal99.github.io

Department of Marketing and Business Analytics


                                                       Introduction
This project is based on the data analysis of the mt cars dataset retrieved from R Studio. Information on 11 variables were taken from 32 automobiles where miles per gallon serves as the predictor variable. The goal of this project is to determine which variables significantly influence a car's fuel efficiency.

In this analysis, we will compare two models to determine the most accurate one: the optimal linear regression model and the random forest model. These models will be evaluated based on their performance metrics, and we will identify which one provides the best fit for the data, allowing us to gain insights into the factors influencing a car's fuel efficiency.


                                                    Exploratory Analysis
To interpret the variable cylinder (cyl),we can see that the lowest number of cylinders in an automobile from the data set is 4 and the highest number is 8. 25% of the data has 4 cylinders, on average there are 6 cylinders, and 75%of the data set has 8 cylinders.

Similar interpretations would be the same for the rest of the 10 variables (miles per gallon (mpg), displacement (disp), horsepower (hp), rear axle ratio (drat), weight (wt), quarter mile time in seconds (qsec), engine type (vs), transmission type (am), number of forward gearss (gear), & number of carburetors (carb)).

![Screen Shot 2023-11-08 at 10 37 02 PM](https://github.com/jdhanjal99/jdhanjal99.github.io/assets/145622744/09dbad3e-9d20-4976-b44d-b7d19ea2076f)


                                                    Linear Regression 
             lm_model <- lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data = mtcars)

**Model Performance**

When conducting linear regression analysis, the data shows that all variables, except weight (wt), exhibit p values surprassing 0.05. This shows that weight is the most relevant variable in determining which car is most fuel efficient.

The initial linear regression produces a mean squared error (MSE) of 7.023544, reflecting the average squared difference between predicted and actual values. With an R-squared value of 0.8690158, it indicates that 81% of the variability in the response variable (mpg) is explained by the predictor variables. The adjusted R squared, at 0.8066423, ensures the model avoids overfitting. Additionally, the Akaike Information Criterion (AIC) is 163.7098, and the Bayesian Information Criterion (BIC) is 183.2986, offering insights into the model's goodness-of-fit. Following optimization, the regression MSE improves to 2.283353, showcasing enhanced predictive accuracy.

![Screen Shot 2023-11-08 at 10 47 47 PM](https://github.com/jdhanjal99/jdhanjal99.github.io/assets/145622744/ffe2df4d-85c4-4598-a84a-e7db8540e883)

 **Box plot**
 
 Some notable takeaways from constructing a box plot are 
 -Variables VS and AM exhibit tightly clustered values, and do not show any outliers.
 -The variable gear shows no minimum values outside the range of the box plot. 

![Screen Shot 2023-11-08 at 10 49 18 PM](https://github.com/jdhanjal99/jdhanjal99.github.io/assets/145622744/40450221-50d4-4231-9dab-bb2432dca175)
                                                    
                                                    Optimal Linear Regression
                          model_step <- lm(formula = mpg ~ hp + wt + qsec + am, data = mtcars_train)
                          

**Variable selection**

By using backwards selection, we are able find the optimal linear regression by removing the least significant variables. The AIC at the first step of variable selection is 65.52. After taking away all but disp, weight, qsec, and am, the AIC at the last step is 55.45. The AIC & BIC of the final model selected by the backwards selection process is 136.5422 & 144.5354 respectively. 

This variable selection process shows that the optimal model includes the variables hp, wt, qsec, and am. The p values for weight, qsec, and am are all under 0.05 which shows that they are significant to predicting the response variable. The value of Multiple R Squared, 0.8671, suggests that the optimal linear regression model explains about 86.71% of the variability in the actual fuel efficiency of the cars in your dataset. The value of adjusted R squared, 0.844, suggests that about 84.4% of the variability in fuel efficiency is explained. Since the R squared values are similar in both models, the AIC provides a more reliable indicator that this is the optimal model in contrast to the one using all variables.


**Residuals vs. Fitted**

The Residuals vs. Fitted plot demonstrates that all predicted values are randomly scattered around zero, indicating that the model is appropriate for the data with no discernible pattern.

![Screen Shot 2023-11-08 at 10 49 38 PM](https://github.com/jdhanjal99/jdhanjal99.github.io/assets/145622744/b2165c51-beed-4f21-a4a6-365277107743)

                                                   Random Forest Model
                                                   
                 rf_model1 <- randomForest(mpg ~ ., data = mtcars, ntree = 1000, importance = TRUE)
                 
**Model Performance**

For the random forest model, a 90% training set and 10% testing set is used. 

The out of sample mean squared error (MSE) on the testing data set is 2.353272, which suggests the average squared difference between what our model predicted and the actual fuel efficiency. The in sample MSE, 60.7849, helps us see how well our model fits the data it was trained on. R squared is 0.843187, meaning our model captures about 84.32% of the variability. Adjusted R Squared is 80.48, meaning that the predictor variables in the  random forest model explain 80.48% of the variance in the response variable mpg. The mean squared residuals, which is the average of the squared differences between our predicted values and the actual values, is 7.015532. It gives us an overall sense of how well our model is doing in terms of prediction accuracy.


**Feature Importance Plot**

The plot below shows that taking away the variables weight (wt), horsepower (hp), cylinders (cyl), and displacement (disp) will lead to largest decrease in accuracy for the model. This means that weight is the most important variable that predicts fuel efficiency, given it is at the top.  
![Screen Shot 2023-11-08 at 10 50 19 PM](https://github.com/jdhanjal99/jdhanjal99.github.io/assets/145622744/2ff906b4-9d13-4473-afd4-89f6de166e4e)


                                                     Conclusions
We can see that the random forest model is quite effective, explaining a significant portion (80.48%) of the differences in fuel efficiency. The out-of-sample MSE indicates it performs well on new, unseen data, and the R-squared provides confidence in the model's ability to capture and understand the patterns in the data.

However, the optimal linear regression model outperformed the random forest model. The mean squared error in the optimal linear regression is notably lesser than that in the random forest, signifying a higher precision in predictions. Additionally, the optimal linear regression model had a higher adjusted r square, which indicates it is a better fit for the original regression model. 

Analyzing the optimal linear regression model reveals that weight, quarter-mile time, transmission type (automatic/manual), and horsepower are the most significant variables that influence a vehicle's fuel efficiancy. On the other hand, the random forest model suggests that weight, displacement, cylinders, and horsepower play crucial roles in determining fuel efficiency.

In conclusion, we would use the optimal linear regression model when determining which variables have the most effect on gas mileage. Consequently, weight, quarter mile time, automatic/manual transmission, and horsepower are the variables that affect a vehicle's gas mileage the most. 


>>>>>>> 6ffeabe690ae5022e4bc9e0b77d06d19b6441078
