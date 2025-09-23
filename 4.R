# EJERCICIOS 4.4

# 1. Cargue el paquete dplyr y el set de datos de asesinatos de EE.UU.
library(dplyr)
library(dslabs)
data(murders)


# Puede añadir columnas usando la función mutate de dplyr. Esta función reconoce los nombres de la columnas y dentro de la función puede llamarlos sin comillas:
murders <- mutate(murders, population_in_millions = population / 10^6)
# Podemos escribir population en vez de murders$population. La función mutate sabe que estamos agarrando columnas de murders.

# Use la función mutate para añadir una columna de asesinatos llamada rate con la tasa de asesinatos por 100,000 como en el código del ejemplo anterior. Asegúrese de redefinir murders como se hizo en el código del ejemplo anterior (murders <- [su código]) para que podamos seguir usando esta variable.
murders <- mutate(murders, rate = total / population * 100000)
murders

# 2. Si rank(x) le da el rango de las entradas de x de menor a mayor, rank(-x) le da los rangos de mayor a menor. Use la función mutate para añadir una columna rank que contiene el rango de la tasa de asesinatos de mayor a menor. Asegúrese de redefinir murders para poder seguir usando esta variable.
murders <- mutate(murders, rank = rank(-rate))
murders
# 3. Con dplyr, podemos usar select para mostrar solo ciertas columnas. Por ejemplo, con este código solo mostraríamos los estados y los tamaños de población:

select(murders, state, population) |> head()

# Utilice select para mostrar los nombres de los estados y las abreviaturas en murders. No redefina murders, solo muestre los resultados.

select(murders, state, abb) |> head()

# 4. La función filter de dplyr se utiliza para elegir filas específicas del data frame para guardar. A diferencia de select que es para columnas, filter es para filas. Por ejemplo, puede mostrar solo la fila de Nueva York así:
filter(murders, state == "New York")


# Puede usar otros vectores lógicos para filtrar filas.

# Utilice filter para mostrar los cinco estados con las tasas de asesinatos más altas. Después de añadir la tasa y el rango de asesinatos, no cambie el set de datos de asesinatos de EE. UU., solo muestre el resultado. Recuerde que puede filtrar basándose en la columna rank.

# 5. Podemos eliminar filas usando el operador !=. Por ejemplo, para eliminar Florida, haríamos esto:

no_florida <- filter(murders, state != "Florida")

# Cree un nuevo data frame con el nombre no_south que elimina los estados del sur. ¿Cuántos estados hay en esta categoría? Puede usar la función nrow para esto.
no_south <- filter(murders, region != "South")
nrow(no_south)

# 6. También podemos usar %in% para filtrar con dplyr. Por lo tanto, puede ver los datos de Nueva York y Texas de esta manera:

filter(murders, state %in% c("New York", "Texas"))
# Cree un nuevo data frame llamado murders_nw con solo los estados del noreste y oeste. ¿Cuántos estados hay en esta categoría?
murders_nw <- filter(murders, region %in% c("Northeast", "West"))
nrow(murders_nw)

# 7. Suponga que desea vivir en el noreste u oeste y desea que la tasa de asesinatos sea inferior a 1. Queremos ver los datos de los estados que satisfacen estas opciones. Tenga en cuenta que puede usar operadores lógicos con filter. Aquí hay un ejemplo en el que filtramos para mantener solo estados pequeños en la región noreste.

filter(murders, population < 5000000 & region == "Northeast")
# Asegúrese que murders ha sido definido con rate y rank y todavía tiene todos los estados. Cree una tabla llamada my_states que contiene filas para los estados que satisfacen ambas condiciones: está localizado en el noreste u oeste y la tasa de asesinatos es inferior a 1. Use select para mostrar solo el nombre del estado, la tasa y el rango.
my_states <- filter(murders, (region %in% c("Northeast", "West")) & rate < 1)
my_states <- select(my_states, state, rate, rank)
my_states


# EJERCICIOS 4.6
# 1. El pipe |> se puede usar para realizar operaciones secuencialmente sin tener que definir objetos intermedios. Comience redefiniendo murders para incluir la tasa y el rango.

murders <- mutate(murders, rate = total/ population * 100000,
                  rank = rank(-rate))
# En la solución al ejercicio anterior, hicimos lo siguiente:

my_states <- filter(murders, region %in% c("Northeast", "West") &
                      rate < 1)

select(my_states, state, rate, rank)
# El pipe |> nos permite realizar ambas operaciones secuencialmente sin tener que definir una variable intermedia my_states. Por lo tanto, podríamos haber mutado y seleccionado en la misma línea de esta manera:

mutate(murders, rate = total/ population * 100000,
       rank = rank(-rate)) |>
  select(state, rate, rank)
# Note que select ya no tiene un data frame como primer argumento. Se supone que el primer argumento sea el resultado de la operación realizada justo antes de |>.

# Repita el ejercicio anterior, pero ahora, en lugar de crear un nuevo objeto, muestre el resultado y solo incluya las columnas de estado, velocidad y rango. Use un pipe |> para hacer esto en una sola línea.
murders |>
  mutate(rate = total / population * 100000,
         rank = rank(-rate)) |>
  select(state, rate, rank)

# 2. Reinicie murders a la tabla original usando data(murders). Use un pipe para crear un nuevo data frame llamado my_states que considera solo los estados del noreste u oeste que tienen una tasa de asesinatos inferior a 1 y contiene solo las columnas de estado, tasa y rango. El pipe también debe tener cuatro componentes separados por tres |>. El código debería verse algo similar a lo siguiente:

my_states <- murders |>
  mutate SOMETHING |>
  filter SOMETHING |>
  select SOMETHING

# solucion: 
data(murders)

my_states <- murders |>
  mutate(rate = total / population * 100000,
         rank = rank(-rate)) |>
  filter(region %in% c("Northeast", "West") & rate < 1) |>
  select(state, rate, rank)

my_states

# EJERICIOS 4.10
# Para estos ejercicios, utilizaremos los datos de la encuesta recopilada por el Centro Nacional de Estadísticas de Salud de Estados Unidos (NCHS por sus siglas en inglés). Este centro ha realizado una serie de encuestas de salud y nutrición desde la década de 1960. A partir de 1999, alrededor de 5,000 individuos de todas las edades han sido entrevistados cada año y completan el componente de examen de salud de la encuesta. Parte de los datos está disponible a través del paquete NHANES. Una vez que instale el paquete NHANES, puede cargar los datos así:

library(NHANES)
data(NHANES)
# Los datos NHANES tienen muchos valores faltantes. Las funciones mean y sd devolverán NA si alguna de las entradas del vector de entrada es un NA. Aquí hay un ejemplo:

library(dslabs)
data(na_example)
mean(na_example)
#> [1] NA
sd(na_example)
#> [1] NA
# Para ignorar los NAs, podemos usar el argumento na.rm:

mean(na_example, na.rm = TRUE)
#> [1] 2.3
sd(na_example, na.rm = TRUE)
#> [1] 1.22
# Exploremos ahora los datos de NHANES.

# 1. Le ofrecemos algunos datos básicos sobre la presión arterial. Primero, seleccionemos un grupo para establecer el estándar. Utilizaremos hembras de 20 a 29 años. AgeDecade es una variable categórica con estas edades. Tenga en cuenta que la categoría está codificada como ” 20-29”, ¡con un espacio al frente! ¿Cuál es el promedio y la desviación estándar de la presión arterial sistólica según se guarda en la variable BPSysAve? Guárdela en una variable llamada ref.
ref <- NHANES %>%
  filter(Gender == "female", AgeDecade == " 20-29", !is.na(BPSysAve)) %>%
  summarize(
    mean = mean(BPSysAve, na.rm = TRUE),
    sd = sd(BPSysAve, na.rm = TRUE)
  )
ref

# Sugerencia: use filter y summarize y use el argumento na.rm = TRUE al calcular el promedio y la desviación estándar. También puede filtrar los valores de NA utilizando filter.


# 2. Usando un pipe, asigne el promedio a una variable numérica ref_avg. Sugerencia: use el código similar al anterior y luego pull.
ref_avg <- NHANES %>%
  filter(Gender == "female", AgeDecade == " 20-29", !is.na(BPSysAve)) %>%
  summarize(mean = mean(BPSysAve, na.rm = TRUE)) %>%
  pull(mean)

ref_avg

# 3. Ahora indique los valores mínimo y máximo para el mismo grupo.
NHANES %>%
  filter(Gender == "female", AgeDecade == " 20-29", !is.na(BPSysAve)) %>%
  summarize(
    min = min(BPSysAve, na.rm = TRUE),
    max = max(BPSysAve, na.rm = TRUE)
  )
# 4. Calcule el promedio y la desviación estándar para las hembras, pero para cada grupo de edad por separado en lugar de una década seleccionada como en la pregunta 1. Tenga en cuenta que los grupos de edad se definen por AgeDecade. Sugerencia: en lugar de filtrar por edad y género, filtre por Gender y luego use group_by.
NHANES %>%
  filter(Gender == "female", !is.na(BPSysAve)) %>%
  group_by(AgeDecade) %>%
  summarize(
    mean = mean(BPSysAve, na.rm = TRUE),
    sd = sd(BPSysAve, na.rm = TRUE)
  )
# 5. Repita el ejercicio 4 para los varones.
NHANES %>%
  filter(Gender == "male", !is.na(BPSysAve)) %>%
  group_by(AgeDecade) %>%
  summarize(
    mean = mean(BPSysAve, na.rm = TRUE),
    sd = sd(BPSysAve, na.rm = TRUE)
  )
# 6. Podemos combinar ambos resúmenes para los ejercicios 4 y 5 en una línea de código. Esto es porque group_by nos permite agrupar por más de una variable. Obtenga una gran tabla de resumen usando group_by(AgeDecade, Gender).
NHANES %>%
  filter(!is.na(BPSysAve)) %>%
  group_by(AgeDecade, Gender) %>%
  summarize(
    mean = mean(BPSysAve, na.rm = TRUE),
    sd = sd(BPSysAve, na.rm = TRUE)
  )
# 7. Para los varones entre las edades de 40-49, compare la presión arterial sistólica según raza, como aparece en la variable Race1. Ordene la tabla resultante según la presión arterial sistólica promedio de más baja a más alta.
NHANES %>%
  filter(Gender == "male", AgeDecade == " 40-49", !is.na(BPSysAve)) %>%
  group_by(Race1) %>%
  summarize(
    mean = mean(BPSysAve, na.rm = TRUE),
    sd = sd(BPSysAve, na.rm = TRUE)
  ) %>%
  arrange(mean)

# EJERCICIOS 4.15
# 1. Cargue el set de datos murders. ¿Cuál de los siguientes es cierto?
library(dslabs)
library(tidyverse)
data(murders)

# murders está en formato tidy y se almacena en un tibble.
# murders está en formato tidy y se almacena en un data frame.
# murders no está en formato tidy y se almacena en un tibble.
# murders no está en formato tidy y se almacena en un data frame.
# 2. Utilice as_tibble para convertir la tabla de datos murders en un tibble y guárdelo en un objeto llamado murders_tibble.
murders_tibble <- as_tibble(murders)
murders_tibble
# 3. Utilice la función group_by para convertir murders en un tibble que se agrupa por región.
murders_region <- murders_tibble %>%
  group_by(region)

murders_region

# 4. Escriba el código tidyverse que es equivalente a este código:

exp(mean(log(murders$population)))
# Escríbalo usando el pipe para que cada función se llame sin argumentos. Use el operador punto para acceder a la población. Sugerencia: el código debe comenzar con murders |>.
murders |>
  pull(population) |>
  log() |>
  mean() |>
  exp()

# 5. Utilice el map_df para crear un data frame con tres columnas que se denominan n, s_n y s_n_2. La primera columna debe contener los números del 1 al 100. La segunda y la tercera columna deben contener la suma del 1 al 100 n con n representando el número de fila
df <- map_df(1:100, function(n) {
  tibble(
    n = n,
    s_n = sum(1:n),
    s_n_2 = sum((1:n)^2)
  )
})

df
