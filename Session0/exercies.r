echo=T

# Excersise 2.2
## Create a seq from 1 to 1000 in 4 intervals
seq(1, 1000, length.out = 4)

# Exercise 2.3
x <-c (1.1, 2.2, 3.3, 4.4)
s = c(seq(10,1))
attributes(x)
attributes(s)

## Rep

rep(x,2)
rep(x, each=2)
u = rep(1:2, c(8,4))
u

# Ex 2.5

sort(x, decreasing = TRUE)

# Ex 2.6 mean of x

sum(x)/length(x)
mean(x)

sum(( x - mean(x))^2)/(length(x)-1)
var(x)

# Ex 2.7
# Se registran ventas de 5 artículos el sábado, se registran en otro vector las ventas del
# domingo. Guarde en un vector articulo.nombres los nombres de los artículos correspondientes a las
# ventas. Obtener en un vector finde.ventas las ventas del fin de semana.
articulo.nombres = c("Libro", "Pluma", "Papel", "Tinta", "libreta")


# Ex 2.8
# Simule el lanzamiento de dos dados. Los lanzamientos son independientes.
# Nota: utilice la función sample, necesitará algún parámetro, cuál?
dice = c(seq(1,6))
sample(dice, 2, replace = TRUE)

# Ex 2.9
# Dado un vector de puntuaciones se han de quitar los valores extremos
puntuaciones = c(seq(1,10))
puntuaciones[2 : length(puntuaciones)-1]

names(x) = c("uno", "dos", "tres", "cuatro")
impar = x[c("uno", "tres")]

w = numeric()
length(w) = 10
w[3:5] = 5


sabado.vntas = c(200, 300, 320) # unidades vendidas el sabado
domingo.vntas = c(120, 230, 200) # unidades vendidas el domingo
finde.vntas = c(sabado.vntas, domingo.vntas) # agregación de las ventas
nombre.vntas = c("AB", "CD", "EF") # nombre articulos
fila.vntas = cbind(sabado.vntas, domingo.vntas) # se pegan las colmnas
columna.vntas = rbind(sabado.vntas, domingo.vntas) # se pegan las filas
colnames(columna.vntas) = nombre.vntas

## Data frames 

ventas <- data.frame(nombre.vntas, sabado.vntas, domingo.vntas )
ventas$sabado.vntas # se muestran las ventas del sabado
ventas$sabado.vntas + c(10,5,75) # se actualiza las ventas del sabado, ventas$sabado.vntas = ventas$sabado.vntas + c(10,5,75)

rm(list = ls())

## Matrices y Gráficos

a <- array(0, c(2,4)) # se reserva espacio y se asigna tdo a 0
a <- array(1:8, c(2,4))
m <- matrix(1:8, nrow = 2, ncol = 4, byrow = TRUE)
dim(m) # muestra las dimensiones, puede cambiarse

# Ex 3.1
## Cambie el valor de la esquina superior izda a -1 y los valores de la tercera fila a 1.
m[1,1] = -1
m[2,] = 1

# Ex 3.2
## Dado una matriz cuadrada inicializada al valor de la fila, se quiere poner a 0 los
## elementos (1,3) (2,2) y (3,1)

m = matrix(-1, 10, 10)
m[array(c(1:3,3:1), dim=c(3,2))] = 0

a <- array(1:5, dim=c(5,5)) # Genera array de 5X5 por cols
i <- array(c(1:3,3:1), dim=c(3,2)) # i bidimensional va a guardar las coordenadas
a[i] # se accede a aquellos componentes que seleccionamos
a[i] <- 0 # se asigna valor

# Ex 3.3
## Asigne el valor -2 a la diagonal principal de la matriz a
diag(a) = -2
diag(m) = -200

## Se le da semántica a filas y columnas

rownames(a) = LETTERS[1 : 5] # le pone nombre a las filas
colnames(a) = letters[1 : 5] # a las columnas
a

## Operaciones con matrices
C = c(rep(0, 3), rep(seq(1, 6), 3)); C
A = matrix(sample(C, 12), nrow = 3, byrow = T); A
B = matrix(sample(C, 12), nrow = 3, byrow = T); B

D = A + B; D # Suma de matrices.
E = A - B; E # Resta de A menos B.
F = A %*%t(B); F # Producto de matrices
G = A %o% B ; G # Producto exterior de matrices.
G = outer(A,B); G # Equivalente


## REPRESENTACIÓN DE GRÁFICOS

x <- rnorm (100); x # datos generados a partir de una normal
y <- rnorm (100) + 50; y
plot(x,y) # se abre una ventana

plot(x,y,xlab=" texto eje X",ylab="texto eje Y", main=" Plot de X vs Y") # se vuelve a abrir la ventana
text(-1,48, "texto en -2,48") # añade texto
mtext(paste("lado",1:4), side= 1:4, line= -1, font =2) # anade texto en los margenes


plot(x,y,type="n",xlab=" texto eje X",ylab="texto eje Y", main=" Sin Ejes", axes=F)
points(x,y,col = "green") # coloca los puntos
axis(1) # coloca eje X
axis(2, at=seq(48,54,length.out=5)) # coloca eje Y
box() # cierra la region principal


plot(x,y, col= "red", xlab=" texto eje X",ylab="texto eje Y", main=" Plot de X vs Y")
abline(h = 50, v = 0) # rectas horizontal y vertical
abline(a = 50, b = -3) # Recta ax+b


par(mar=c(4,4,2,2)) # se gana espacio si no hay titulo
plot(x,y,col=2, xlab=" texto eje X",ylab="texto eje Y", main=" Plot de X vs Y")


par(mfrow = c(2, 2))
plot(x, col = "red", type = "l", main = "Figura1")
plot(rnorm, col = "green", type = "l", main = "Figura2", lwd = 5, lty = 3)
plot(x, col = "yellow", type = "o", main = "Figura3",
sub = "Color yellow", lwd = 3)
plot(x, col = "grey21", type = "S", main = "Figura4")


par(mfrow = c(2, 3))
qqnorm(x, main = "qqnorm")
hist(x, main = "hist", freq=F)
dotchart(rnorm(10), main = "dotchart")
image(matrix(rnorm(100), ncol = 10), main = "image")
contour(matrix(rnorm(100), ncol = 10), main = "contour")
persp(matrix(rnorm(100), ncol = 10), main = "persp")
savePlot('plot02.png', type = 'png', device = dev.cur()) # para salvar en .png

# Ex 3.3
## Representar en un diagrama de quesos, pie la misma información que la que se
## muestra en con el siguiente comando.
hist(x, main="Histograma", breaks=10)
pie(y, main = "Pie Chart")

## Es probable que tengamos varios dispositivos gráficos abiertos... la ventana gráfica
## y varios pdf()
pdf("plot03.pdf") # cada vez se abre un dispositivo nuevo
hist(x, freq=F) # histograma
curve(dnorm(x), add=T) # se superpone la gráfica
## se han ejecutado varias veces las instrucciones anteriores...
dev.list() # se consulta la lista
dev.off(dev.cur()) # cierra el actual o se espefica número