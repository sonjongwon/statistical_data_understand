# 파일 리스트 확인

setwd("~/R/R nhkim/ch4")
flist <- list.files()
flist

# scan() 함수:텍스트 파일 읽어서 배열로 저장
# 문자열 입력의 경우 what = "" 옵션 사용

scan1 <- scan(flist[8])
scan1
scan1 <- scan("scan1.txt")
scan1
scan2 <- scan("scan2.txt")
scan2 <- scan("scan2.txt", what = "")
scan2
scan3 <- scan("scan3.txt", what = "")
scan3

# scan() 함수에 입력 값을 안 주면 사용자에게 입력 받겠다는 의미

input <- scan()
input
input2 <- scan(what = "")
input2

# readline() 함수 한 줄 읽어 들이기

input3 <- readline()
input3
input4 <- readline("Are you OK?:")
input4

# readLines() 함수로 파일 읽어 들여서 배열에 담기

input5 <- readLines("scan3.txt")
input5

# read.table() 함수, 텍스트 형태의 파일을 데이터 프레임에 담기
# header = F가 기본값
data1 <- read.table("data_ex.txt")
data1

data1 <- read.table("data_ex.txt", header = T)
data1

data2 <- read.table("data_ex2.txt")
data2

data2 <- read.table("data_ex2.txt", skip = 3) # 텍스트 내에서 실행
data2

data2 <- read.table("data_ex2.txt", nrow = 3)
data2

data2 <- read.table('data_ex2.txt', header = F, skip = 2, nrow = 2)
data2

data3 <- read.table('data_ex3.txt', header = T, sep = ",")
data3

# csv 파일 불러오기, read.csv() 함수
# header = T가 기본값

data3 = read.csv("data_ex.csv")
data3

data4 = read.csv("data_ex2.csv")
data4

varname = c("ID", "SEX", "AGE", "AREA")
data4 = read.csv("data_ex2.csv", header = F, col.names = varname)
data4

data4 = read.csv("data_ex2.csv", stringsAsFactors = T, header = F, col.names = varname, na.strings = "999")
data4
str(data4)

# write.csv() 함수, 데이터를 csv 파일로 저장

write.csv(data4,"d.csv", row.names = F)

#객체의 파일 입출력
# save : 메모리에 있는 객체를 파일에 저장

x = 1:5
y = 6:10
save(x, y, file="xy.RData")

#load : 파일로부터 객체를 메모리로 읽어 들임
load("xy.RData")

rm(list=ls())
a = 1:5
b = 6:10
c = 11:15
save(list=ls(), file="abc.RData")

rm(list=ls())
ls()
load("abc.RData")
a
b
c
