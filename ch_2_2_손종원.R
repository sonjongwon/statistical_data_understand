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
s <- "Welcome to Statistical Data Analysis!"
length(s)
nchar(s)

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
cities <- c("New York, NY", "Los Angeles, CA", "Peoria, IL")
substr(cities, nchar(cities)-1, nchar(cities))
