# Data Handling: Matrix & Array

# 방식 1: 원소의 값을 모두 주고 행과 열의 수를 지정(열 우선)

A = matrix(1:15, nrow = 5, ncol = 3)
A

# 방식 2: 원소의 값을 모두 주고 행 지정 옵션 사용(행 우선)

B = matrix(1:15, nrow = 5, byrow = T)
B

# 방식 3: 빈 행렬 생성 뒤 각 원소의 값을 입력

c = matrix(nrow = 2, ncol = 2)
c[1, 1] = 1
c[1, 2] = 2
c[2, 1] = 3
c[2, 2] = 4
c

# 행렬의 연산

A = matrix(1:4, nrow = 2, ncol = 2)
B = matrix(seq(2, 8, 2), nrow = 2, ncol = 2)
A
B
A * B # 행렬 원소간 곱셈
A %*% B # 행렬간 곱셈
A*3 # 행렬 * 상수
A + B # 행렬간 합

C = matrix(1:15, nrow = 5, ncol = 3)
C
C[3, 2]
C[2, ]
C[, 3]
C[2:4, 2:3]
C[-1, ]
C[1, ] <- c(10, 11, 12)
C
C[3, ] > 5
C[, C[3,] > 5]

# 행렬의 행과 열 추가/변경/제거

A <- matrix(c(1:6), nrow = 3, ncol = 2)
A
B <- matrix(c(11:16), nrow = 3, ncol = 2)
B
rbind(A, B)
cbind(A, B)
cbind(A[, 1], B[, 2])

# 의도하지 않은 차원 축소 피하기
A <- matrix(c(1:6), nrow = 3, ncol = 2)
A

B <- A[1, ]
B
attributes(A)
attributes(B) # 왜 이렇게 되는지 생각해보기
C <- A[1, , drop = F]
C
attributes(C)
D <- as.matrix(C)
D
attributes(D)

# 고차원 배열

A <- matrix(c(1:15), nrow = 5, ncol = 3)
B <- matrix(c(11:25), nrow = 5, ncol = 3)
A
B
C <- array(data = c(A, B), dim = c(3, 2, 2))
C

# Data Handling: List


# 리스트 생성하기

A <- list(name = "Kang", salary = 10000, union = T)
A
A$name
B <- list('Kang', 10000, T)
B
B[[1]]
C <- vector(mode = "list")
C[["name"]] = "Kang"
C[["salary"]] = 10000
C[["union"]] = T
C

# 리스트 연산

C$name
C$salary
C$union
C1 <- C[[1]]
class(C1)
C1
C2 <- C[1]
class(C2)
C2
C$office <- "frontier"
C
C$salary <- NULL
C

# 리스트 연산

tmplist <- list(a = list(1:5, c("a","b","c")), b = "z", c = "NA")
tmplist
unlist(tmplist)
unlist(tmplist, use.name = F)

# Data Handling: Data Frame


# 데이터 프레임 생성 및 접근

kids <- c("Jack", "Jill")
ages <- c(12, 10)
d <- data.frame(kids, ages, stringsAsFactors = FALSE)
d
d[[1]]
class(d[[1]])
d$kids
class(d$kids)
d[, 1]
class(d[, 1])
d[1]
class(d[1])

# 부분 데이터 프레임 추출 및 필터링

setwd("~/R/R nhkim")
Exam <-read.csv("Exam.csv", header = T)
Exam
Exam[2:5,]
Exam[2:5, 2]
Exam[2:5, 2, drop = F]
Exam[Exam$Exam1 > 3, ]

# 데이터 프레임 결합

dfA <- rbind(d, list("Laura", 19))
dfA


# Factor

x <- c(5, 12, 13, 12)
xf <- factor(x)
xf
str(xf)
unclass(xf)
length(xf)
xff <- factor(x, levels = c(5, 12, 13 ,88))
xff
xff[2] <- 88
xff
xff[2]<- 20
xff


# Text Processing


# 문자열의 길이 알아내기

S <- "Welcome to Statistical Data Analysis!"
length(S)
nchar(S)

# 문자열 연결하기

S1 <- "My name is"
S2 <- "Jongwon son"
paste(S1, S2)
paste(S1, S2, sep = "-")
paste(S1, S2, sep = "")
paste("The value of log10 is", log(10))
S1 <- c("My name is", "Your name is")
S2 <- c("Jongwon")
S3 <- c("Jongwon", "Haewoong", "Sanghoon")
paste(S1, S2)
paste(S1, S3)
people <- c("Dongchan", "Yoonsu", "Sejin")
paste(people, "loves", "R.")
paste(people, "loves", "R", collapse = ", and ")

# 하위 문자열 추출하기

substr("Data Science", 1, 4)
substr("Data Science", 6, 10)
people <- c("Chanheok", "Junheok")
substr(people, 1, 3)
cities <- c("New York, NY", "Los Angeles, CA", "Peoria ,IL")
substr(cities, nchar(cities)-1, nchar(cities))

# 구분자로 문자열 분할하기

path <- "C:/home/mike/data/trials.csv"
strsplit(path, "/")
path <- c("C:/home/mike/data/trials.csv",
"C:/home/mike/data/errors2.txt",
"C:/home/mike/data/report3.doc")          
strsplit(path, "/")

# 하위 문자열 대체하기

tmpstring <- "Kim is stupid and Kang is stupid too."
sub("stupid", "smart", tmpstring)
gsub("stupid", "smart", tmpstring)

# 문자열에서 주어진 패턴 일치 여부 확인하기

grep("mike", path)
grep("errors", path)


# 타입 판별과 변환


# 타입 판별

str(c(1, 2))
str(matrix(c(1, 2)))
str(list(c(1, 2)))
str(data.frame(x = c(1, 2)))
is.factor(factor(c("m", "f")))
is.numeric(1:5)
is.character(c("a", "b"))

# 타입 변환
x <- c("a", "b", "c")
as.factor(x)
as.character(as.factor(x))
x <- matrix(1:9, ncol = 3)
as.data.frame(x)
(x <- data.frame(matrix(c(1, 2, 3, 4), ncol = 2)))
data.frame(list(x = c(1, 2), y = c(3, 4)))