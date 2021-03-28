# iris data

head(iris)
str(iris)
library(help = datasets)

# rbind(): 지정된 데이터들을 행으로 취급해 병합

rbind(c(1, 2, 3), c(4, 5, 6))
(x = data.frame(id = c(1, 2), name = c("a", "b")))
str(x)
(y = rbind(x, c(3, "c")))

# cbind(): 지정된 데이터들을 컬럼으로 취급해 병합

cbind(c(1, 2, 3), c(4, 5, 6))
# 데이터 프레임에 변수 추가 방법 1
y = cbind(x, greek = c("alpha", "beta"))
y
str(y)
# 데이터 프레임에 변수 추가 방법 2
x$greek = c("alpha", "beta")
x

# transform() 함수 이용하여 변수 추가

head(transform(iris, Log.Sepal.Length = log(Sepal.Length)))

# transform() 함수 이용하여 변수 변경
head(transform(iris, Sepal.Length = -Sepal.Length))

# apply
sum(1:10)
d = matrix(1:9, ncol = 3)
d
apply(d, 1, sum)
apply(d, 2, sum)
apply(iris[, 1:4], 2, sum)

colSums(iris[, 1:4])

# lapply

(result = lapply(1:3, function(x) {x*2}))
unlist(result)
(x = list(a = 1:3, b= 4:6))
lapply(x, mean)
lapply(iris[, 1:4], mean)

d = as.data.frame(matrix(unlist(lapply(iris[, 1:4], mean)),
                                ncol = 4, byrow = T))
names(d) = names(iris[, 1:4])
d

data.frame(do.call(cbind, lapply(iris[, 1:4], mean)))

# sapply
lapply(iris[, 1:4], mean)
sapply(iris[, 1:4], mean)
class(sapply(iris[, 1:4], mean))

x = sapply(iris[, 1:4], mean)
as.data.frame(x)
as.data.frame(t(x))

sapply(iris, class)

y = sapply(iris[, 1:4], function(x) {x > 3})
class(y)
head(y)

y = apply(iris[, 1:4], 2, function(x) {x > 3})
class(y)
head(y)

y = lapply(iris[, 1:4], function(x) {x > 3})
class(y)
head(y)

# tapply
tapply(1:10, rep(1,10), sum)
tapply(1:10, 1:10 %% 2 == 1, sum)
iris
tapply(iris$Sepal.Length, iris$Species, mean)
m = matrix(1:8, ncol =2,
           dimnames = list(c("spring", "summer",
                             "fall", "winter"),
                           c("male", "female")))
m
