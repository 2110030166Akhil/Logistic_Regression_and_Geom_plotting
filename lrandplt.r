heart_data <- read.csv("C://Users//Akhil//AppData//Roaming//Telegram Desktop//heart_cleveland_upload.csv")
head(heart_data)
View(heart_data)
library(ggplot2)


ggplot(heart_data, aes(x = age)) +
  geom_histogram(binwidth = 2) +
  labs(title = "Distribution of Age", x = "Age", y = "Frequency")
 
ggplot(heart_data, aes(x =sex))+
  geom_bar() +
  labs(title = "Distribution of Sex", x = "Sex", y = "Count") 

ggplot(heart_data, aes(x = condition, y = chol))+
  geom_boxplot() +
  labs(title = "Cholesterol Distribution by Condition", x = "Condition", y = "Cholesterol") 

ggplot(heart_data, aes(x = thalach, y = oldpeak)) +
  geom_point() +
  labs(title = "Scatterplot of Thalach vs. Oldpeak", x = "Thalach", y = "Oldpeak") 

library(tidyverse)

heart_data %>%
  glm(condition ~ age, data = ., family = binomial) %>%
  summary()

logistic_model_heart <- glm(condition ~ age, data = heart_data, family = binomial)
logistic_model_heart
summary(logistic_model_heart)
print(logistic_model_heart$residuals)
hist(logistic_model_heart$residuals)

new_age <- data.frame(age = c(40, 45, 50))
predict(logistic_model_heart, newdata = new_age, type = "response") %>% round()


ggplot(heart_data, aes(x = age, y = condition)) +
  geom_point() +
  theme_bw() +
  labs(x = 'Age', y = 'Probability of Condition', title = 'Logistic Regression: Age and Condition')

