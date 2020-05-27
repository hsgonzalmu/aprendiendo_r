# Este es un comentario
# Cargar librerias
library(tidyverse)
library(datasets)
library(datos)

# Como pedir ayuda

?datosewq

aerolineas %>% view()

aeropuertos

?aeropuertos

aviones

?vuelos

vuelos

vuelos %>% glimpse()

# Ocuparemos las funciones de la libreria dplyr
# dplyr tiene las siguientes funciones: filtrar, crear variable, resumir, juntar tablas, agrupar, desacgrupar
# seleccionar

vuelos %>%  
  filter(vuelo == 461) %>% 
  glimpse()
  
aeropuertos_de_origen <- aeropuertos %>% 
  select(codigo_aeropuerto, nombre) %>% 
  rename(origen = codigo_aeropuerto,
         nombre_origen = nombre)

aeropuertos_de_origen

aeropuertos_destino <- aeropuertos %>% 
  select(codigo_aeropuerto, nombre) %>% 
  rename(destino = codigo_aeropuerto,
         nombre_destino = nombre)

aeropuertos_destino

vuelos %>%  
  filter(vuelo == 461) %>% 
  left_join(aeropuertos_de_origen) %>% 
  left_join(aeropuertos_destino) %>% 
  glimpse()

vuelos_461 <- vuelos %>%  
  filter(vuelo == 461) %>% 
  left_join(aeropuertos_de_origen) %>% 
  left_join(aeropuertos_destino) 

vuelos_461
vuelos_461 %>% glimpse()

vuelos_461 %>% 
  count(nombre_origen, nombre_destino)

#NUEVO COMENTARIO

