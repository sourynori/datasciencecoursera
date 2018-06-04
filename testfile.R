myfunction <- function() {
  x<-rnorm(100)
  mean(x)
}

second <- function(x){
  c(x,
  x+rnorm(length(x)))
  
}

for(i in 1:10){print(i)}

y <- matrix(1:6,2,3)

print(y)

make.power <- function(n){
  pow <- function(x){
    x^n
  }
  pow
}

cube <- make.power(3)
print(cube(2))