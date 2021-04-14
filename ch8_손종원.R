# Stack()

x = data.frame(a = c(3, 2, 9),
               b = c(5, 3, 2),
               c = c(4, 5, 7))
x
(x_stacked = stack(x))

# 각 약물별 평균 효과를 구하는 방법
aggregate(values ~ ind, x_stacked, mean)
tapply(x_stacked$values, x_stacked$ind, mean)

# unstack

unstack(x_stacked, values ~ ind)

library(reshape2)
head(french_fries)

# melt()

m = melt(french_fries, id.vars = 1:4)
head(m)

# 요약 통계량 구하기
library(dplyr)
library(doBy)
group_by(m, treatment, variable) %>%
  summarize(mean = mean(value, na.rm = T))

# 다른 함수로도 구해보기
aggregate(value ~ variable + treatment, m , mean, na.rm = T)
tapply(m$value, list(m$treatment, m$variable), mean, na.rm = T)
summaryBy(value ~ treatment + variable, m, na.rm = T)

# 같은 연산을 french_fries 데이터에 대해
group_by(french_fries, treatment) %>%
  summarise(potato = mean(potato, na.rm=T),
            buttery = mean(buttery, na.rm=T),
            grassy = mean(grassy, na.rm=T),
            rancid = mean(rancid, na.rm=T),
            painty = mean(painty, na.rm=T))
aggregate(buttery ~ treatment, french_fries, mean)
tapply(french_fries[,7], french_fries$treatment, mean, na.rm=T)

# NA값 확인 및 제외
french_fries[!complete.cases(french_fries),]
m = melt(french_fries, id.vars = 1:4, na.rm = T)
head(m)

# cast()
m = melt(french_fries, id.vars = 1:4)
r = dcast(m, time + treatment + subject + rep ~ ...)
rownames(r) = NULL
rownames(french_fries) = NULL
identical(r, french_fries)

m = melt(french_fries, id.vars = 1:4)
dcast(m, time ~ variable)
dcast(m, time ~ variable, mean, na.rm = T)
dcast(m, time ~ treatment+ variable, mean, na.rm = T)
