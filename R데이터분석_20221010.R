############################
# R 데이터 분석 
# Lecture Note 5 and 6
# 2022-10-10
############################
setwd("c:/temp100")
afghan<-read.csv(file="afghan.csv")
summary(afghan)
summary(afghan$age)
summary(afghan$educ.years)

table(afghan$violent.exp.ISAF)
table(afghan$violent.exp.taliban)
# two-way table 
# 00열은 isaf와 탈레반에 모두 희생당하지 않은 1330명, 탈레반 13%, isfa 국제지원군 18%
table(afghan$violent.exp.ISAF, afghan$violent.exp.taliban)
tab1<-table(afghan$violent.exp.ISAF, afghan$violent.exp.taliban)
prop.table(tab1)
round(prop.table(tab1), digits=2) #소수점을 둘 째자리까지 반올림

#결측지: 설문 거부자
#소득의 결측치가 많다
head(afghan$income, n=10)
is.na(afghan$income)  # 결측치이면 T, 결측치가 아니면 F
mean(is.na(afghan$income))
sum(is.na(afghan$income))

#결측치가 1개라도 있으면 기본적인 연산과 계산이 안 된다.
x<-c(1,2,3, NA)
mean(x)
min(x)
max(x)
median(x)
mean(x, na.rm=T) #na를 remove하고 그걸 T로 바꿔라
min(x, na.rm=T)

#table 함수는 결측치를 무시하고 계산해준다
table(afghan$violent.exp.ISAF)
table(afghan$violent.exp.taliban)
sum(is.na(afghan$violent.exp.ISAF))
table(afghan$violent.exp.ISAF, exclude=NULL)

table(afghan$violent.exp.ISAF, 
      afghan$violent.exp.taliban, exclude=NULL)

# Q.2 피해 질문에 대해 무응답 비율은?
10/2754

# NA가 1번이라도 있는 경우 무응답 비율은?]
# listwise deletion이라고 부른다
# 2554는 11가지 질문 속에서 하나도 답변을 안 한 사람
afghan.sub<-na.omit(afghan) # listwise deletion, casewise deletion
nrow(afghan.sub)
afghan.sub1<-afghan[complete.cases(afghan),]
# complete.cases가 더 장점이 많다. 
# afghan.sub1<-afghan[complete.cases(afghan$income)
# income이라는 변수에서 결측치가 있으면 삭제하고, 나머지 income 이외에서 결측치가 있다면 삭제 하지 마라.


nrow(afghan.sub)  # 2554개 
length(afghan.sub)  # data frame에서는 변수의 갯수 
income1<-na.omit(afghan$income) #income이라는 변수에서 결측치가 있는 것을 제외하라
length(income1) # 2600개로 서로 다르다. 

# afghan$violent.exp.ISAF

# 범주형 변수의 분포를 이해한다. 
barplot(afghan$violent.exp.ISAF) # barplot은 바로 못 그릴 것이다. 테이블 생성 요망
tab2<-table(afghan$violent.exp.ISAF, exclude=NULL)
tab2
barplot(prop.table(tab2), 
        names.arg =c("No vio", "vio","NA" ))
tab3<-table(afghan$violent.exp.taliban, exclude=NULL)
tab3
barplot(prop.table(tab3), 
        names.arg =c("No vio", "vio","NA" ))

# 연속형 변수의 분포를 파악하고자 한다. 
# histogram 시각화를 사용한다. 
# educ.years
summary(afghan$educ.years)
hist(afghan$educ.years)
hist(afghan$age, freq=F)  # DENSITY를 표현한다.확률 밀도
# freq=F라는 값을 주게 되면 y축이 ferq를 구하지 않고  비율과 비슷한 denstiny를 표현
# 막대그래프의 너비가 전체의 비율을 말함
#  다만 density는 정확히 비율과 같지는 않다. 그러나 
# 비율과 유사하다. 

# Density(확률밀도) 비율??

# educ.years 변수에 대한 히스토그램 
# 5 : the number of bins (범주의 갯수)
hist(afghan$educ.years, breaks=5)
# breaks 범주 갯수
# breaks 옵션에서는 자신이 직접 bin의 범위를 지정할 수도 있다. 
hist(afghan$educ.years, breaks=c(0,5,10,15,20))
hist(afghan$educ.years)

# Sturges' Rule을 이용해서 범주의 갯수를 정한다.ㅏ 
log2(2754)+1
hist(afghan$educ.years)
abline(v=5, col="red") # 수직선, 수평선, 기울기가 있는 직선
abline(h=0.01, col="red") # 수평선 그리기



###################################################### 2교시


# box plot
boxplot(afghan$age)
# IQR Interquartile Range: 75분위값-25분위값
# 50%의 분포도

# province(시도)
table(afghan$province)
boxplot(afghan$age ~ afghan$province)

# 교육수준이 상대적으로 낮은 곳이 피해를 많이 봤을 것이다라는 예측으로 교육열 분석
# educ.year 변수 
boxplot(educ.years ~ province, data=afghan)

# Helmand , Uruzgan이 피해를 많이 받았는지? 
# 각 시도별로 ISAF, taliban의 피해변수의 평균을 계산한다. 
tapply(afghan$violent.exp.ISAF, 
       afghan$province, FUN=mean, na.rm=T)
tapply(afghan$violent.exp.taliban, 
       afghan$province, FUN=mean, na.rm=T)

pdf(file="educ1.pdf", height=5,width=5) # inch 
boxplot(educ.years ~ province, data=afghan)
dev.off() #pdf 닫을 때 

# par(mfrow=cc(1,2)) 두개의 자료를 pdf로 표현    
  

   
congress <- read.csv(file="congress.csv")
# dwnom1: 경제적 보수/진보  + 보수적 , - 진보적 
# dwnom2: 인종적 보수/진보  + 보수적, - 진보적 

#rep80 = 80대 국회의원 

rep <- subset(congress,
              subset=(party=="Republican"))
dem <- subset(congress,
              subset=(party=="Democrat"))

rep80<-subset(rep, subset=(congress==80))
rep112<-subset(rep, subset=(congress==112))

dem80<-subset(dem, subset=(congress==80))
dem112<-subset(dem, subset=(congress==112))

#margin 기본 설정이 너무 좁게 설정 되어 있음
#par("mar")
#par(mar=c(1,1,1,1))

# scatter plot: Spatial vote
# 80대 하원
plot(dwnom2~ dwnom1,data=rep80) # 공화당, 경제적으로는 보수, 인종쪽으로는 중립 Republican Party
plot(dwnom2~ dwnom1,data=dem80) # 민주당, 경제적으로는 진보, 인종쪽으로는 중립 Democratic Party

plot(dwnom2~ dwnom1,data=rep80,
     col="red", xlim=c(-1,1)) # xlim=c(-1,1)) 짤리는걸 방지, x축 범위를 넓게
points(dwnom2~ dwnom1,data=dem80, col="blue" )

# 112대 하원
plot(dwnom2~ dwnom1,data=rep112,
     col="red", xlim=c(-1,1))
points(dwnom2~ dwnom1,data=dem112, col="blue" )

# 최근 국회의원은 경제적으로 완전 정치적 양극화가 진행되고 있음.

# 최근 시점으로 올수록 경제적 진보/보수 성향이 양극화 
# 양극화 되었다는 것을 확실히 알 수 있다. 
# 그러나 인종적 진보/보수는 오히려 서로 유사해 졌다는 것을 알 수 있다. 

# 80 ~ 112대 회기까지 
# dwnom1(economic) : 시계열 라인그래프를 그린다. 
# 각 정당에 대해서 라인그래프를 그린다. 


# dwnom2(race)에 대해서도 같은 그래프를 작성한다. 
# 이 그래프를 통해서 연구질문에 답할 수 있다. 

# 전반적 이념성향: 평균 또는 중앙값
# median을 계산한다. 
# 각 회기별 중앙값을 계산해야 한다. 
# tapply 중앙값 계산하는 방법임
dem.median_econ<-tapply(dem$dwnom1, 
                        dem$congress, FUN=median)
dem.median_econ
rep.median_econ<-tapply(rep$dwnom1, 
                        rep$congress, FUN=median)
rep.median_econ

plot(dem.median_econ ~ names(dem.median_econ), 
     type="l", col="blue")
plot(rep.median_econ ~ names(rep.median_econ), 
     type="l", col="red")

plot(dem.median_econ ~ names(dem.median_econ), 
     type="l", col="blue", ylim=c(-0.7,0.7))
lines(rep.median_econ ~ names(rep.median_econ), 
     type="l", col="red")

# race conservatism # 민주당과 공화당의 인종 관점 차이 
dem.median_race<-tapply(dem$dwnom2, 
                        dem$congress, FUN=median)
dem.median_race
rep.median_race<-tapply(rep$dwnom2, 
                        rep$congress, FUN=median)
rep.median_race

plot(dem.median_race ~ names(dem.median_race), 
     type="l", col="red", ylim=c(-0.7,0.7))
lines(rep.median_race ~ names(rep.median_race), 
      type="l", col="blue")




