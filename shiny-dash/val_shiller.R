# val_shiller.R

library(readxl)
library(lubridate)
library(xts)
library(tidyverse)
library(magrittr)

ie_data <- read_excel("ie_data.xls", sheet = "Data",  skip = 7 )
ie_data %>% mutate( Date = ym(as.character(Date)))
ie_data$Date %>% as.character() %>% ym() 

ie_data %<>% mutate( Date = ym(as.character(Date)))

dt1 <- ie_data %>% mutate( Date = format(Date, nsmall = 2))

ie_data %>% DT::datatable() 
dt1 %>% DT::datatable() 
zoo::yearmon()
