setwd("~/R/R nhkim/usd_data")
ag = read.csv("alligator.csv")
ag
str(ag)

# 데이터 변환

library(reshape2)
ag = melt(ag, id.vars=1:3)
ag

# 각 호수별 잡힌 악어의 빈도를 구하시오.

library(dplyr)

ag %>% 
  group_by(lake) %>% 
  summarize(value = sum(value))

# 성별 주식의 빈도를 구하시오.

aggregate(value ~ gender + variable , ag, sum)

# 크기별 주식의 빈도를 구하시오.

aggregate(value ~ size + variable , ag, sum)
