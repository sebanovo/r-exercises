# 1
x <- 1:10
x

# 2
x <- 1:10
suma <- 0
for (i in x) {
  suma <- suma + i
}
suma

# 3
cuadrados <- vector("numeric", 10)
for (i in 1:10) {
  cuadrados[i] <- i^2
}
cuadrados

# 4
x <- 1:20
contador <- 0
for (i in x) {
  if (i %% 2 == 0) {
    contador <- contador + 1
  }
}
contador

# 5
suma_acumulada <- vector("numeric", 10)
suma <- 0
for (n in 1:10) {
  suma <- suma + n
  suma_acumulada[n] <- suma
}
suma_acumulada

# 6
es_primo <- function(n) {
  if (n < 2) {
    return(FALSE)
  }
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  TRUE
}

primos <- vector("logical", 20)
for (i in 1:20) {
  primos[i] <- es_primo(i)
}
primos

# 7
x <- 1:10
y <- vector("numeric", length(x))
for (i in 1:length(x)) {
  y[i] <- x[i] * 3
}
y

# 8
tabla_multiplicar <- function(n) {
  for (i in 1:10) {
    print(paste(n, "x", i, "=", n * i))
  }
}
tabla_multiplicar(5)
# 9
tabla_multiplicar <- function(n) {
  resultado <- vector("numeric", 10)
  for (i in 1:10) {
    resultado[i] <- n * i
  }
  return(resultado)
}
tabla_multiplicar(5)

# 10
cuadrados_hasta <- function(n) {
  resultado <- vector("numeric", n)
  for (i in 1:n) {
    resultado[i] <- i^2
  }
  return(resultado)
}
cuadrados_hasta(6)
