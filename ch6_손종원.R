# split()

split(iris, iris$Species)
lapply(split(iris$Sepal.Length, iris$Species), mean)

# subset()

subset(iris, Species == "setosa")
subset(iris, Species == "setosa" & Sepal.Length > 5.0)
subset(iris, select = c(Sepal.Length, Species))
subset(iris, select = -c(Sepal.Length, Species))
iris[, !names(iris) %in% c("Sepal.Length", "Species")]

# merge()

x = data.frame(name = c("a", "b", "c"), math = c(1, 2, 3))
y = data.frame(name = c("c", "b", "a"), english = c(4, 5, 6))
merge(x, y)
cbind(x, y)
x = data.frame(name = c("a", "b", "c"), math = c(1, 2, 3))
y = data.frame(name = c("a", "b", "d"), english = c(4, 5, 6))
merge(x, y)
merge(x, y, all=TRUE)


## 데이터 정렬


# sort()

x = c(20, 11, 33, 50, 47)
sort(x)
sort(x, decreasing = T)

# order()

x
order(x)
order(x, decreasing = T)
i = order(x)
x[i]
x[order(x)]
iris[order(iris$Sepal.Length),]
iris[order(iris$Sepal.Length, iris$Petal.Length),]


## 데이터 프레임 컬럼 접근


# with

print(mean(iris$Sepal.Length))
print(mean(iris$Sepal.Width))
with(iris, {
  print(mean(iris$Sepal.Length))
  print(mean(iris$Sepal.Width))
  })
(x = data.frame(val = c(1, 2, 3, 4, NA, 5, NA)))
within(x, {
  val = ifelse(is.na(val), median(val, na.rm = T), val)
})

# within

data(iris)
iris[1, 1] = NA
iris

median_per_species = sapply(split(iris$Sepal.Length, iris$Species), median, na.rm = T)
iris = within(iris, {
  Sepal.Length = ifelse(is.na(Sepal.Length),
                        median_per_species[Species],
                        Sepal.Length)
})
head(iris)

# attach(), detach()

Sepal.Width
attach(iris)
head(Sepal.Width)
detach(iris)
Sepal.Width
head(iris)
attach(iris)
Sepal.Width[1] = -1
Sepal.Width
iris$Sepal.Width
detach(iris)
head(iris)

# aggregate()

aggregate(Sepal.Width ~ Species, iris, mean)
tapply(iris$Sepal.Length, iris$Species, mean)
