library(dplyr)
library(ggplot2)
library(performance)
library(PerformanceAnalytics)
library(see)
library(readxl)
dataset <- read_excel("~/Downloads/Melbourne_Housing_NMD&NOD.xlsx")
View(dataset)

variables <- dataset %>% select("Price", "Total_spaces_new", "Distance")

sum(is.na(variables$Price))
sum(is.na(variables$Total_spaces_new))
sum(is.na(variables$Distance))
variables[is.na(variables)] <- 0

View(variables)

lm_mealbourne_housing_price <- lm((Price)~(Total_spaces_new) + (Distance), data = variables)
summary(lm_mealbourne_housing_price)

check_autocorrelation(lm_mealbourne_housing_price)
check_collinearity(lm_mealbourne_housing_price)
check_heteroscedasticity(lm_mealbourne_housing_price)
check_normality(lm_mealbourne_housing_price)


