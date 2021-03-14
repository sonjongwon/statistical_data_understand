# Practice 1

m1 <- matrix(1:5, nrow =3, ncol = 5, byrow = T)
m1

# Practice 2

m2 <-matrix(seq(2, 10, 2), nrow =5, ncol = 3)
m2
 
# Practice 3

setwd("~/R/R nhkim")
Exam <- read.csv("Exam.csv", header = T)
e2 <- Exam[Exam$Quiz >= 3.5, 2]
e2
class(e2)

# Practice 4

name <- c("Lee Nayoung", "Song Hyekyo", "Jun Jihyun", "Kim Taehee")
name1 <- strsplit(name, " ")
name2<-unlist(name1)
fname <- name2[seq(1, length(name2), 2)]
fname
sname <- name2[seq(2, length(name2), 2)]
sname

# for문으로 만들어보기
