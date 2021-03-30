dust = read.csv("dust.csv")
dust = dust[!(dust$area == "평균"),]
dust
dust_09 = read.csv("dust09.csv")
dust_09 = dust_09[!(dust_09$area == "평균"),]
dust_09
library(doBy)

# 두 파일을 불러와 하나의 dust 데이터 프레임으로 저장한 후
# finedust 변수의 기초통계량을 구하시오.

dust_dataframe = rbind(dust_09, dust)
dust_dataframe

summary(dust_dataframe$finedust)

# 각 지열구별 평균 미세먼지 지수를 구하시오.

summaryBy(finedust ~ area , na.rm = T, dust_dataframe)

# 각 월별 평균 미세먼지 지수를 구하시오.
summaryBy(finedust ~ month, na.rm = T, dust_dataframe)

# 각 지역구별 월별 평균 미세먼지 지수를 구하시오.

summaryBy(finedust ~ area|month, na.rm = T, dust_dataframe)

# 각 지역구별 미세먼지 지수가 작은 날짜순으로 정렬하시오.

dust[order(dust$area, dust$finedust),]

# 각 지역구별 미세먼지 지수가 큰 날짜순으로 정렬하시오.

dust[order(dust$area,dust$finedust,decreasing = T),]
