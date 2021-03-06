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
country$�..Country.Name=as.factor(country$�..Country.Name)

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

#tables
regionvsincome=table(countryall$Region,countryall$IncomeGroup)
regionvsincome
prop.table(regionvsincome,1) #proportions row total=1
prop.table(regionvsincome,2) #column total=1

#install package
install.packages("dplyr")
library(dplyr)

#extracting different regions
regionsum= countryall %>% group_by(Region) %>% summarise()
View(regionsum)
regionincome= countryall %>%group_by(IncomeGroup, Region) %>%summarise()
View(regionincome)
regionincome= countryall %>%group_by(IncomeGroup, Region) %>%summarise(number.of.countries=n())
View(regionincome)
regionsum= countryall %>% group_by(Region) %>% summarise(Different.income.groups=n_distinct(IncomeGroup))
View(regionsum)

#Big summary
regionsum1= country %>% group_by(Country.Code) %>% summarise(Number.of.countries=n(),
                                                         Total.population.millions=sum(Total.Population.2017/10000000))
                                                        
View(regionsum1)
 regionsum2=countryinfo %>% group_by(Country.Code) %>% summarise(Number.of.countries=n(), 
                                                                 Average.GDP=mean(GDP.per.capita.2017, na.rm = TRUE),
                                                                  median.GDP=median(GDP.per.capita.2017, na.rm = TRUE),
                                                                  standard.deviation=sd(GDP.per.capita.2017, na.rm=TRUE),
                                                                  min.mortality=min(Under.5.Mortality.Rate.2017,na.rm=TRUE),
                                                                  max.mortality=max(Under.5.Mortality.Rate.2017,na.rm=TRUE))
View(regionsum2) 
regionsum3=regionincome%>% group_by(Region) %>% summarise(Number.of.countries=n(),
                                                          low.income=sum(IncomeGroup=="Low Income"),
                                                          high.income=sum(IncomeGroup=="High Income"))
View(regionsum3)
