## importing the dataset

titanic_train = read.csv("C:/Users/czone/Downloads/train.csv")
titanic_test = read.csv("C:/Users/czone/Downloads/test.csv")

##exploring the data & preparing

head(titanic_train)
head(titanic_test)
str(titanic_train)
titanic_train$isvalue = TRUE
titanic_test$isvalue = FALSE
ncol(titanic_train)
ncol(titanic_test)
titanic_test$Survived = NA
titanic.full = rbind(titanic_train, titanic_test)
names(titanic_train)
names(titanic_test)
titanic.full = rbind(titanic_train , titanic_test)
tail(titanic.full)

##identifying the missing values & removing them 

table(titanic.full$Embarked)
titanic.full[titanic.full$Embarked== '', "Embarked"] = 'S'
table(titanic.full$Embarked)
sum(is.na(titanic.full$Embarked))
sum(is.na(titanic.full$Age))
median.age = median(titanic.full$Age, na.rm = T)
titanic.full[is.na(titanic.full$Age), "Age" ] <- 28
table(is.na(titanic.full$Age))
table(is.na(titanic.full$Fare))
median.fare  = median(titanic.full$Fare , na.rm = T)
median.fare
titanic.full[is.na(titanic.full$Fare) , "Fare"] <- median.fare
table(is.na(titanic.full$Fare))
str(titanic.full)

## category customisation

titanic.full$Pclass<-as.factor(titanic.full$Pclass)
titanic.full$Cabin<-as.character(titanic.full$Cabin)

## splitting the data

titanic_train = titanic.full[titanic.full$isvalue == TRUE,]
titanic_test = titanic.full[titanic.full$isvalue == FALSE,]
str(titanic_train)
titanic_train$Survived = as.factor(titanic_train$Survived)
library(randomForest)

### preparing the model & prediction of the model

Survived.equation = ("Survived ~ Pclass + Sex +Age + SibSp +Parch  +Fare+ Embarked")
survived.formula = as.formula(Survived.equation)
titanic.model = randomForest(survived.formula , data =  titanic_train ,
                             ntree = 300 , mtry = 3 , nodesize = 0.01*nrow(titanic_train))
Survived = predict(titanic.model, titanic_test)
Survived
class(Survived)
Survived= as.data.frame(Survived)
Survived
passengerid = titanic_test$PassengerId
output = cbind(passengerid, Survived)
View(output)
write.csv(output , file = "C:/Users/czone/Desktop/output.csv", row.names = FALSE)
