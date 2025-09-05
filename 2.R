# 1. Cargue el set de datos de asesinatos de EE.UU.

library(dslabs)
data(murders)
# Use la función str para examinar la estructura del
# objeto murders. ¿Cuál de las siguientes opciones describe
#  mejor las variables representadas en este data frame?

# a.Los 51 estados.
# b.Las tasas de asesinatos para los 50 estados y DC.
# c. El nombre del estado, la abreviatura del nombre del estado, la región
# del estado y la población y el número total de asesinatos para 2010
# del estado.
# d.str no muestra información relevante.

str(murders)

# respuesta la c.
# 2. ¿Cuáles son los nombres de las columnas utilizados por el data frame
# para estas cinco variables?

colnames(murders)
# respuesta:
# > colnames(murders)
# [1] "state"      "abb"        "region"     "population" "total"

# 3. Use el operador de acceso $ para extraer las abreviaturas de los estados
# y asignarlas al objeto a. ¿Cuál es la clase de este objeto?
a <- murders$abb
class(a)

# 4. Ahora use los corchetes para extraer las abreviaturas de los estados
# y asignarlas al objeto b. Utilice la función identical para determinar
# si a y b son iguales.
b <- murders[["abb"]]
identical(a, b)

# 5. Vimos que la columna region almacena un factor. Puede corroborar
# esto escribiendo:
class(murders$region)

# respuesta:
length(levels(murders$region))

# 6. La función table toma un vector y devuelve la frecuencia de cada
# elemento. Puede ver rápidamente cuántos estados hay en cada región
# aplicando esta función. Use esta función en una línea de código para
# crear una tabla de estados por región.
table(murders$region)


# 1. Use la función c para crear un vector con las temperaturas altas
# promedio en enero para Beijing, Lagos, París, Río de Janeiro, San Juan
# y Toronto, que son 35, 88, 42, 84, 81 y 30 grados Fahrenheit. Llame al
# objeto temp.
temp <- c(53, 88, 42, 84, 81, 30)

# 2. Ahora cree un vector con los nombres de las ciudades y llame al
# objeto city.
city <- c("Beijing", "Lagos", "París", "Río de Janeiro", "San Juan", "Toronto")

# 3. Utilice la función names y los objetos definidos en los ejercicios
# anteriores para asociar los datos de temperatura con su ciudad
# correspondiente.

names(temp) <- city

temp

# 4. Utilice los operadores [ y : para acceder a la temperatura de las
# tres primeras ciudades de la lista.
temp[1:3]
# 5. Utilice el operador [ para acceder a la temperatura de París y San Juan.
temp[["París"]]
temp[["San Juan"]]
# 6. Utilice el operador : para crear una secuencia de números
# 12, 13, 14,...73
12:73
# 7. Cree un vector que contenga todos los números impares positivos menores
# que 100.
seq(1, 100, 2)
# 8. Cree un vector de números que comience en 6, no pase 55 y agregue números
# en incrementos de 4/7: 6, 6 + 4/7, 6 + 8/7, y así sucesivamente.
# ¿Cuántos números tiene la lista? Sugerencia: use seq y length.
lista <- seq(6, 55, 4 / 7)
lista
length(lista)

# 9. ¿Cuál es la clase del siguiente objeto a <- seq(1, 10, 0.5)?
a <- seq(1, 10, 0.5)
class(a)
# 10. ¿Cuál es la clase del siguiente objeto a <- seq(1, 10)?
a <- seq(1, 10)
class(a)
# 11. La clase de class(a<-1) es numérica, no entero. R por defecto
# es numérico y para forzar un número entero, debe añadir la letra L.
# Confirme que la clase de 1L es entero.
class(1L)
# 12. Defina el siguiente vector:
x <- c("1", "3", "5")
# y oblíguelo a obtener enteros.
x <- as.integer(x)
x

# 1. Utilice el operador $ para acceder a los datos
# del tamaño de la población y almacenarlos como el
# objeto pop. Luego, use la función sort para redefinir
# pop para que esté en orden alfabético. Finalmente,
# use el operador [ para indicar el tamaño de población
# más pequeño.
pop <- murders$population
sort(pop)[1]

# 2. Ahora, en lugar del tamaño de población más pequeño,
# encuentre el índice de la entrada con el tamaño de
# población más pequeño. Sugerencia: use order en lugar
# de sort.
pop <- murders$population
indice <- order(pop)[1]
indice

# 3. Podemos realizar la misma operación que en el
# ejercicio anterior usando la función which.min.
# Escriba una línea de código que haga esto.
menor_indice <- which.min(murders$population)
menor_indice

# 4. Ahora sabemos cuán pequeño es el estado más pequeño
# y qué fila lo representa. ¿Qué estado es? Defina
# una variable states para ser los nombres de los
# estados del data frame murders. Indique el nombre del
# estado con la población más pequeña.
estados <- murders$state
estado_menor_poblacion <- estados[menor_indice]
estado_menor_poblacion

# 5. Puede crear un data frame utilizando la función data.frame.
# Aquí un ejemplo:
temp <- c(35, 88, 42, 84, 81, 30)
city <- c(
  "Beijing", "Lagos", "Paris", "Rio de Janeiro",
  "San Juan", "Toronto"
)
city_temps <- data.frame(name = city, temperature = temp)

# Utilice la función rank para determinar el rango de población
# de cada estado desde el menos poblado hasta el más poblado.
# Guarde estos rangos en un objeto llamado ranks. Luego, cree
# un data frame con el nombre del estado y su rango. Nombre
# el data frame my_df.
# Determinar el rango de población

rangos <- rank(murders$population)
my_df <- data.frame(estado = murders$state, rango_poblacion = rangos)
my_df

# 6. Repita el ejercicio anterior, pero esta vez ordene my_df
# para que los estados estén en orden de menos poblado a más
# poblado. Sugerencia: cree un objeto ind que almacene los índices
# necesarios para poner en orden los valores de la población.
# Luego, use el operador de corchete [ para reordenar cada
# columna en el data frame.

indice <- order(murders$population)
my_df_ordenado <- my_df[indice, ]
my_df_ordenado

# 7. El vector na_example representa una serie de conteos.
# Puede examinar rápidamente el objeto usando
data("na_example")
str(na_example)
# Sin embargo, cuando calculamos el promedio con la función
# mean, obtenemos un NA:
mean(na_example)
# La función is.na devuelve un vector lógico que nos dice qué
# entradas son NA. Asigne este vector lógico a un objeto
# llamado ind y determine cuántos NAs tiene na_example.

mean(na_example)
ind <- is.na(na_example)
sum(ind)

# 8. Ahora calcule nuevamente el promedio, pero solo para las
# entradas que no son NA. Sugerencia: recuerde el operador !.

mean(na_example[!is.na(na_example)])


# 1. Anteriormente, creamos este data frame:
temp <- c(35, 88, 42, 84, 81, 30)
city <- c(
  "Beijing", "Lagos", "Paris", "Rio de Janeiro",
  "San Juan", "Toronto"
)
city_temps <- data.frame(name = city, temperature = temp)
# Vuelva a crear el data frame utilizando el código anterior,
# ero agregue una línea que convierta la temperatura de
# Fahrenheit a Celsius. La conversión es C = (5/9)(F -32).

temp_celsius <- (5 / 9) * (temp - 32)
city_temps <- data.frame(
  name = city,
  temperature_F = temp,
  temperature_C = temp_celsius
)
city_temps

# 2. ¿Cuál es la siguiente suma 1 + 1/2^2 + 1/3^ + ... 1 / 100^2?
# Sugerencia: gracias a Euler, sabemos que debería estar cerca de
# π^2

serie_euler <- sum(1 / (1:100)^2)
serie_euler

# 3. Calcule la tasa de asesinatos por cada 100,000 para cada estado
# y almacénela en el objeto murder_rate. Luego, calcule la tasa
# promedio de asesinatos para EE. UU. con la función mean.
# ¿Cuál es el promedio?

rango_muertes <- (murders$total / murders$population) * 100000
promedio_rango_muerte <- mean(rango_muertes)
promedio_rango_muerte

# 1. Calcule la tasa de asesinatos por cada 100,000 para
# cada estado y almacénela en un objeto llamado murder_rate.
# Luego, use operadores lógicos para crear un vector lógico
# llamado low que nos dice qué entradas de murder_rate son
# inferiores a 1.
rango_asesinatos <- (murders$total / murders$population) * 100000
low <- rango_asesinatos < 1
low

# 2. Ahora use los resultados del ejercicio anterior y la
# función which para determinar los índices de murder_rate
# asociados con valores inferiores a 1.
low_indices <- which(low)
low_indices

# 3. Use los resultados del ejercicio anterior para indicar
# los nombres de los estados con tasas de asesinatos inferiores
#  a 1.
low_states <- murders$state[low_indices]
low_states

# 4. Ahora extienda el código de los ejercicios 2 y 3 para
# indicar los estados del noreste con tasas de asesinatos
# inferiores a 1. Sugerencia: use el vector lógico predefinido
# low y el operador lógico &.

noroeste_low <- low & murders$region == "Northeast"
noroeste_low_estados <- murders$state[noroeste_low]
noroeste_low_estados

# 5. En un ejercicio anterior, calculamos la tasa de asesinatos
# para cada estado y el promedio de estos números.
# ¿Cuántos estados están por debajo del promedio?

rango_promedio_asesinatos <- mean(rango_asesinatos)
asesinatos_menor_al_promedio <- rango_asesinatos < rango_promedio_asesinatos
sum(asesinatos_menor_al_promedio)

# 6. Use la función match para identificar los estados
# con abreviaturas AK, MI e IA. Sugerencia: comience definiendo
# un índice de las entradas de murders$abb que coinciden con
# las tres abreviaturas. Entonces use el operador [ para
# extraer los estados.

abreviaturas <- c("AK", "MI", "IA")
indices_abreviaturas <- match(abreviaturas, murders$abb)
estados_abreviaturas <- murders$state[indices_abreviaturas]
estados_abreviaturas

# 7. Utilice el operador %in% para crear un vector lógico que
# responda a la pregunta: ¿cuáles de las siguientes son
# abreviaturas reales: MA, ME, MI, MO, MU?
abreviaturas_reales <- c("MA", "ME", "MI", "MO", "MU") %in% murders$abb
abreviaturas_reales

# 8. Extienda el código que usó en el ejercicio 7 para averiguar
# la única entrada que no es una abreviatura real. Sugerencia:
# use el operador !, que convierte FALSE a TRUE y viceversa,
# y entonces which para obtener un índice.

indice_abreviatura_falsa <-
  which(!(c("MA", "ME", "MI", "MO", "MU") %in% murders$abb))
abreviatura_falsa <- c("MA", "ME", "MI", "MO", "MU")[indice_abreviatura_falsa]
abreviatura_falsa
