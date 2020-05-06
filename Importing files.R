install.packages("readr")
library(readr)

##Setting working directory
setwd("C:/Users/AKIRA/Desktop/R Programs/")
getwd()

##importing a .txt table space separated
Titanic=read.table("Titanic_space_separated.txt",header=TRUE)
class(Titanic)
head(Titanic,4)
View(Titanic) ##V has to be capital
tail(Titanic,6)

##overview functions
str(Titanic)
Titanic$Sex=as.character(Titanic$Sex)
summary(Titanic)
Titanic$Sex=as.factor(Titanic$Sex)
summary(Titanic)

##importing a .txt table which is comma separated
Orange=read.table("Orange_comma_separated.txt",header=TRUE,sep=",")
View(Orange)
class(Orange)
summary(Orange)
Orange$Tree=as.factor(Orange$Tree)

##importing .csv file
country=read.csv("Countries Population.csv")
summary(country)
country$ï..Country.Name=as.factor(country$ï..Country.Name)
country$Country.Code=as.factor(country$Country.Code)
summary(country)


##import excel files
install.packages("readxl")
country2=read_excel("Countries Region Mapping.xlsx")
summary(country2)
country2$Country.Code=as.factor(country2$Country.Code)
country2$Region=as.factor(country2$Region)
class(country2)
country2$Country.Code=as.data.frame(country2$Country.Code)
country2$Region=as.data.frame(country2$Region)
country2=as.data.frame(country2)
