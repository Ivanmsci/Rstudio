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

economy
       
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

# scatter plot ggplot dos variables


ggplot (mtcars, aes(wt,hp)) + 
  geom_point () +
  labs (x= "peso", "caballos de fuerza",
        tittle = "relación de peso con caballos de fuerza")

ggplot (mtcars, aes(hp,mpg)) + 
  geom_point () +
  labs (x= "caballos de fuerza", "millas por galon",
        tittle = "millas por galon y hp")



#



ggplot(mtcars, aes (hp, qsec)) + 
  geom_point(aes(color = am, size = cyl))+
  labs (x="caballos de fuerza", y="tiempo en 1/4 de milla",
        tittle = "caballos-velocidad según cilindraje y tipo de caja")

# scatter plot ggplot dos variables orangeec

ggplot(orangeec, aes (Internet.penetration...population, Creat.Ind...GDP)) + 
  geom_point(aes(color = factor(Strong_economy), size = GDP.Growth..))+
  labs (x="penetración de internet", y="Aporte economia naranja PIB",
        tittle = "Internet y aporte economía naranja según economia y crecimiento del PIB")



#
library(plotly)
my_graph <- ggplot(orangeec, aes(orangeec$Internet.penetration...population,
                                 orangeec$Creat.Ind...GDP, label = row.names(orangeec))) +
  geom_point () + labs (x = " penetración de internet", y = "aporte a economia naranja",
               title = "penetracion de internet y aporte a economia naranja")

p = ggplotly (my_graph)

p


#

pairs(mtcars[, 2:6])

# 

newdata <- subset(mtcars, select = c ( 2, 7:8, 11, 12))
pairs (newdata)

#

Eficientes <- filter(mtcars, mpg >= 30)
Eficientes 

pairs (Eficientes[, 2:6])


#

merc <- mtcars %>%
  filter(str_detect(model, "Merc"))
merc


pairs (merc[, 2:6])


cor(mtcars[, 2:6])


cor(newdata)

#correlaciones orangeec

pairs(orangeec[, 2:6])

#

newdata <- subset(orangeec, select = c(5,6,10,11,12,13))
newdata
pairs (newdata)

cor(newdata)

cor(orangeec[,2:6], use = "complete.obs")

cor(newdata, use = "complete.obs")

summary(mtcars)

stdev <- sd(mtcars$mpg)
prom <- mean(mtcars$mpg)
#
CV <- ((stdev)/(prom))*100
CV
stdev
#el resultado es mayor que 25% por lo que no es viable hacer 
#suposiciones basadas en el promedio

stdev2 <- sd(orangeec$Creat.Ind...GDP, na.rm = TRUE)
prom2 <- mean(orangeec$Creat.Ind...GDP, na.rm = TRUE)

CV2 <- ((stdev2)/(prom2))*100
CV2


prom2
stdev2


# clase 30

eficientes <- mean(mtcars$mpg)
eficientes
mtcars <- mtcars %>%
  mutate(mas_eficientes = ifelse(mpg < eficientes, "por debajo del pormedio",
                                 "superior al promedio"))
mas_veloces <- mtcars[mtcars$qsec<16,]  
mas_veloces

mtcars <- mtcars %>%
  mutate(velocidad_cuarto_milla = ifelse(qsec < 16, "menor a 16 segundos",
                                         "mayor a 16 segundos"))
mtcars <- mtcars %>% 
  mutate (peso_kilos = (wt/2.22)*1000)

mtcars <- mtcars %>% 
  mutate (peso = ifelse(peso_kilos <= 1500, "livianos", 
                        "pesados"))
  
#clase 31

orangeec <- orangeec %>% 
  mutate (cresimiento_GDP = ifelse(orangeec$GDP.Growth.. >= 2.5, "2.5% o mas", 
                        "menos del 2.5%"))


orangeec <- orangeec %>% 
  mutate (anarajados = ifelse(orangeec$Creat.Ind...GDP >= 2.5, "mas anaranjados", 
                                   "menos anaranjados"))
#ranking
orangeec %>% 
  arrange(desc(orangeec$Creat.Ind...GDP))

topnaranjas <- orangeec %>% 
  filter (Country %in% c("Mexico", "Panama", "Colombia", "Brazil"))

topnaranjas


#clase 32

mtcars %>%
  arrange(desc (peso_kilos))

mas_pesados <- mtcars %>% 
  filter(model %in% c ( "Lincoln Continental", "Chrisler Imperial", 
                        "Cadillac Fleetwood", "Merc 450SE" ))
mas_pesados

ggplot(mas_pesados, aes(x=hp, y=mpg)) + 
  geom_point() + 
  facet_wrap(~model)

ggplot(mas_pesados, aes(x=cyl, y=mpg, size = peso)) + 
  geom_point() + 
  facet_wrap(~am)

#clase 33

ggplot(topnaranjas, aes(x=Internet.penetration...population,
                        y=Services...GDP, size = GDP.PC)) +
  geom_point() +
  facet_wrap (~Country)

#

ggplot(topnaranjas, aes(x=Education.invest...GDP,
                        y=Creat.Ind...GDP, size = Unemployment)) +
  geom_point() +
  facet_wrap (~Country)

myColors <- brewer.pal(7,"Greens")


ggplot(topnaranjas, aes(x=Internet.penetration...population,
                        y=GDP.PC, fill = Creat.Ind...GDP)) +
  geom_tile() +
  facet_wrap (~Country)+
  scale_fill_gradientn(colors=myColors)


