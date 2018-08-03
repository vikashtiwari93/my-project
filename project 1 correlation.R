x = sample(1:20 ,20) + rnorm(10, sd = 2)
x
y  = x+rnorm(10 , sd = 3)
z = (sample(1:20 ,20)/2) + rnorm(20, sd =5)
df = data.frame(x,y,z)
View(df)
plot(df[,1:3])
cor(df, method = "pearson")
cor(df[,1:3], method = "spearman")
cor.test(df$x,df$y, method = "pearson")
cor.test(df$y,df$z, method = "pearson")
str(faithful)
duration = faithful$eruptions
waiting = faithful$waiting
plot(duration, waiting)
cor(duration,waiting)
cor.test(duration, waiting, method = "pearson")
library("ggpubr")
my_data = mtcars
head(my_data, 6)
str(my_data, 6)
ggscatter(my_data, x ="mpg", y= 'wt' , add = "reg.line" , conf.int = T , cor.method = "pearson")
ggscatter(my_data, y ="mpg", x= 'wt' , add = "reg.line" , conf.int = T , cor.method = "pearson")
shapiro.test(my_data$mpg)
?shapiro.test
ggqqplot(my_data$mpg ,ylab = "MPG")
ggqqplot(my_data$wt , ylab = "WT")
mtcars
?rnorm
res = cor.test(my_data$wt, my_data$mpg, method =  "pearson")
res
res1 = cor.test(my_data$wt, my_data$mpg, method =  "kendall")

res1
x = mtcars[1:3]
y = mtcars[4:6]
cor(x,y)
require(Hmisc)
rcorr(as.matrix(mtcars))
M = cor(mtcars)
require(corrplot)
corrplot(M, method = "circle")
corrplot(M, method = "ellipse")
corrplot(M, method = "color")
cor_1 = rcorr(as.matrix(mtcars))
M = cor_1$r
p_mat = cor_1$P
corrplot(M, type = "upper", order = "hclust", p.mat = p_mat, sig.level = 0.05)
load("C:/Users/czone/Desktop/vikash ATI Class/SESSION4-DATASET/marketing.rda")
head(marketing, 4)
str(marketing)
View(marketing)
library(ggplot2)
ggplot(marketing, aes(x= youtube , y= sales))
ggplot(marketing, aes(x= youtube , y= sales))+geom_point()+stat_smooth()
ggplot(marketing)+geom_point()+stat_smooth()
ggplot(marketing, aes(x= youtube , y= sales))+geom_point()+stat_smooth()
cor(marketing$sales, marketing$youtube)
model = lm(sales~youtube, data = marketing)
model
ggplot(marketing, aes(x= youtube , y= sales))+geom_point()+stat_smooth(method = lm)+stat_smooth()
summary(model)
###practicing
ggplot(marketing, aes(x= facebook , y= sales))+geom_point()+stat_smooth(method = lm)+stat_smooth()
model1 = lm(sales~facebook, data = marketing)
summary(model1)
cor(marketing$facebook,marketing$sales)

getwd()
setwd("C:/Users/czone/Documents")

