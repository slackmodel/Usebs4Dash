# dash_lib.R
library(readxl)
library(lubridate)
library(xts)
library(tidyverse)
library(magrittr)
library(glue)

dt_table<- function() {
  
  
}

dash_box <- function(width = 12, title= NULL, ...) {
    box(
      width = width,
      title = title,
      solidHeader = TRUE,
      background = NULL,
      status = "primary",
      list(...)
    )
}
