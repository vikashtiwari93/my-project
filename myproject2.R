require(ISLR)
require(dplyr) 
require(ggplot2) 
Default = ISLR::Default
Default
head(Default)
summary(Default$balance)
set.seed(234)
sample = sample(c(TRUE, FALSE), nrow(Default), replace = T, prob = c(0.6,0.4))
train  = Default[sample, ]
str(train)
test = Default[!sample, ]
str(test)
model_1 = glm(default~balance , family =  "binomial", data = train)
result_1 = predict(model_1,test,type = "response")  
result_1
summary(model_1)
table(test$default,result_1>0.5)
(3869+50)/(3869+22+81+50)
model_2 = glm(default~., family = "binomial", data =  train)
result_2 = predict(model_2 , test , type =  "response")
table(test$default, result_2 >0.5)
(3872+49)/(3872+19+82+49)
summary(model_2)