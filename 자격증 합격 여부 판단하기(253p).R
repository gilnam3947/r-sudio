# 자격증 합격 여부 판단하기
# 한국데이터산업진흥원에서는 데이터 분석가 양성을 위해 ADsP 시험을
# 시행하고 있습니다.
# 데이터의 이해 20점, 데이터 분석 기획 20점, 데이터 분석 60점으로 점수 구성
# 각 과목별 40% 이상 취득하고, 총점이 60점 이상이면 합격
# 응시자 10명이 주어졌을 때 각 응시자의 합격 여부를 판단하는 프로그램

sub1 <- c(14, 16, 12, 20, 8, 6, 12,18, 16, 10) #1과목
sub2 <- c(18, 14, 14, 16, 10, 12, 10, 20, 14, 14) #2과목
sub3 <- c(44, 38, 30, 48, 42, 50, 36, 52, 54, 32) #3과목
score <- data.frame(sub1, sub2, sub3) 

total <- apply(score, 1, sum) #apply는 기본적으로 행렬
# 이나 데이터프레임에 대하여 행별 또는 열별 함수를 적용 시켜주는 함수
scoreset <- cbind(score, total) # column bind의 약자로 데이터 결합 함수

result <- c() # 응시자의 합격 여부를 저장할 변수 result를 선언하고 초기화 합니다.

#nrow 행의 개수를 샘 (1개)
for(i in 1:nrow(scoreset)) {
  if(scoreset[i,1]<20*0.4 | scoreset[i,2]<20*0.4|scoreset[i,3]<60*0.4){
    result[i] <- '불합격' #1차적으로 과락 여부 판단
  }else if(scoreset[i,4]>=60) {
    result[i] <- '합격'
  }else if(scoreset[i,4]<60){
    result[i] <- '불합격'
  }
  cat(i, '번째 응시생은', result[i],'입니다.\n')
}