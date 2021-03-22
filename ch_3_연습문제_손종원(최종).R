# Practice 1

myf <- function(x, y) {
  if (x > y) {
    return (x - y)
  } else {
    return (y -x)
  }
}
myf(5, 2)
myf(3, 8)

# Practice 2

myf2 <- function(x) {
  if (x <= 0) {
    return (0)
  } else if (x < 5) {
    return (1)
  } else {
    return (10)
  }
}

myf2(0)
myf2(3)
myf2(9)

# Practice 3

myf3 <- function(x, y) {
  if (x >0 & y >0) {
    return (x * y)
  } else {
    return (x + y)
  }
}
myf3(0, 3)
myf3(4, 5)

# Practice 4

myf4 <- function(x) {
  cat(sprintf("구구단 %d 단\n", x))
  for (i in 1:9) {
    print(sprintf("%d * %d = %d", x, i, x*i))
  }
}
myf4(4)
