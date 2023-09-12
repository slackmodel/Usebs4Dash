# dash_shiller.R

econ_MENU <- function() {
  tagList(
    menuItem(
      text = "DATA",
      # icon = icon("bars"),
      startExpanded = TRUE,
      menuSubItem(
        text = "Shiller ",
        tabName = "tab1",
        icon = icon("table")
      ),
      menuSubItem(
        text = "주택가격전망 CSI",
        tabName = "tab2",
        icon = icon("table")
      ),
      menuSubItem(
        text = "경기 순환변동치",
        tabName = "tab2",
        icon = icon("table")
      )
    ),
  )
}

source("dash_econ_shiller.R")
source("dash_econ_csi.R")
