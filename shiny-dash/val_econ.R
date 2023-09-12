# val_shiller.R
library(readxl)
library(lubridate)
library(xts)
library(tidyverse)
library(magrittr)

ie_data <- read_excel("ie_data.xls", sheet = "Data", skip = 7)
ie_data %<>%
  filter(!is.na(Date)) %>%
  select_if(negate(is_logical)) %>%
  # mutate(Date = ym(as.character(Date)))
  mutate(Date = format(Date, nsmall = 2))

ie_data %<>% rename(
  "S&P Comp. P" = 2,
  "Dividend D" = 3,
  "Earnings E" = 4,
  "CPI" = 5,
  "Date Fraction" = 6,
  "Long Interest Rate GS10" = 7,
  "Real Price" = 8,
  "Real Dividend" = 9,
  "Real Total Return Price" = 10,
  "Real Earnings" = 11,
  "Real TR Scaled Earnings" = 12,
  "CAPE" = 13,
  "TR CAPE" = 14,
  "Excess CAPE Yield" = 15,
  "Monthly Total Bond Returns" = 16,
  "Real Total Bond Returns" = 17,
  "10 Year Annualized Stock Real Return" = 18,
  "10 Year Annualized Bonds Real Return" = 19,
  "Real 10 Year Excess Annualized Returns" = 20
)

ie_data %>% DT::datatable()
dt1 %>% DT::datatable()
zoo::yearmon()

ie_data %>% filter(Date == "     NA")

library(plotly)

ay <- list(
  tickfont = list(color = "red"),
  overlaying = "y",
  side = "right",
  title = "<b>S&P comp.</b>")

ie_data %<>% mutate(Date = ym(Date))
plot_ly(ie_data, x = ~Date, y = ~CAPE, type = "scatter", mode = "lines", name = "CAPE") %>%
  add_trace(y = ~`TR CAPE`, type = "scatter", mode = "lines", name = "TR CAPE") %>%
  add_trace(ie_data, x = ~Date,  y = ~`S&P Comp. P`, type = "scatter", mode = "lines", name = "S&P", yaxis = "y2") %>% 
  layout(
    xaxis = list(),
    yaxis = list(
      nticks = 6,
      tickvals = c(0, 10, 20, 30, 40, 50)
    ),
    yaxis2 = ay
  )
