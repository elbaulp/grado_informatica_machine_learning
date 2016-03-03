# RELACIÓN 2

## Ejemplo 1

# Vamos a crear una función para hallar el
# máximo de 2 valores y se invoca con -1, 10

mayor <- function(x, y) {
  if (x > y)
    x
  else
    y
}

mayor <- function(x, y) {
  if (x > y)
  {
    return (x)
  }
  else {
    return (y)
  }
}

mayor(-1, -10) # invoca la función
mayor # muestra la funcion

## Ejemplo 2
# Suma de una progresión aritmética con a1 término inicial,
# n número de términos y d incremento

suma <- function(a1, n, d) {
  an <- a1 + (n - 1) * d
  ((a1 + an) * n) / 2
}

# Ejercicio 1
## Simula el lanzamiento de dos dados y que los sume

puntuacion <- function(){
  sum(sample(c(seq(1,6)), 2, replace = TRUE))
}

puntuacion()

# Ejercicio 2
## Llamar 10 veces a la función puntuacion
replicate(10, puntuacion())

# Rellenar un vector con 100 puntuaciones. Versión 1. Agregando las salidas de 2.3 a
## un vector. Versión 2. Hacer una funcion que devuelva un vector de longitud variable.
# v1
as.vector(replicate(100, puntuacion()))
#v2

## Ejercicio 3
# Vamos a manipular una baraja española, a barajarla y a robar de la baraja. Para
# ello, será necesario crear la baraja: un dataframe y dos funciones barajar y robar.

crearBarajaEspañola <- function(){
  # Define suits, cards, values
  palos <- c("Oros", "Bastones", "Espadas", "Copas")
  cartas <- c("Uno", "Dos", "Tres", "Cuatro","Cinco", "Seis", "Siete", "Ocho", "Nueve", "Diéz", "Sota", "Caballo", "Rey")
  valores <- c(1:13)
  
  # Build deck, replicated proper number of times
  # Creamos un data frame con la baraja entera
  baraja <- expand.grid(cartas=cartas, palos=palos)
  baraja$valores <- valores
  
  baraja
}

barajar <- function(baraja){
  ## Muestreamos el vector de 1:52 para coger un orden aleatorio, así barajamos todas las cartas
  baraja[sample(nrow(baraja)),]
}

robar <- function(baraja){
  indice = sample(nrow(baraja), 1)
  carta = baraja[indice,]
  baraja = baraja[-indice,]
  

}

baraja = crearBarajaEspañola()
baraja = barajar(baraja)
par = robar(baraja)

