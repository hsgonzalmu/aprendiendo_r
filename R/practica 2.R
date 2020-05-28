library(tidyverse)
library(datasets)
library(datos)
vuelos
vuelos %>% glimpse()
vuelos %>% 
  filter(vuelos == 1545) %>% 
  glimpse()
aviones %>% view()
library(tidyverse)
library(datasets)
library(datos)
vuelos %>% 
  filter(vuelo == 1545) %>% 
  glimpse()

aeropuertos_de_origen <- aeropuertos %>% 
  select(codigo_aeropuerto,nombre) %>% 
  rename(origen=codigo_aeropuerto, nombre_origen=nombre)

aeropuertos_de_origen

aeropuertos_de_destino <- aeropuertos %>% 
  select(codigo_aeropuerto,nombre) %>% 
  rename(destino=codigo_aeropuerto, nombre_destino=nombre)

aeropuertos_de_destino

aeropuertos_de_origen %>% view()

vuelos %>%  
  filter(vuelo == 461) %>% 
  left_join(aeropuertos_de_origen) %>% 
  left_join(aeropuertos_de_destino) %>% 
  glimpse()

vuelos_461 <- vuelos %>%  
  filter(vuelo == 461) %>% 
  left_join(aeropuertos_de_origen) %>% 
  left_join(aeropuertos_de_destino) 

vuelos_461
vuelos_461 %>% glimpse()

vuelos_461 %>% 
  count(nombre_origen, nombre_destino)

vuelos_461 %>% view()
