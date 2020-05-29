

# Cosas Varias ------------------------------------------------------------


# Este es un comentario
# Cargar librerias
library(tidyverse)
library(datasets)
library(datos)
library(lubridate)

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





vuelos %>% glimpse()


vuelos %>% 
  filter(horario_salida > 500, horario_salida < 1700) %>% 
  count(horario_salida) %>% 
  ggplot(aes(x = horario_salida, y = n)) +
  geom_line() + 
  geom_smooth(alpha = 4)


vuelos %>% 
  mutate(
    fecha_salida = paste0(anio, "-", mes, "-", dia),
    fecha_salida = ymd(fecha_salida)
  ) %>% 
  count(fecha_salida) %>% 
  ggplot(aes(fecha_salida, n)) +
  geom_line()


vuelos %>% 
  mutate(
    fecha_salida = paste0(anio, "-", mes, "-", dia),
    fecha_salida = ymd(fecha_salida),
    mes_salida = format(fecha_salida, "%Y%m") 
  ) %>% 
  count(mes_salida) %>% 
  ggplot(aes(mes_salida, n)) +
  geom_col()

vuelos %>% 
  filter(destino == "DCA") %>% 
  mutate(
    fecha_salida = paste0(anio, "-", mes, "-", dia),
    fecha_salida = ymd(fecha_salida),
    mes_salida = format(fecha_salida, "%Y%m") 
  ) %>% 
  count(fecha_salida) %>% 
  ggplot(aes(fecha_salida, n)) +
  geom_point()

vuelos %>% 
  filter(destino == "DCA") %>% 
  mutate(
    fecha_salida = paste0(anio, "-", mes, "-", dia),
    fecha_salida = ymd(fecha_salida),
    mes_salida = format(fecha_salida, "%Y%m") 
  ) %>% 
  count(mes_salida) %>% 
  ggplot(aes(mes_salida, n)) +
  geom_col()








# Cosas de Dplyr ----------------------------------------------------------

# Cuando tenemos una tabla, en general se aplican los iguientes verbos:

# Filtar

tabla1 %>% 
  filter(pais == "China")

tabla1 %>% 
  filter(pais %in% c("Brasil", "China"))

tabla1 %>% 
  filter(!pais == "Afganistán")

tabla1 %>% 
  filter(pais != "Afganistán")

tabla1 %>% 
  filter(str_detect(pais, "Ch"))

tabla1 %>% 
  select(starts_with("a"))

# Crear variables nuevas

tabla1 %>% 
  mutate(porcentaje_de_tuberculosis = casos/poblacion)
# Libreia para dar formato a las variables
library(scales)


tabla1 %>% 
  mutate(porcentaje_de_tuberculosis = casos/poblacion) %>% 
  mutate(porcentaje_de_tuberculosis = percent(porcentaje_de_tuberculosis))

tabla1 %>% 
  mutate(porcentaje_de_tuberculosis = casos/poblacion) %>% 
  mutate(porcentaje_de_tuberculosis = round(casos/poblacion*100, 2)) %>% 
  mutate(porcentaje_de_tuberculosis = percent(porcentaje_de_tuberculosis/100))

tabla1 %>% 
  mutate(
    porcentaje_de_tuberculosis = percent(round(casos/poblacion*100,2)/100)
  )

tabla1 %>% 
  mutate(
    porcentaje_de_tuberculosis = percent(
      round(
        casos/poblacion*100,2)/100
      )
  )
  
tabla1 %>% 
  mutate(
    pais = tolower(pais),
    anio = as.character(anio),
    casos = casos/1e6
  )

# select

tabla1 %>% 
  select(anio, pais)

tabla1 %>% 
  select(2,1)

tabla1 %>% 
  select(1:3)

tabla1 %>% 
  select(1,2,3)

# Resumir 


tabla1 %>% 
  summarise(casos = sum(casos))


tabla1 %>% 
  group_by(pais) %>% 
  summarise(casos = sum(casos))

tabla1 %>% 
  group_by(pais) %>% 
  summarise(casos = sum(casos),
            poblacion_promedio = mean(poblacion))

tabla1 %>% 
  group_by(pais) %>% 
  summarise(casos = sum(casos),
            poblacion_promedio = mean(poblacion)) %>% 
  ungroup() %>% 
  mutate(infectados_promedio = casos / poblacion_promedio)

# Juntar

tabla4a
tabla4b


tabla4a %>% 
  left_join(tabla4b, by = "pais")

tabla4a %>% 
  left_join(tabla4b, by = "pais", suffix = c("_casos", "_poblacion"))



tabla4b %>% 
  left_join(tabla4a, by = "pais", suffix = c( "_poblacion", "_casos"))

# spread gather

tabla4a

tabla1 %>% 
  select(1:3) %>% 
  spread(anio, casos)


tabla4a %>% 
  gather(anio, casos, -pais)



