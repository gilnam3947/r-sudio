#################################
# R 데이터 분석 
# Lecture Note 3 & 4  
# 2022-09-19
###################################
setwd("c:/temp100")
resume <- read.csv(file="resume.csv")

dim(resume)[1]
head(resume, n=10)
tail(resume)
resume[2,4]

# summary statistics 계산하기
summary(resume)

# two-way frequency table : race and call  
# one-way freq table
table(resume$race)
table1<-table(resume$race, resume$call)

addmargins(table1)
prop.table(table1, margin=1)

table(resume$firstname)
nrow(resume)
table1[1,2]
table1[2,2]
sum(table1[,2])

mean(resume$call)
resumeB <- resume[resume$race=="black",] 
resumeW <- resume[resume$race=="white",] 
# 백인의 회신율 
mean(resumeW$call)
mean(resumeB$call)

class(TRUE)
class(FALSE)

as.integer(TRUE)
as.integer(FALSE)

x<-c(TRUE, FALSE, TRUE)
mean(x)
sum(x)

resume[1,4]
resume$race[4]
(resume$race=="black")[1:5]

# 데이터의 일부분을 가져오기 
# subset 명령어를 활용하자. 

resumeB1 <- subset(resume, subset=(race=="black"))
#resumeW1 <- subset()

resume$BF <- ifelse(resume$race=="black" 
                    & resume$sex=="female", 1, 0 )
table(resume$BF)

# three-way table 
table(resume$race, resume$sex, resume$BF)

resume$race1 <- as.factor(resume$race)
str(resume)
levels(resume$race1)
table(resume$race1)

# tapply 함수
tapply(resume$call, INDEX=resume$race, FUN=mean)

# firstname을 factor variable로 변환한다. 

# call 변수의 평균을 firstname 별로 계산한다. 

# 회신율이 가장 높은 이름은?
name1<-tapply(resume$call, INDEX=resume$firstname, FUN=mean)
sort(name1, decreasing=T)
sort(name1, decreasing=F)

