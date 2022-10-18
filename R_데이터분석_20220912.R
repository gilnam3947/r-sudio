########################################
# R 데이터 분석 
# Lecture Note 2 
# 2022-09-12
########################################
setwd("c:/temp100")  # working directory 저장 
world.pop<- c(2525799, 3026033, 3691173, 4449049, 5320817, 6127700,6916183)
world.pop  # numeric vector 

y<- c("firm", "year", "Income", "sales")
y

# logical values : True or FALSE 
z<-c(TRUE, FALSE, TRUE, TRUE)
z

class(y)

# 벡터의 길이
length(world.pop)
pop.first <- c(2525779, 3026003, 3691173)
pop.second<- c(4449049, 5320817, 6127700, 6916183)
pop.all <- c(pop.first, pop.second)  # numeric vector 
pop.all

# indexing : 벡터의 특정 요소를 가져오고자 하는 경우 
# [ ]: square bracket 

world.pop[2]
world.pop[1:2] # 1 ~ 2 
world.pop[c(1,3)]
world.pop[-3]

# Q) 1번과 3번을 제외한 모든 값은?

pop.mil <- world.pop/1000
pop.mil

pop.rate <- world.pop/world.pop[1]
pop.rate

# Q) 인구증가율을 계산해라. 전 시점에 비해서 인구증가율(%)로 계산하라.
growth <- 100*(world.pop[2:7]-world.pop[1:6])/world.pop[1:6]
growth


x<-c(1,3,5,7,9) # numeric vector 
y<-c("firm", "year") # char vector 
analysis1 <-matrix(1:9, nrow=3) # 3 by 3 matrix
analysis1
analysis2 <-data.frame(firm=c("R1", "R2","R3"), 
                       variable=c("C1", "C2", "C3")) # df
analysis2

z <- list(x, y, analysis1, analysis2)
z
class(z)
z[1]

# vector, list, data.frame
WK<-c(4,7,16,12) # length=4
AE<-c(3,5,11,11) # length=4
FL<- c(2,5,12,17)
SP<-c(0,0,4,0) 

exercise1<-data.frame(WK, AE, FL, SP)
exercise1
View(exercise1)

length(world.pop) # numeric vector 
mean(world.pop)
median(world.pop)
min(world.pop)
max(world.pop)
sum(world.pop)/length(world.pop) # 평균을 계산하는 것과 같다. 

year<-seq(from=1950, to=2010, by=10)
year

seq(from=1, to=10, by=2)

world.pop
names(world.pop) <- year
world.pop
names(world.pop)

myf1 <- function(x) {
  out1<-mean(x)
  return(out1)
}
x<-1:10
myf1(x)
x<-1:100
myf1(x)
mean(x)

myf2 <- function(x) {
  s.out<-sum(x)
  l.out<-length(x)
  m.out<-mean(x)
  out<-c(s.out, l.out, m.out)
  names(out) <-c("sum","length","mean")
  return(out)
}

x<-1:10
myf2(x)

# Q) world.pop 벡터에 myf2 함수를 적용하라. 
world.pop
myf2(world.pop)  # x의 역할을 world.pop가 한다. 


setwd("c:/temp100") 
#Unpop.csv 파일을 저장했다. 

Unpop <- read.csv(file="Unpop.csv")
View(Unpop)

names(Unpop) # 변수 이름 
ncol(Unpop) # the number of columns (variables)
nrow(Unpop) # the number of rows (obs)
dim(Unpop)
summary(Unpop) # summary statistics (mean, sd, min, max)

# 1st Quartile(1사분위수): 25% 위치에 있는 값
# 3rd Quartile(3사분위수): 75% 위치에 있는 값 

# R에서 만든 데이터(객체)를 저장하고자 하는 경우: save.image 함수를 사용한다. 
# 저장하면 RData 확장자명을 갖게 된다. 

# Unpop.RData
# R 데이터를 불러오는 방법 
rm(z)
rm(list=ls()) # 모든 객체를 삭제한다. 

load(file="Unpop.RData")

str(UNpop) 
UNpop$year
UNpop$world.pop

UNpop[,1]  # indexing 
UNpop[,2]
UNpop[1,]
UNpop[1:3,1]

UNpop[,"year"]
UNpop[1,"world.pop"]
world.pop1 <- c(UNpop$world.pop, NA)
world.pop1  # 결측치를 가진 벡터이다. 

mean(world.pop1) #평균을 계산하라. 
mean(world.pop1, na.rm=T)
summary(world.pop1)

# 객체 저장: RData 파일로 저장
save.image(file="CH1_1.RData")
load(file="CH1_1.RData")

save(world.pop1, file="CH1_2.RData")
rm(list=ls())
load(file="CH1_2.RData")

load(file="CH1_1.RData")

# data frame -> csv 파일로 내보내고자 하는 경우 
write.csv(UNpop, file="pop1.csv", row.names=F)

# Linting 
# install.packages("lintr")
library(lintr)
lintr("UNpop_error.R")

# Lecture Note 3 
