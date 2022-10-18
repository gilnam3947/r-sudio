##################################
# R 데이터 분석 
# LN1 
# 2022-09-05
##################################
setwd("c:/temp100") # working directory 를 지정 
getwd()

# working directory 내에 있는 데이터 불러오기 
auto <- read.csv(file="Auto.csv")  # data frame 
View(auto)

install.packages("haven")
library(haven)

# Unpop.dta 
data1<- read_dta(file="Unpop.dta")

install.packages("rgl")
library(rgl)
example(plot3d)

install.packages("readxl")
library(readxl)

auto1<-read_excel("Auto1.xlsx")
# read_excel("Auto1.xlsx", sheet="")

# 패키지가 제공하는 R 데이터 
install.packages("lmtest")
library(lmtest)
data(package="lmtest")
data("bondyield")

# ISLR 패키지를 설치한 후 Caravan data를 가져와라 

help(read.csv)
?read.csv
?haven::read_dta





























