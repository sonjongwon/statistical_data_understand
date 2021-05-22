# Practice 1

v1 <- c(100, 120, 140, 160, 180)
v2 <- c(120, 130, 150, 140, 170)
v3 <- c(140, 170, 120, 110, 160)
qty <- data.frame(banana = v1, cherry = v2, orange= v3)

x11()
barplot(as.matrix(qty), beside = T, 
        names = c("banana", "cherry", "orange"), col = c('red','yellow','green','blue','purple'),
        ylim = c(0, 400), main = "QTY", legend = c(c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')))

# Practice 2

library(MASS)
data("Boston")

x11(); par(mfrow=c(1,2))
plot(Boston$medv, Boston$crim, col = 'red', pch = '+', xlab = 'median value',
     ylab = 'crime rate', main = 'crime rate')
plot(Boston$medv, Boston$rm, col = 'blue', pch = 2, xlab = 'median value',
     ylab = 'number of rooms', main = 'number of rooms')

# Practice 3-1, BostonHousing 자료의 모든 변수들에 대하여 산점도 행렬을 그리시오.

library(mlbench)

data("BostonHousing")
str(BostonHousing)

x11(); plot(BostonHousing)

# Practice 3-2, BostonHousing 자료에서 medv값을 3등분하였을 때 각 그룹간의 범죄율(crim)
#변수에 대한 상자 그림을 그리시오.

x11(); par(mfrow=c(1,1))

medv_3 <- cut(BostonHousing$medv, breaks = 3)
boxplot(crim ~ medv_3 , data = BostonHousing)

# Practice 3-3, BostonHousing 자료에서 medv값에 대하여 밀도에 대한 히스토그램과
#커널밀도함수를 그리고(파란실선), medv와 같은 평균과 표준편차를 가지는
#정규분포의 밀도함수(초록실선)를 그 위에 추가로 그리시오.
#그리고 그 위에 medv값의 평균을 빨간 대시선으로 추가하시오. 각 선에 대한 범례도 추가하시오.


x <- BostonHousing$medv
m <- mean(x)
s <- sd(x)

x11()
hist(x, freq = F)
lines(density(x), col = 'blue')
curve(dnorm(x, m, s), add = T, col = "green")
abline(v = m, col = 'red', lty = 'dashed')
legend('topright', legend = c('Kernel', 'normal distribution', 'mean_medv'),
       lty = c(1, 1, 3), col = c('blue', 'green','red'))

# Practice 3-4, BostonHousing 자료에서 medv값을 10등분 하였을 때
#각 그룹의 비율을 파이그림으로 나타내시오.

x11()
pie(table(cut(x, breaks = 10)))

