
library(shiny)
library(bslib)
library(tidyverse)
library(DT)
library(modeest)

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

