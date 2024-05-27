# README

## Overview
This README file provides an explanation of the R script used for analyzing heart disease data. The script performs data loading, visualization, and a logistic regression analysis to understand the relationship between various attributes and the condition of heart disease.

## Prerequisites
- R programming language
- R packages: `ggplot2`, `tidyverse`

Install the necessary packages by running:
```R
install.packages(c("ggplot2", "tidyverse"))
```

## Code Explanation

### Data Loading
The script begins by loading the heart disease dataset from a CSV file into a dataframe called `heart_data`:
```R
heart_data <- read.csv("C://Users//Akhil//AppData//Roaming//Telegram Desktop//heart_cleveland_upload.csv")
```

### Data Inspection
The first few rows of the dataset are displayed using:
```R
head(heart_data)
```
The `View` function is called to open a spreadsheet-style data viewer:
```R
View(heart_data)
```

### Data Visualization
Using the `ggplot2` package, several plots are generated to visualize the distribution and relationships of the dataset's attributes.

1. **Distribution of Age**
   ```R
   ggplot(heart_data, aes(x = age)) +
     geom_histogram(binwidth = 2) +
     labs(title = "Distribution of Age", x = "Age", y = "Frequency")
   ```
   
2. **Distribution of Sex**
   ```R
   ggplot(heart_data, aes(x = sex)) +
     geom_bar() +
     labs(title = "Distribution of Sex", x = "Sex", y = "Count")
   ```

3. **Cholesterol Distribution by Condition**
   ```R
   ggplot(heart_data, aes(x = condition, y = chol)) +
     geom_boxplot() +
     labs(title = "Cholesterol Distribution by Condition", x = "Condition", y = "Cholesterol")
   ```

4. **Scatterplot of Thalach vs. Oldpeak**
   ```R
   ggplot(heart_data, aes(x = thalach, y = oldpeak)) +
     geom_point() +
     labs(title = "Scatterplot of Thalach vs. Oldpeak", x = "Thalach", y = "Oldpeak")
   ```

### Logistic Regression Analysis
The `tidyverse` package is used for data manipulation and modeling:
```R
library(tidyverse)
```

1. **Logistic Regression Model**
   A logistic regression model is fitted to predict the condition based on age:
   ```R
   logistic_model_heart <- glm(condition ~ age, data = heart_data, family = binomial)
   summary(logistic_model_heart)
   ```

2. **Model Residuals**
   The residuals of the logistic regression model are printed and visualized:
   ```R
   print(logistic_model_heart$residuals)
   hist(logistic_model_heart$residuals)
   ```

3. **Prediction**
   Predictions are made for new data points (ages 40, 45, 50):
   ```R
   new_age <- data.frame(age = c(40, 45, 50))
   predict(logistic_model_heart, newdata = new_age, type = "response") %>% round()
   ```

4. **Logistic Regression Plot**
   A scatter plot is created to visualize the logistic regression model:
   ```R
   ggplot(heart_data, aes(x = age, y = condition)) +
     geom_point() +
     theme_bw() +
     labs(x = 'Age', y = 'Probability of Condition', title = 'Logistic Regression: Age and Condition')
   ```

## Running the Script
Ensure that the dataset path is correct and matches the location of your CSV file. Run the entire script in an R environment to perform the data analysis and visualization. Adjust the binwidth, labels, and model parameters as necessary to suit your analysis needs.

## Conclusion
This script provides a comprehensive approach to load, visualize, and analyze heart disease data using R. It demonstrates the use of basic data exploration techniques and logistic regression modeling to understand the impact of age on the condition of heart disease.
