# 숫자
a <- 3
b <- 4.5
c <- a+b
print(c)
c

# NA
one <- 80
two <- 90
three <- 75
four <- NA
mean(c(one, two, three, four))
mean(c(one, two, three, four), na.rm = T)

# NA 값의 확인
is.na(three)
is.na(four)

# NULL
x <- NULL
is.null(x)
is.null(1)
is.null(NA)
is.na(NULL)  # logical(0)이라고 나오는 이유는 자료형이 논리형이긴 한데 들어 있는 원소가 없다는 뜻

# 문자열
a <- "hello"
print(a)
a <- 'hello'
print(a)
nchar("hello")  # 문자열의 길이를 보여줌

# 진릿값
TRUE & TRUE
TRUE & FALSE
TRUE | TRUE
TRUE | FALSE
!TRUE
!FALSE
c(TRUE, TRUE) & c(TRUE, FALSE)
c(TRUE, TRUE) && c(TRUE, FALSE)  # 처음 요소만 연산하기 때문에 TRUE 값이 나옴
# &&연산은 갯수가 달라도 처음 요소만 연산하기 때문에 관계x

# Assign values to the vector A & B
A <- c(1, 2, 3)
B <- c(1, "A", 0.5)

# Check the mode
mode(A)
mode(B)

# Select a subset of vector
A[1]
A[2:3]
A[c(2, 3)]
A[-2]
A[-length(A)]

# Assign names
names(A)
names(A) <- c("First", "Second", "Third")

# Call by index or name
A[1]
A["First"]

# Example of a list
list_a <- list(1, 2, "a")
print(list_a)
list_a[[1]]
list_a[c(1, 2)]
names(list_a)
names(list_a) <- c("First", "Second", "Third")
list_a
list_a[["First"]]
list_a$First
(list_b <- list(name = "foo", height = 70))
(list_c <- list(name = "foo", height = c(1, 3, 5)))

# 중첩리스트
list(a = list(val = c(1, 2, 3)), b = list(val = c(1, 2, 3, 4)))

# matrix
matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3)
matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol = 3)
matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = TRUE)
matrix(1:9, nrow = 3, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3")))
(x <- matrix(1:9, ncol =3))
dimnames(x) = list(c("r1", "r2", "r3"), c("c1", "c2", "c3"))
x
(x <- matrix(1:9, ncol =3))
rownames(x) <- c("r1", "r2", "r3")
x
colnames(x) <- c("c1", "c2", "c3")
x

# 행렬 인덱싱
x[2, 3]
x[1:2,]
x[-3,]
x[c(1, 3), c(1, 3)]
x["r1", "c3"]

# 벡터, 리스트를 행렬로 변환
B <- list(1, 2, 3, 4, 5, 6)
dim(B)
dim(B) <- c(2, 3)
print(B)

# array 다차원 데이터
(x <- array(1:12, dim = c(2, 2, 3)))
x[,,3]
x[1, 1, 1]
x[1, 2, 3]
dim(x)
D <- 1:12
dim(D) <- c(2,3,2)
print(D)

# Example of a factor
A <- c("Cho", "Kim", "Kang")
B <- as.factor(A)
print(A)
print(B)
mode(A)
mode(B)
sex <- factor("m", c("m","f"))
sex
nlevels(sex)
levels(sex)  # 벡터값 반환
levels(sex) <- c("male", "female")
sex
factor(c("m", "m", "f"), c("m", "f"))
factor(c("m", "m", "f"))
# 순서형 데이터
ordered("a", c("a", "b", "c"))

# Example of data frame
A <- c(1, 2, 3)
B <- c("a", "b", "c")
C <- data.frame(A, B)
# default: stringsAsFactors = True
str(C)
C
C[[1]]
C[[2]]
C[1,2]
C$B[2]
C$g <- c("M", "F", "M")
C
str(C)
C[[3]]
C[1,]
C[1, 2]
C[c(1,3), 2]
C[-1, -2]
C[,c("A", "B")]
C[,"A"]  # mode() 해보기
C[,"A", drop = FALSE]  # mode() 해보기
d <- data.frame(x = 1:1000)
head(d)  # 객체의 처음부분 반환
tail(d)  # 객체의 뒷부분 반환
View(d)  # 데이터 뷰어 호출

# Data Handling: Vector

x <- c(1, 2, 3, 4)
x
x <- c(x[1:3], 10, x[4])
x

c(1, 2, 4) + c(10, 11, 12, 13, 14)
x <- matrix(1:6, nrow =3, ncol = 2)
x
x + c(1:2)  # 잘 이해 안감

x <- c(1, 2, 3)
y<- c(10, 20, 30)
x + y
x * y
x %% y

y <- c(10, 20, 30, 40 ,50)
y[c(1,3)]
y[2:3]
v <- 2:3
y[v]

y[c(1,2,1,3)]
y[-5]
y[-length(-y)]

x <- 1:5
y <- 5:1
z <- 2
1:z-1  # 잘 이해 안감
1:(z-1)  # 잘 이해 안감

seq(from = 12, to = 30, by = 3)
seq(12, 30, 4)
seq(1.1, 2, length = 10)

rep(10, 5)
rep(c(10, 20, 30), 3)
rep(1:3, 3)
rep(c(10, 20, 30), each = 3) # each 옵션 - 특정 값을 원소 단위로 반복

x <- 1:10
x > 8
any(x > 8)
any(x > 20)
all(x > 8)
all(x > 0)

x <- c(1, 2, NA, 4, 5)
y <- c(1, 2, NULL, 4, 5)
mean(x)
mean(x, na.rm = T)
mean(y)

x <- c(1, 2, NA, 4, 5)
x[x > 2]
subset(x, x > 2)
x <- c(10, 20, NA, 40, 50)
x[x > 20]
x[c(F, F, NA, T, T)]
subset(x, x > 20)
which(x>20)
