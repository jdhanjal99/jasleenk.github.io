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

When conducting the linear regression, the data shows that all variables except weight (wt) had p values higher than 0.05.This shows that weight is the most relevant variable in finding out which car is most fuel efficient.

The mean squared error (MSE) of the linear regression before optimization is 7.023544, the R squared value is 0.8690158, and the adjusted R squared is  0.8066423. R squared suggests that 81% of the variability in the response variable mpg is explained by the predictor variables which means that the predictor values explain a significant amount of variability in the response variable ‘mpg’. The adjusted R suggests that the model is not overfitting to the data. The AIC is 163.7098 and the BIC is 183.2986. The regression MSE os 2.283353. 

![Screen Shot 2023-11-08 at 10 47 47 PM](https://github.com/jdhanjal99/jdhanjal99.github.io/assets/145622744/ffe2df4d-85c4-4598-a84a-e7db8540e883)

 **Box plot**
 
 Some notable takeaways from constructing a box plot are 
 -The ariables VS and AM have values that are tightly clustered  (no outliers)
 -The variable gear has no minimum values outside the range of the box plot. 

![Screen Shot 2023-11-08 at 10 49 18 PM](https://github.com/jdhanjal99/jdhanjal99.github.io/assets/145622744/40450221-50d4-4231-9dab-bb2432dca175)
                                                    Optimal Linear Regression
                          model_step <- lm(formula = mpg ~ hp + wt + qsec + am, data = mtcars_train)

**Using variable selection**
By using backwards selection, we were able find the optimal linear regression by removing the least significant variables. The AIC at the first step of the variable selection was 65.52. After taking away all but disp, weight, qsec, and am, the AIC at the last step was 55.45. The AIC & BIC of the final model selected by the backwards selection process was 136.5422 & 144.5354 respectively.  This variable selection process shows that the optimal model includes the variables hp, wt, qsec, and am. The p values for weight, qsec, and am are all under 0.05 which shows that they are significant to predicting the response variable. The value of Multiple R Squared, 0.8671, suggests that the optimal linear regression model explains about 86.71% of the variability in the actual fuel efficiency of the cars in your dataset. The value of adjusted R squared, 0.844, suggests that about 84.4% of the variability in fuel efficiency is explained. We can see that the R squared values are similar in both models, so looking at the AIC is a better indicator that this is  the optimal model compared to the model using all variables. 

**Residuals vs. Fitted**

The Residuals vs. Fitted plot demonstrates that all predicted values are randomly scattered around zero, indicating that the model is appropriate for the data with no discernible pattern.

![Screen Shot 2023-11-08 at 10 49 38 PM](https://github.com/jdhanjal99/jdhanjal99.github.io/assets/145622744/b2165c51-beed-4f21-a4a6-365277107743)

                                                   Random forest model
**Model Performance**

For the random forest model, a 90% training set and 10% testing set was used. 

The out of sample mean squared error (MSE) on the testing data set is 2.353272, which suggests the average squared difference between what our model predicted and the actual fuel efficiency. This tells us that the model performs well on new, unseen data. The in sample MSE helps us see how well our model fits the data it was trained on, and has the value of 60.7849. R squared is 0.843187, meaning our model captures about 84.32% of the variability. Adjusted R Squared is 80.48. This means that the predictor variables in the  random forest model explain 80.48% of the variance in the response variable mpg. The mean squared residuals, which is the average of the squared differences between our predicted values and the actual values, is 7.015532. It gives us an overall sense of how well our model is doing in terms of prediction accuracy.


**Feature Importance Plot**

The plot below shows that taking away the variables weight (wt), horsepower (hp), cylinders (cyl), and displacement (disp) will result in the model to have the largest decrease in accuracy. This means that weight is the most important variable that predicts fuel efficiency since it is at the top.  
![Screen Shot 2023-11-08 at 10 50 19 PM](https://github.com/jdhanjal99/jdhanjal99.github.io/assets/145622744/2ff906b4-9d13-4473-afd4-89f6de166e4e)


                                                     Conclusions
We can see that the random forest model is quite effective, explaining a significant portion (80.48%) of the differences in fuel efficiency. The out-of-sample MSE indicates it performs well on new, unseen data, and the R-squared provides confidence in the model's ability to capture and understand the patterns in the data.

However, the optimal linear regression model outperformed the random forest model. The mean squared error in the optimal linear regression is notably lesser than that in the random forest, signifying a higher precision in predictions. Additionally, the optimal linear regression model had a higher adjusted r square, which indicates it is a better fit for the original regression model. 

Analyzing the optimal linear regression model reveals that weight, quarter-mile time, transmission type (automatic/manual), and horsepower are the most significant variables that influence a vehicle's fuel efficiancy. On the other hand, the random forest model suggests that weight, displacement, cylinders, and horsepower play crucial roles in determining fuel efficiency.

In conclusion, we would use the optimal linear regression model when determining which variables have the most effect on gas mileage. Consequently, weight, quarter mile time, automatic/manual transmission, and horsepower are the variables that affect a vehicle's gas mileage the most. 


