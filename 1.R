# 1. ¿Cuál es la suma de los primeros 100 números enteros positivos?
# La fórmula para la suma de enteros de 1 a n es "n(n + 1)/2".
# Defina n = 100 y luego use R para calcular la suma de 1 a 100 usando
# la fórmula ¿Cúal es la suma?
suma_primeros_n <- function(n) {
  resultado <- (n * (n + 1)) / 2
  (resultado)
}

print(suma_primeros_n(100)) # respuesta 5050

# 2. Ahora use la misma fórmula para calcular la suma de los
# enteros del 1 a 1000.
print(suma_primeros_n(1000)) # respuesta 500500

# 3. Mire el resultado de escribir el siguiente código en R:
n <- 1000
x <- seq(1, n)
sum(x)

# Basado en el resultado, ¿qué cree que hacen las
# funciones seq y sum? Puede usar help.
# a. sum crea una lista de números y seq los suma.
# b. seq crea una lista de números y sum los suma.
# c. seq crea una lista aleatoria y sum calcula la suma de 1 a 1000.
# d. sum siempre devuelve el mismo número.

# respuesta b.

# 4. En las matemáticas y la programación decimos que evaluamos
# una función cuando reemplazamos el argumento con un número dado.
# Entonces si escribimos sqrt(4), evaluamos la función sqrt. En R se
# puede evaluar una función dentro de otra función. Las evaluaciones
# suceden de adentro hacia afuera. Use una línea de código para calcular
# el logaritmo, en base 10, de la raíz cuadrada de 100.

print(log(sqrt(100), base = 10)) # respuesta 1

# 5. ¿Cuál de los siguientes siempre devolverá el valor numérico
#  almacenado en x?
# Puede intentar los ejemplos y usar el sistema de ayuda si lo desea.
# a.log(10^x)
# b.log10(x^10)
# c.log(exp(x))
# d.exp(log(x, base = 2))

# respuesta c.
