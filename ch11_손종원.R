# plot()

methods("plot")

# mlbench 패키지

install.packages("mlbench")
library(mlbench)
library(help="mlbench")
data(Ozone)
str(Ozone)
help(Ozone)

# Ozone 데이터 산점도

plot(Ozone$V8, Ozone$V9)

# 축이름(xlab, ylab)

plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature")

# 그래프 제목(main)

plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature",
     main = "Ozone")

# 점의 종류(pch)

plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature",
     main = "Ozone", pch=20)
plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature",
     main = "Ozone", pch="+")

example(points)

# 점의 크기(cex)

plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature",
     main = "Ozone", cex=.1)

# 색상(col)

plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature",
     main = "Ozone", col="#FF0000") # RGB 값
plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature",
     main = "Ozone", col="red")

# 좌표축 값의 범위(xlim, ylim)

main(Ozone$V8, na.rm=T)
apply(Ozone, 2 ,min, na.rm=T)
summary(Ozone)

plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature",
     main = "Ozone",
     xlim=c(0,100), ylim=c(0,90))

# cars 데이터

data(cars)
str(cars)
help(cars)
plot(cars)
plot(cars, type="l")
plot(cars, type="b")
plot(cars, type="o")

plot(tapply(cars$dist, cars$speed, mean), type="o",
     cex=0.5, xlab = "speed", ylab = "dist")

# 선 유형(lty)

plot(cars, type="l", lty="dashed")

# 그래프의 배열

opar <- par(mfrow=c(1,2))  # 이전에 저장된 par 설정이 반환
plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature",
     main = "Ozone")
plot(Ozone$V8, Ozone$V9,
     xlab="Sandburg Temperature",
     ylab="E1 Mpnte Temperature",
     main = "Ozone2")
par(opar)  # 이전 설정으로 되돌림


# 지터

head(Ozone[,c("V6","V7")])
plot(Ozone$V6, Ozone$V7,
     xlab="Windspeed", ylab="Humidity",
     main="Ozone", pch=20, cex=0.5)
plot(jitter(Ozone$V6), jitter(Ozone$V7),
     xlab="Windspeed", ylab="Humidity",
     main="Ozone", pch=20, cex=0.5)

# 기본 그래프(점(points))

plot(iris$Sepal.Width, iris$Sepal.Length,
      cex=.5, xlab="width", ylab="length",
      main="iris")
points(iris$Petal.Width, iris$Petal.Length,
       cex=.5, pch="+", col="#FF0000")

with(iris, {
  plot(NULL, xlim = c(0, 5), ylim = c(0, 10),
       xlab = "width", ylab = "length", main = "iris", type = "n")
points(Sepal.Width, Sepal.Length, cex=.5, pch=20)
points(Petal.Width, Petal.Length, cex=.5, pch="+",
       col="#FF0000")
})

# 기본 그래프(꺾은선(lines))

x <- seq(0, 2*pi, 0.1)
y <- sin(x)
plot(x, y, cex=.5, col="red")
lines(x, y)

plot(cars)
lines(lowess(cars))

# 기본 그래프(직선(abline))

plot(cars, xlim=c(0, 25))
abline(a = -5, b = 3.5, col="red")
abline(h = mean(cars$dist), lty=2)
abline(v = mean(cars$speed), lty=2)

# 기본 그래프(곡선(curve))

curve(sin, 0, 2*pi)

# 기본 그래프(다각형(polygon))

(m <- lm(dist ~ speed, dat = cars))
plot(cars)
abline(m)

p<- predict(m, interval = "confidence")
head(p)

x <- c(cars$speed, tail(cars$speed, 1),
       rev(cars$speed),
       cars$spee[1])
y <- c(p[, "lwr"],
       tail(p[, "upr"],1),
       rev(p[, "upr"]),
       p[, "lwr"][1])
polygon(x, y, col=rgb(.7, .7, .7, .5))

# text() 함수

plot(4:6, 4:6)  # (4, 4), (5, 5), (6, 6) 좌표에 점
text(5, 5, "X")  # (5, 5) 좌표에 X문자열 표시
text(5, 5, "00", adj = c(0, 0))
text(5, 5, "01", adj = c(0, 1))
text(5, 5, "10", adj = c(1, 0))
text(5, 5, "11", adj = c(1, 1))
plot(cars, cex=.5)
text(cars$speed, cars$dist, pos = 4)  #  우측에 데이터 번호 표시

# 데이터 식별(identify)

x11(); plot(cars, cex=.5)
identify(cars$speed, cars$dist)

# 범례(legend)

x11()
plot(iris$Sepal.Width, iris$Sepal.Length,
     pch=20, xlab = "width", ylab = "length")
points(iris$Sepal.Width, iris$Sepal.Length,
     pch="+", col="#FF0000")
legend("topright", legend = c("Sepal", "Petal"), pch=c(20, 43),
       col = c("black", "red"), bg = "gray")

# matplot(), matlines(), matpoints() 함수

(x <- seq(-2*pi, 2*pi, 0.01))  # [-2*pi, 2*pi] 구간의 점들
(y <- matrix(c(cos(x), sin(x)), ncol = 2))  # cos(x), sin(x)를 저장한 행렬

matplot(x, y, lty = c("solid", "dashed"), cex = .2, type="l")
abline(h = 0, v = 0)

# 상자 그림(boxplot)

boxplot(iris$Sepal.Width)

(boxstats <- boxplot(iris$Sepal.Width))

boxstats <- boxplot(iris$Sepal.Width, horizontal = T)
text(boxstats$out, rep(1, NROW(boxstats$out)),
     labels = boxstats$out, pos = c(1, 1, 3, 1))

sv <- subset(iris, Species == "setosa" | Species == "versicolor")
sv$Species <- factor(sv$Species)
boxplot(Sepal.Width ~ Species, data = sv, notch = T)

# 히스토그램(hist)

hist(iris$Sepal.Width)
hist(iris$Sepal.Width, freq = F)

(x <- hist(iris$Sepal.Width, freq = F))
sum(x$density) * 0.2

# 밀도 그림(density)

plot(density(iris$Sepal.Width))
hist(iris$Sepal.Width, freq = F)
lines(density(iris$Sepal.Width))
plot(density(iris$Sepal.Width))
rug(jitter(iris$Sepal.Width))

# 막대 그래프(barplot)

barplot(tapply(iris$Sepal.Width, iris$Species, mean))
barplot(tapply(iris$Sepal.Width, iris$Species, mean), horiz = T)
(x <- matrix(c(5, 4, 3, 2), 2, 2))
barplot(x, beside = T, names = c(5, 3), col = c("green", "yellow"))
(x <- matrix(c(5, 4, 3, 2), 2, 2))
barplot(x, names = c(5, 3), col = c("green", "yellow"))

# 파이 그래프(pie)

cut(1:10, breaks = c(0, 5, 10))
cut(1:10, breaks = 3)
cut(iris$Sepal.Width, breaks = 10)
rep(c("a", "b", "c"), 1:3)
table(rep(c("a", "b", "c"), 1:3))

table(cut(iris$Sepal.Width, breaks = 10))
pie(table(cut(iris$Sepal.Width, breaks = 10)))

# 모자이크 플롯(mosaicplot)

data(Titanic)
str(Titanic)
Titanic
mosaicplot(Titanic, color = T)
mosaicplot(~ Class + Survived, data = Titanic, color = T, cex = 1.2)

# 산점도 행렬(pairs)

pairs(~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length, data = iris,
      pch = c(1, 2, 3)[iris$Species])

# 투시도(persp), 등고선 그래프(contour)

outer(1:5, 1:3, "+")
outer(1:5, 1:3, function(x, y){x + y})

library(mvtnorm)
dmvnorm(c(0, 0), rep(0, 2), diag(2))

x <- seq(-3, 3, .1)
y <- x
outer(x, y, function(x, y){dmvnorm(cbind(x, y))})

x <- seq(-3, 3, .1)
y <- x
f <- function(x, y){dmvnorm(cbind(x, y))}
persp(x, y, outer(x, y, f), theta = 30, phi = 30)
contour(x, y, outer(x, y, f))
