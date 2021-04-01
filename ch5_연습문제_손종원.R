# 두 파일을 불러와 하나의 dust 데이터 프레임으로 저장한 후
# finedust 변수의 기초통계량을 구하시오.

dust1 = read.csv("dust.csv", stringsAsFactors = T)
dust1
dust2 = read.csv("dust09.csv", stringsAsFactors = T)
dust2
library(doBy)

dust = rbind(dust1, dust2)
dust = dust[!(dust$area == "평균"), ]
dust = na.omit(dust)
dust

summary(dust$finedust)

# 각 지역구별 평균 미세먼지 지수를 구하시오.

tapply(dust$finedust, dust$area, mean)
summaryBy(finedust ~ area, dust)

# 각 월별 평균 미세먼지 지수를 구하시오.

tapply(dust$finedust, dust$month, mean)
summaryBy(finedust ~ month, dust)

# 각 지역구별 월별 평균 미세먼지 지수를 구하시오.

tapply(dust$finedust, list(dust$area, dust$month), mean)
summaryBy(finedust ~ month | area, dust)


# 각 지역구별 미세먼지 지수가 작은 날짜순으로 정렬하시오.

orderBy(~ area + finedust, dust)
dust[order(dust$area, dust$finedust),]

# 각 지역구별 미세먼지 지수가 큰 날짜순으로 정렬하시오.

orderBy(~ area - finedust, dust)
dust[order(dust$area, dust$finedust, decreasing = T),]
