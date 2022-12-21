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

#EDA 


plot(mtcars$mpg~mtcars$cyl, 
     xlab= "cilindros", ylab = "millas por galon",
      main = "relación entre cilindros y millas por galon")

plot(orangeec$Unemployment ~ orangeec$Education.invest...GDP, 
     xlab= "inversión en educación (%PIB)",
     ylab = "desempleo",
     main = "Relacion Inversión en educación y desempleo")

plot(orangeec$GDP.PC ~ orangeec$Creat.Ind...GDP, 
     xlab= "Aporte economia naranja al PIB (%)",
     ylab = "PIB per capita",
     main = "Relacion entre economía naranja y PIB per capita")


#histograma mtcars

qplot(mtcars$hp,
      geom = "histogram",
      xlab = "caballos de fuerza",
      main = "Carros según caballos de fuerza")


ggplot(mtcars, aes(x=hp)) + 
  geom_histogram (binwidth = 30) +
  labs(x= "caballos de fuerza" , y= "cantidad de carros", 
       title= "caballos de fuerza en carros seleccionados") +
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(),
    panel.grid.minor = element_blank())

ggplot() + geom_histogram (data = mtcars,
                           aes (x=hp), fill = "blue", color = "red",
                           binwidth = 20) + 
  labs(x= "caballos de fuerza" , y= "cantidad de carros", 
       title= "caballos de fuerza en carros seleccionados") + 
  xlim (c(80,280)) +   theme(legend.position = "none")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
  # hist orangeec


ggplot() + geom_histogram (data = orangeec,
                           aes (x=GDP.PC), fill = "blue", color = "red",
                           binwidth = 2000) + 
  labs(x= "pib per capita" , y= "cantidad de paises", 
       title= "pib per capita en paises latam") + 
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

#
ggplot() + geom_histogram (data = orangeec,
                           aes (x=Creat.Ind...GDP), fill = "blue", color = "red",
                           binwidth = 1) + 
  labs(x= "aporte de la economia naranja al pib(%)" , y= "cantidad de paises", 
       title= "Contribución de la economia naranja al pib en paises latam") + 
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
#
ggplot() + geom_histogram (data = orangeec,
                           aes (x=Internet.penetration...population), fill = "red", color = "yellow",
                           binwidth = 5) + 
  labs(x= "Penetración de internet(%) de la población)" , y= "cantidad de paises", 
         title= "penetración del internet en paises latam") + 
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# boxplots

boxplot(mtcars$hp, 
        ylab = "caballos de fuerza",
        main = "caballos de fuerza en carros mtcars")
#usando ggplot

ggplot (mtcars, aes(x=as.factor(cyl),y=hp, fill = cyl)) + 
  geom_boxplot(alpha = 0.7)+
  labs(x= "cilindros" , y= "caballos de fuerza", 
       title= "caballos de fuerza segun los cilindros")  +
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

#

mtcars$am <- factor (mtcars$am, levels=c(TRUE,FALSE), 
                     labels = c("Manual" , "Automático"))
  

ggplot(mtcars, aes(x=am, y=mpg, fill = am)) + 
  geom_boxplot(alpha = 1) + 
  labs(x= "Tipo de caja" , y= "millas por galon", 
       title= "caballos de fuerza segun la caja")  +
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# 

economy <- mean(orangeec$GDP.PC)
       
orangeec <- orangeec %>% 
  mutate (Strong_economy = ifelse (GDP.PC < economy, 
                                   "por debajo del pib per capita",
                                   "Arriba del promedio del pib per capita"))
# 
ggplot (orangeec, aes(x=Strong_economy, y = Creat.Ind...GDP,
                    fill=Strong_economy)) + 
  geom_boxplot (alpha = 0.4) + 
  labs (x = "tipo de pais", y= "aporte de la economia naranja al pib",
        title = " aporte de la economia naranja en pib de paises LATAM con alto y bajo pib per capita")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

#
ggplot (orangeec, aes(x=Strong_economy, y = Internet.penetration...population,
                      fill=Strong_economy)) + 
  geom_boxplot (alpha = 0.4) + 
  labs (x = "tipo de pais", y= "penetración de internet (%)",
        title = " penetración de internet en paises LATAM con alto y bajo pib per capita")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


