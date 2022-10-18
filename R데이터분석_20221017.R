################################
# R 데이터 분석 
# Lecture Note 6 and 7 
# 2022-10-17
###############################

# 정치적 양극화의 원인(인과관계)를 알고 싶다.
# 소득불평등의 증가가 원인이 될 수 있다.
# 이를 인과관계로 추정하고 증명을 해보자.
# 인과관계를 증명해야 한다. 이것은 어려운 일이지만 가능하다.

# 지니계수를 이용하여 소득불평등을 측정해보자.
# 지니계수를 계산하기 위해서는 먼저 Lorenz Curve를 그려야 한다.
# 가로(x)축: 최저소득 -> 최고소득 순으로그린다.
# 세로(y)축: 개인소득이 소득백분위 수보다 작거나 같은 누적 점유율
# 현실의 로렌즈 곡선은 커브를 이루며 휘어있다. 

# USgini.csv 파일은 1947~2013년까지의 미국의 지니계수 자료이다.
# x축 시간, y 지니계수

setwd("c:/temp100")
gini <- read.csv(file = "USgini.csv")
plot(gini$gini ~ gini$year, type="l") # type="l"은 라인을 그리라는 뜻이다.

congress <- read.csv(file="congress.csv")
# dwnom1: 경제적 보수/진보  + 보수적 , - 진보적 --------------1경제
# dwnom2: 인종적 보수/진보  + 보수적, - 진보적 ---------------2인종
rep <- subset(congress,
              subset=(party=="Republican"))
dem <- subset(congress,
              subset=(party=="Democrat"))

dem.median_econ<-tapply(dem$dwnom1, 
                        dem$congress, FUN=median) #민주당의 경제적 성향
dem.median_econ
rep.median_econ<-tapply(rep$dwnom1, 
                        rep$congress, FUN=median) #공화당의 경제적 성향
rep.median_econ 
#par(pyt(dafault=FALSE) 
polar_econ<-rep.median_econ-dem.median_econ # 두 정당의 차이를 먼저 계산
polar_econ #33개의 차이, 격차가 점점 커지는걸 볼 수 있음. 양극화 심화됨.
plot(polar_econ ~ names(polar_econ), type="l") #두 정당의 경제적 관점으로서의 양극화가 격화되고 있음










###############################
###############################
# 표준화 함수: scale , 근거를 만들다, 기준을 만들다
# 상관계수 공식 = 표준화 시킨다음에 곱한다음에 전체 숫자로 나눈다.
# polar_econ -> 두 정당의 양극화 점수를 표준화 해보자.
# scale이라는 함수를 쓰면 된다. 쉽다. 
# 표준화 시키면 대부분 -4 ~ 4의 값이 나옴
# r에서는 cor이라는 함수를 쓰면 상관계수 공식대로 계산한다.
# 개쩌는데?

# 상관계수는 무조건 -1 ~ 1 사이의 값이 나온다.
# +의 가까울 수록 양의 상관관계가 있다.
# 양이라는 것은 평균보다 값이 크다는 것이다.
# 표준화라는것은 평균을 뺀 다음에 표준편차를 나누는 것이기 때문이다.
# x라는 변수가 평균보다 커질 때, y라는 변수도 자기의 평균보다 커지는 것.
# 음의 상관관계는 x라는 변수가 평균보다 커질 때, y라는 변수는 자기의 평균보다 작아지는 것.

# 소득 불평등이 여러 해의 평균보다 높을 때, 정치적 양극화도 평균보다 클 경우가 있을 것이다.

polar_econ_z<-scale(polar_econ)
length(polar_econ)
length(gini$gini) #개수가 33, 67로 다르다.
gini1 <-gini$gini[seq(from=2, to=67, by=2)] #하나씩 건너뛰면서 값을 가져와라. 그럼 33개로 값 동일
gini1 
cor(gini1, polar_econ) # cor(x, y) 하면 계산되지만, 두 변수의 길이가 같아야한다. 값이 같아야 한다.

# 상관계수는 무조건 -1 ~ 1 사이의 값이 나온다.
# 보통 상관계수는 0.7이 넘으면 높다고 판단.



# Q-Q Plot
# 112대 국회의원의 전체 분포를 비교해보고 싶다면?
# 중앙값이 아닌? 이런 경우가 있을 수도 있어.
# 히스토그램을 그려야한다.
# 비교를 한다.
# 가로축과 세로축의 동일한 scale을 사용해야한다.

rep112 <- subset(rep,
              subset=(congress==112))
dem112 <- subset(dem,
              subset=(congress==112))  
  
hist(dem112$dwnom1, freq=F
     , xlim=c(-1.5,1.5), ylim=c(0,1.75)) #freq=f -> densty가 나올 것임, 얼마나 겹치는지
#질량을 부피로 나눈 양 ,,  밀도 = 질량 / 부피?
# 상대적 확률?


hist(rep112$dwnom1, freq=F
     , xlim=c(-1.5,1.5), ylim=c(0,1.75)) # x값과 y값의 범위르 지정 #공화당이 조금더 극단적임
#rug(jitter(rep112$dwnom1))



# Q-Q Plot
# Y변수에서 10%에 위치해 있는  값을 찾는다.
# X Y 값을 모두 찍자. 분위게 따라서
# 두 변수의 분위수의 값이 똑같다고 하면 45도로 표현될것임 그래프에는
# 어느 하나의 분위에서 점을 찍는게 qq plot임
# qqq 플랫에서는 45선이 매우 중요하다
# 45도 선위에서 그려지면 같은 분위에서 y값이 더 크다는 것이다.
# 45도 선위에 qq 점이 그려지면 y축에 있는 변수가 x축에 변수보다 크다는 것을 의미



# 먼저 온게 x축, y축에 오게 된다. 
qqplot(rep112$dwnom2, dem112$dwnom2, # y~x 로 보면 됨 # 틸트를 그리면 값이 안나오고, 콤마 써야함.
       xlim=c(-1.5, 1.5), ylim=c(-1.5, 1.5)) 
abline(a=0, b=1) # a=상수항, b=기울기 == 45선을 그리는 함수식 a는 1차함수 상수항, b는 기우ㄹ기 
table(is.na(rep112$dwnom2))
table(is.na(dem112$dwnom2))




##########################################
# qq plot의 장점 = 분위수의 위치를 알고, 두 분포의 상대적 분산을 비교 가능
# 분산 = 국회의원들이 많은데 분포를 모아서 확인할수 있음. 분산이 적으면 유사한 성향임.
# 그래프의 모양을 보고 어느 그래프의 분산이 큰지 적은지를 확인 가능
# x축의 분산이 y축의 분산보다 크다. 


# R에서 군집화 R에서 행렬
# 행렬과 데이터 프레임은 모두 행과 열로 구성된 직사각형 배열로 유사점이 많다.
# 차이점: 데이터 프레임은 다양한 유형의 변수 를 취할 수 있는 반면, 행렬은 원칙적으로 숫자만 취할 수 있다.
# matrix 함수는 행렬을 만드는 함수
# byrow=T row방향으로 먼저 채워라 
# 규격을 맞춰줘야 한다.

x<-matrix(1:12, nrow=3, ncol=4, byrow=T)
x
rownames(x)<-c  # 축 기준으로 가로 행
colnames(x)<-c("d", "e", "f","g") # 축 기준으로 세로  열
x
x[1,1]
x[1,1:2]

y<-data.frame(y1=c(1,3,5), y2=c(2,4,8), 
              y3=c(0.1, 0.2, 0.3))
y
z<-as.matrix(y)
z
class(z)
colSums(z)
colMeans(z)
rowSums(z)
rowMeans(z)

#apply  함수를 이용하면 
#행렬에서 행 또는 열에 대핸 연산을 할 수 있다. 
apply(z, MARGIN =1 , FUN=median) # 1: 행방향, 2=열방행  # 이 행열에서 중앙값을 계산
apply(z, MARGIN = 2, FUN=median)

#list는 다양한 유형의 객체를 저장 가능
# 회원가입시 이름, 정보 등의 내용을 넣을 수 있음
# 문자와 숫자, 객체를 저장 가능
# 그러나 데이터 프레임은 반드시 길이가 같아야 한다.
# 길이가 다른 숫자나 문자를 벡터로 저장은 가능
# 리스트의 각 요소는 $달러 표시 연산자를 통해 사용 가능

x<-list(y1=1:10, y2=c("hi","hello", "hey"))
x
x$y1
x$y2
x[1]
x[2]

names(x)
length(x)
length(gini)


################33qqplot 보여주고 이게 맞는지 아닌지에 대한 설명을 낼 것임.


