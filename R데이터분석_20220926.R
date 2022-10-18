#################################
# R 데이터 분석 
# Lecture Note 4
# 2022-09-26
#################################
setwd("c:/temp100")
minwage<-read.csv(file="minwage.csv")
dim(minwage)  
nrow(minwage)
summary(minwage)

# subset 함수 
minwageNJ<- subset(minwage, subset=(location!="PA"))
minwagePA<- subset(minwage, subset=(location=="PA"))

# 법이 잘 준수되고 있는지 확인해 보자. 
# NJ $5.05 
mean(minwageNJ$wageAfter<5.05)
mean(minwageNJ$wageBefore<5.05)

# PA state의 after , before 임금비율을 계산해라. 

minwageNJ$fullPropAfter <- (minwageNJ$fullAfter)/ 
  (minwageNJ$fullAfter+minwageNJ$partAfter) 

minwagePA$fullPropAfter <- (minwagePA$fullAfter)/ 
  (minwagePA$fullAfter+minwagePA$partAfter) 

# after 시점에서 두 states의 정규직 비율의 차이를 계산한다. 

mean(minwageNJ$fullPropAfter)- 
  mean(minwagePA$fullPropAfter ) 

tableNJ<-table(minwageNJ$chain)
prop.table(tableNJ)
tablePA<-table(minwagePA$chain)
prop.table(tablePA)

minwageNJ.bk<-subset(minwageNJ, 
                     subset=(chain=="burgerking"))

minwagePA.bk<-subset(minwagePA, 
                     subset=(chain=="burgerking"))

mean(minwageNJ.bk$fullPropAfter)- 
  mean(minwagePA.bk$fullPropAfter ) 

table(minwageNJ.bk$location)

minwageNJ.bk.NS <- subset(minwageNJ.bk, 
                          subset=(location=="northNJ")| 
                            (location=="southNJ"))
# NJ.bk.NS와 PA.bk를 비교한다. 

# 중앙값 비교 
median(minwageNJ$fullPropAfter)- 
  median(minwagePA$fullPropAfter ) 

summary(minwageNJ$fullPropAfter)
summary(minwagePA$fullPropAfter)

# InterQuartile Range : IQR 
IQR(minwageNJ$fullPropAfter)
IQR(minwagePA$fullPropAfter)

boxplot(minwageNJ$fullPropAfter)

summary(minwageNJ$wageBefore)
summary(minwageNJ$wageAfter)

quantile(minwageNJ$wageAfter)
quantile(minwageNJ$wageAfter, probs=c(0.1, 0.9))
quantile(minwageNJ$wageAfter, 
         probs=seq(from=0, to=1, by=0.1))

