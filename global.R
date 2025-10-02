
library(jpeg)
library(recolorize)
library(shiny)
library(bslib)
library(tidyverse)
library(DT)
library(modeest)
library(readxl)

# d <- read_delim("28201(1).csv", delim = "\t") %>%
#   mutate(Total = gsub("\\.", "", Total),
#          Total = gsub(",", ".", Total),
#          Total = gsub("-", "", Total),
#          Total = as.numeric(Total)
#          ) %>%
#   set_names(c("comunidad", "edad", "sexo", "periodo", "salario"))
# 
# saveRDS(d, file = "ine.rds")

d_ine <- readRDS("ine.rds")

# raw_d <- readJPEG("1-s2.0-S277227592200017X-gr4.jpg")

# d_image <- c(1:3) %>%
#   map(.,
#       ~ raw_d[,,.x] %>%
#         as_tibble() %>%
#         mutate(x = row_number()) %>%
#         pivot_longer(-x, names_to = "y") %>%
#         mutate(y = gsub("V", "", y),
#                y = as.integer(y))
#   ) %>%
#   map2_dfr(., c("R", "G", "B"),
#            ~ mutate(.x, colour = .y)
#   ) %>%
#   pivot_wider(names_from = colour, values_from = value)

d_image <- read_tsv("raw_data.csv")

