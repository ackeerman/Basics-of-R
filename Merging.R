#import library
library(readr)
library(readxl)

#setting working directory
setwd("C:/Users/AKIRA/Desktop/R Programs/")

#importing csv files
country=read.csv("Countries Population.csv")
summary(country)
colnames(country)=make.names(colnames(country))
country$Country.Code=as.factor(country$Country.Code)
country$ï..Country.Name=as.factor(country$ï..Country.Name)

#importing xlsx files
countrymap=read_excel("Countries Region Mapping.xlsx")
summary(countrymap)
countrymap$Country.Code=as.factor(countrymap$Country.Code)
countrymap$Region=as.factor(countrymap$Region)
countrymap$IncomeGroup=as.factor(countrymap$IncomeGroup)
summary(countrymap)

#ordering the files
countrymap$IncomeGroup=ordered(countrymap$IncomeGroup,levels=c("Low income","High income","Lower middle income","Upper middle income"))
class(countrymap$IncomeGroup)
summary(countrymap)

#importing another data set
countryinfo=read.csv("Countries Indicators.csv",header=TRUE,sep=",")
countryinfo$Country.Code=as.factor(countryinfo$Country.Code)
countryinfo$GDP.per.capita.2017=as.factor(countryinfo$GDP.per.capita.2017)
countryinfo$Under.5.Mortality.Rate.2017=as.factor(countryinfo$Under.5.Mortality.Rate.2017)
summary(countryinfo)

#joining 1st, 2nd and 3rd dataset
temp=merge(country,countrymap,by="Country.Code",all.x=TRUE) #left join
countryall=merge(country,countrymap,by="Country.Code") #inner join
temp2=merge(countryall,countryinfo,by="Country.Code",all=TRUE) #full outer join
countryall=merge(countryall,countryinfo,by="Country.Code",all.x=TRUE ) #correct left join

#remove
rm(temp,temp2)
