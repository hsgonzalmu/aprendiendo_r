library(tidyverse)
library(datasets)
library(datos)

select(aviones,fabricante,modelo)

aviones %>% 
  filter(anio == 2004) %>% 
  filter()
  glimpse()

vuelos %>% 
  select(atraso_salida, aerolinea, fecha_hora) %>% 
  arrange(atraso_salida) %>% 
  filter(aerolinea =="AA") %>% 
  glimpse()

media_atrasos_AA <- group_by(vuelos, atraso_salida) %>%  
  summarise(media_atrasos_AA, atrasos_salida) %>% 
  glimpse()
  



