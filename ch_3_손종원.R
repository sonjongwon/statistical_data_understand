## R 출력방식


# print() 함수 사용

print("Statistical Data analysis")
a <- "Hello!"
print(a)
b <- 13.5
print(b)
print(a, b)
print(a, "b")

# cat() 함수 사용

cat(a, b)
cat(a, '\n', b)

# sprintf() 사용
name <- "John"; age <- 17
print(sprintf("%s is %d years old", name, age))
ft <- 30.48; x <- 5
print(sprintf("%.2f ft is %.2f cm", x, x*ft))
cat(x, "ft is", x*ft, "cm")
print(paste(x, "ft is", x*ft, "cm"))

# 흐름제어(조건문과 반복문)

r <- 1
if (r == 4) {
  print("The values of r is 4")
} else {
  print("The values of r is not 4")
}
 carbon <- c(10, 12, 15, 19, 20)
 if (mean(carbon) > median(carbon)) {
   print("Mean > Median")
 } else {
   print("Median >= Mean")
 }
 
x <- 1:10
y <- ifelse(x %% 2 == 0, "even", "odd") 
y

n <- c(5, 10, 15)
for (i in n) {
  print(i^2)
}

i <- 1
while ( i <= 10) {
  i <- i + 4
  print(i)
}

# 짝수만 출력
i <- 0
while (i <= 9) {
  i <- i + 1
  if (i %% 2 != 0){
    next # print(i)를 실행하지 않고 while문의 처음으로 감
  }
  print(i)
}

i <- 1
repeat {
  i <- i + 4
  print(i)
  if ( i > 10) break
}

## 연산


#수치연산

1:5 * 2 + 1

#벡터 연산

x <- c(1, 2, 3, 4, 5)
x + 1
x + x
x == x
x == c(1, 2, 3, 5, 5)
c(T, T, T) & c(T, F, T)
sum(x)
mean(x)
median(x)
(d <- data.frame(x = c(1, 2, 3, 4, 5), y = c("a", "b", "c", "d", "e")))
d[d$x %% 2 == 0, ]

# NA 처리

NA & TRUE
NA + 1
sum(c(1, 2, 3, NA))
sum(c(1, 2, 3, NA), na.rm = T)
(x <- data.frame(a = c(1, 2, 3), b = c("a", NA, "c"), c = c("a", "b", NA)))
na.fail(x)  # NA 포함되어 있으므로 실패
na.omit(x)  # NA가 포함되어 있는 행을 지움
na.exclude(x)  # NA가 포함되어 있는 행을 지움
na.pass(x)  # NA가 포함되어 있어도 상관 x

## 함수: 구문


# 함수 작성하기

mean_and_sd1 <- function(x) {
  av <- mean(x)
  sdev <- sd(x)
  c(MEAN = av, SD = sdev)
}

distance <- c(148, 182, 173, 166, 109, 141, 166)
mean_and_sd1(distance)

mean_and_sd2 <- function(x) {
  av <- mean(x)
  sdev <- sd(x)
  c(MEAN = av, SD = sdev)
  return(av)
}

distance <- c(148, 182, 173, 166, 109, 141, 166)
mean_and_sd2(distance)

mean_and_sd3 <- function(x = rnorm(10)) {
  av <- mean(x)
  sdev <- sd(x)
  c(MEAN = av, SD = sdev)
}

mean_and_sd3()
mean_and_sd3(distance)

# Function arguments
addTheLog <- function(first, second) {first + log(second)}
# Exact names
addTheLog(second = exp(4), first =1)
# Partially matching names
addTheLog(s = exp(4), first = 1)
# Argument order
addTheLog(1, exp(4))

## 함수: 특징


# 함수는 객체다!

args(abline)
f1 <- function(a, b) return(a + b)
f2 <- function(a, b) return(a - b)
g <- function(h, x, y) h(x, y)
g(f1, 5, 2)
g(f2, 5, 2)

# Anonymous(익명의) Function
apply_to_three <- function(f) {f(3)}
apply_to_three(function(x) {x*7})
a <- c(1, 2, 3, 4, 5)
# sapply()는 어떤 리스트 객체에 동일한 함수를 실행할 수 있게 해주는 함수
sapply(a, function(x) {x + 1})

# 함수의 지역변수

w <- 12
f <- function(y) {
  d <- 8
  w <- w + 1
  y <- y - 2
  print(w)
  h <- function() return(d*(w + y))
  return(h())
}
t <- 4
f(t)

# scope
n <- 1  # 전역변수
f <- function() {
  print(n)
}
f()

n <-2
f()

n <- 100  # 전역변수
f <- function() {
  n <- 1  # 지역변수
  print(n)
}
f()

rm(list=ls())  # 메모리에 있는 모든 객체 삭제
f <- function() {
  print(n)
}
f()
# 함수 내부에 정의한 변수는
# 함수바깥, 전역에 접근할 수 없음
rm(list=ls())
f <- function() {
  n <- 1  # 지역변수
  print(n)
}
f()
n
# 함수 안의 변수가 전역변수보다 우선
n <- 100
f <- function(n) {
  print(n)
}
f(1)
# 중첩함수에서도 같은 규칙 허용
f <- function(x) {
  a <- 2
  g <- function(y){
    print(y + a)
  }
  g(x)
}
f(1)

a <- 100  # 전역변수
f <- function(x) {
  g <- function(y) {
    print(y + a)
    
  }
  g(x)
}
f(1)
# Note) 함수 f마저도 변수 a를 포함하고 있지 않다면 전역변수 a를 사용

f <- function(){
  a <- 1  # 함수 f() 지역변수
  g <- function() {
    a <-2  # 함수 g() 지역변수
    print(a)
  }
  g()
  print(a)
}
f()

b <- 0
f <- function() {
  a <- 1
  g <- function(){
    a <<- 2
    b <<- 2
    print(a)
    print(b)
  }
  g()
  print(a)
  print(b)
}
f()
# Note) <<-: 함수 외부나 전역변수에 값을 할당
