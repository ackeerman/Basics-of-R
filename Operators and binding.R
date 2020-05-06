setwd("C:/Users/AKIRA/Desktop/R Programs/")
library(readr)
country=read.csv("Countries Population.csv")
?colnames
?make.names()
 colnames(country)=make.names(colnames(country))
colnames(country) 
summary(country)

##logical operators
firsttencountry=head(country$Total.Population.2017,10)
firsttencountry
 bigfirstcountry=firsttencountry>10000000
bigfirstcountry 

#greater than
country[country$Total.Population.2017>10000000,]
bigcountry=country[country$Total.Population.2017>10000000,]

#less than or equal to
smallcountry=country[country$Total.Population.2017<=200000,]
bigcountry
smallcountry

#AND and OR operator
bigandsmallcountry=country[country$Total.Population.2017>10000000 & country$Total.Population.2017<=10000000,]
bigandsmallcountry=country[country$Total.Population.2017>10000000 | country$Total.Population.2017<=200000,]
bigandsmallcountry
bigandsmallcountry2=rbind(bigcountry,smallcountry)
bigandsmallflag=bigandsmallcountry$Total.Population.2017>10000000
bigandsmallcountry2=cbind(bigandsmallcountry2,bigandsmallflag)
 summary(bigandsmallcountry2)

 #exponential and logarthmic
country$newpopulationinmillions=country$Total.Population.2017/1000000
country$log=log(country$newpopulationinmillions)
head(country$log)
country$log=exp(country$newpopulationinmillions)
head(country$log)

#ordering
country=country[order(country$Total.Population.2017),]
View(country)
bigandsmallcountry2=bigandsmallcountry2[order(bigandsmallcountry2$Total.Population.2017),]
View(bigandsmallcountry2)
bigandsmallcountry2$millions=bigandsmallcountry2$Total.Population.2017/1000000
bigandsmallcountry2$log=log(bigandsmallcountry2$Total.Population.2017)
bigandsmallcountry$exp=exp(bigandsmallcountry2$Total.Population.2017)

#reversing the order
bigandsmallcountry2=bigandsmallcountry2[order(-bigandsmallcountry2$Total.Population.2017),]
View(bigandsmallcountry2)
