library(googleVis)
Fruits
library(doBy)

# 연도별 판매된 수량의 총합
tapply(Fruits$Sales ,Fruits$Year, sum)

# Fruit별로 판매된 수량의 총합
tapply(Fruits$Sales, Fruits$Fruit, sum)

# Fruit별 최대 판매량
tapply(Fruits$Sales, Fruits$Fruit, max)

# 연도별 가장 많이 팔린 과일과 판매량
year_max = aggregate(Sales ~ Year, Fruits, max)
merge(year_max, Fruits)[, 1:3]

# Fruits 데이터를 연도별 과일별로 정렬하여 Fruits_sort로 저장하라
Fruits_sort = Fruits[order(Fruits$Year, Fruits$Fruit),]
Fruits_sort

# Fruits 데이터를 과일별로 분리하여 Fruits_list 리스트로 저장하라
Fruits_list = split(Fruits, Fruits$Fruit)
Fruits_list
