library(dslabs)
data(murders)

# 1. ¿Qué devolverá esta expresión condicional?
x <- c(1, 2, -3, 4)
if (all(x > 0)) {
  print("All Postives")
} else {
  print("Not all positives")
}

# 2. ¿Cuál de las siguientes expresiones es siempre
# FALSE cuando al menos una entrada de un vector lógico
# x es TRUE?
# a. all(x)
# b. any(x)
# c. any(!x)
# d. all(!x)
# Solución:
x <- vector(length(10))
all(x)

# 3. La función nchar le dice cuántos caracteres tiene
# un vector de caracteres. Escriba una línea de código
# que le asigne al objeto new_names la abreviatura del
# estado cuando el nombre del estado tiene más de 8
# caracteres.
new_names <- abbreviate(murders$state[nchar(murders$state) > 8])
new_names

# 4. Cree una función sum_n que para cualquier valor dado, digamos
# n, calcula la suma de los enteros de 1 a n (inclusivo). Use la
# función para determinar la suma de los enteros de 1 a 5,000.
sum_n <- function(n) {
  (n * (n + 1)) / 2
}

sum_n(5000)

# 5. Cree una función altman_plot que toma dos argumentos,
# x y y, y grafica la diferencia contra la suma.
altman_plot <- function(x, y) {
  plot(x + y, x - y)
}

altman_plot(10:40, 1:30)

# 6. Después de ejecutar el siguiente código, ¿cuál es el
# valor de x?
x <- 3
my_func <- function(y) {
  x <- 5
  y + 5
}
x


# 7. Escriba una función compute_s_n
# que para cualquier n calcula la suma
# Sn = 1^2 + 2^2 + 3^2 + ... n^2.
# Indique el valor de la suma cuando
# n = 10

compute_s_n <- function(n) {
  (n * (n + 1) * (2 * n + 1)) / 6
}

compute_s_n(10)

# 8. Defina un vector numérico vacío s_n
# de tamaño 25 usando
s_n <- vector("numeric", 25)
# y almacene los resultados de
# S1, S2, S2, ... Sn usando el bucle for
s_n <- vector("numeric", 25)
for (n in 1:25) {
  s_n[n] <- compute_s_n(n)
}
s_n

# 9. Repita el ejercicio 8, pero esta vez use sapply.
sapply(1:25, compute_s_n)
# 10. Repita el ejercicio 8, pero esta vez use map_dbl.
library(purrr)
map_dbl(1:25, compute_s_n)

# 11. Grafique Sn versus n use puntos definidos por
# n  = 1,...25
plot(1:25, sapply(1:25, compute_s_n))
# 12. Confirme que la fórmula para esta suma es
# Sn = (n * (n + 1) * (2 * n + 1)) / 6
identical(sum((1:10)^2), compute_s_n(10))
