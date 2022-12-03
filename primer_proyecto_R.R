corte_1 <-0.3 
corte_2 <-0.3
corte_3 <-0.3

corte_2 * corte_1

summary(orangeec)
summary(mtcars)

#tranformación entre kilos y libras

wt <- (mtcars$wt*1000)/2.20462262
wt 

mtcars.new <- transform(mtcars, wt=((wt*1000)/2.20462262))
mtcars.new
summary(mtcars.new)


# uso de vectores en R 
tiempo_plaztzi <- c(25,5,10,15,10)
tiempo_lectura <- c(30,10,5,10,15)
tiempo_aprendisaje <- tiempo_plaztzi + tiempo_lectura
tiempo_aprendisaje

dias_aprendisaje <- c("lunes", "martes", "miercoles", "jueves", "viernes")
dias_aprendisaje

total_tiempo_platzi <- sum(tiempo_plaztzi)
total_tiempo_lectura <- sum(tiempo_lectura)
total_tiempo_platzi
total_tiempo_lectura

total_tiempo_adicional <- total_tiempo_platzi + total_tiempo_lectura
total_tiempo_adicional

# USO de matrices en R 

tiempo_platzi <- c(25,5,10,15,10)
tiempo_lectura <- c(30,10,5,10,15)
tiempo_matrix <- matrix(c(tiempo_platzi, tiempo_lectura),
                        nrow = 2, byrow=TRUE)
dias <- c("lunes", "martes", "miercoles", "jueves", "viernes")

Tiempo <- c("tiempo platzi", "tiempo lecturas")
final_matrix
colnames(tiempo_matrix) <- dias 
rownames(tiempo_matrix) <- Tiempo


tiempo_matrix 

colSums(tiempo_matrix) 

final_matrix <- rbind(tiempo_matrix,c(10,15,30,5,0))
final_matrix

colSums(final_matrix) 

final_matrix [2,3]
final_matrix

#uso de operadores para comparar y ubicar datos 

mtcars[mtcars$cyl<6,]

orangeec[orangeec$GDP.PC>=15000,]

neworangeec <- subset( orangeec, Internet.penetration...population >80
                       & Education.invest...GDP >= 4.5, 
                       select=Creat.Ind...GDP)

neworangeec
 

rename(orangeec,c("Creat.Ind...GDP" = "AporteEcNja"))



nivelcurso <- c("basico","intermedio","avanzado")
nivelcurso

head(mtcars)
tail(mtcars)

my_vector <- 1:8
my_matrix <- matrix (1:9, ncol=3)
my_df <- mtcars [1:4,]
my_list <- list(my_vector, my_matrix, my_df)

my_vector
my_matrix
my_df
my_list

