# 기본적으로 R 패키지는 CRAN(http://cran.r-project.org)에서 다운로드

# ggplot2 패키지 설치
install.packages('ggplot2')

# haven 패키지 설치 = stata에서 만들어진 함수가 있는 라이브러리
install.packages("haven") 
library(haven)

# dplyr 패키지 설치
install.packages("dplyr") 
library(dplyr)

# cowsay 패키지 설치
install.packages("cowsay") 
library(cowsay)

#3D 그래프를 그리는 패키지 설치
install.packages("rgl") 
library(rgl)
example(plot3d) #3d 그래프 예제 소환

# ggplot2 불러오기
library(ggplot2)

# ggplot2 함수 사용하기
library(ggplot2)
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point()

# carData 패키지 설치
install.packages("carData") 
library(carData)

library(carData) # 국가별 종교 유므 데이터
head(WVS)
