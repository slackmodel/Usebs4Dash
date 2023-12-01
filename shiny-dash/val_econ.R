# val_shiller.R
library(readxl)
library(lubridate)
library(xts)
library(tidyverse)
library(magrittr)


# csi bok ----
remotes::install_github("opensdmx/rsdmx")
library(rsdmx)
library(ecos)

ecos.setKey("your_api_key")


read_csv( "소비자동향조사(전국, 월, 2008.9~)_20002158.csv")

getwd()

read_excel("./data/소비자동향조사(전국, 월, 2008.9~)_28003114.xlsx", sheet = "데이터", skip = 6) 
read_csv("data/101_DT_1C8015.csv", locale = locale(encoding = "cp949")) %>% select(1:3)




# shiller  ---- 
setwd(glue::glue(rstudioapi::getActiveProject(), "/shiny-dash"))
download.file(url = "http://www.econ.yale.edu/~shiller/data/ie_data.xls", destfile = "ie_data.xls", mode = "wb")



library(rsdmx)
dsd <- readSDMX(file = "./data/511Y002/511Y002_dsd.xml", isURL = FALSE)

cls <- slot(dsd, "codelists")
codelists <- sapply(slot(cls, "codelists"), function(x) slot(x, "id"))
codelist <- as.data.frame(slot(dsd, "codelists"), codelistId = "G00024") 

concepts <- as.data.frame(slot(dsd, "concepts"))


dataset <- readSDMX(file = "./data/511Y002/511Y002generic.xml", isURL = FALSE, dsd =TRUE) 
as.data.frame(dataset, labels = TRUE) %>% head() %>% as_tibble()
as.data.frame(dataset, labels = TRUE) %>% head() 
as.data.frame(dataset) %>% head() 

tmp <- system.file("extdata","Example_Eurostat_2.0.xml", package="rsdmx")
sdmx <- readSDMX(tmp, isURL = FALSE)
stats <- as.data.frame(sdmx)
head(stats)

