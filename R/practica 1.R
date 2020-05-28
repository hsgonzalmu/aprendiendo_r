library(tidyverse)
library(datasets)
library(datos)

aviones %>%
  filter(asientos>200) %>% 
  glimpse()

asientos_mas_200pax <-aviones %>% 
  filter(asientos>200) %>% 
  filter(anio>2000) %>% 
  glimpse()

asientos_mas_200pax

vuelos_mas_200pax <-vuelos %>% 
  select(codigo_cola, origen, destino) %>%
  filter(origen == "JFK") %>%
  glimpse()

vuelos_mas_200pax


resultado <- asientos_mas_200pax %>% 
  left_join(vuelos_mas_200pax) %>% 
  glimpse()
