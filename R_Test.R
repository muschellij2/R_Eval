set.seed(20130408)

x <- rnorm(100)
y <- 2*x + rnorm(100)

mod <- lm(y~x)

print(mod)

