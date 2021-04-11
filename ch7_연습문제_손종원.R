library(dplyr)

# Practice 1
versi_c = subset(iris, Species == "versicolor")
over_versi_c = filter(versi_c, Sepal.Length >= median(Sepal.Length))
summary(over_versi_c)

# Practice 2
iris.s = arrange(iris, Species, desc(Sepal.Width))
iris.s

# Practice 3
iris.petal = select(iris, Petal.Width:Petal.Length)
iris.petal

# Practice 4
iris.petal = rename(iris.petal, Width = Petal.Width, Length = Petal.Length)
iris.petal

# Practice 5
iris.q = mutate(iris.petal,
       Width.q1 = quantile(Width, probs = 0.25),
       Width.q3 = quantile(Width, probs = 0.75))
iris.q = filter(iris.q, Width >= Width.q1 & Width <= Width.q3)
iris.q

# Practice 6
group_by(iris, Species) %>%
  summarize(S_L_mean = mean(Sepal.Length),
            S_W_max = max(Sepal.Width),
            P_L_median = median(Petal.Length),
            P_W_min = min(Petal.Width))
