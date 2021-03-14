# Practice 1
v1 <- seq(1990, 2020, 5)
v1

# Practice 2
v2 <- rep(seq(1, 12, 1), each = 4)
v2

# Practice 3-1
x <- 1:50
v3 <- x[(x %% 3 == 0)| (x %% 5 == 0)]
v3

# Practice 3-2

v3 <- NULL
a = 1
for (i in 1:50){
  if (i %% 3 == 0 | i %% 5 == 0){
    v3[a] <- i
    a = a + 1
  }
}
v3

# Practice 3-3
subset(x, (x  %% 3 == 0) | (x %% 5 == 0))

# Practice 3-4
which(x %% 3 == 0 |x %% 5 == 0)

# Practice 3은 방법이 여러 가지라서 더 생각 해보기