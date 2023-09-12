library(shiny)
library(bs4Dash)
library(thematic)
library(waiter)
library(shinyWidgets)
library(DT)
library(plotly)

thematic_shiny()

source("app_lib.R")
source("dash_econ.R")

# UI ----
ui_style <- function() {
  tags$head(tags$style("
    "))
}

ui_sidebar <- function() {
  bs4DashSidebar(
    skin = "light",
    # width = "200px",
    inputId = "sidebar",
    collapsed = FALSE,
    minified = FALSE,
    expandOnHover = TRUE,
    fixed = TRUE,
    startExpanded = TRUE,
    sidebarMenu(
      id = "sidebar",
      compact = TRUE,
      childIndent = TRUE,
      legacy = FALSE,
      econ_MENU()
    )
  )
}

ui_body <- function() {
  dashboardBody(
    ui_style(),
    # div(class = "tab-content", function())
    tabItems(
      tabItem(tabName = "tab1", econ_shiller_UI())
      # tabItem(tabName = "tab1", econ_csi("econ_csi"))
      # tabItem(tabName = "tab2", econ_UI("econ"))
    )
  )
}

# SERVER ----
server <- function(input, output, session) {
  econ_shiller_SV()
}

ui <- dashboardPage(
  help = NULL,
  fullscreen = FALSE,
  # preloader = list(html = tagList(spin_1(), "Loading ..."), color = "#343a40"),
  # scrollToTop = TRUE,
  header = dashboardHeader(
    skin = "dark", fixed = FALSE, compact = TRUE, title = "DASH"
  ),
  footer = bs4DashFooter(),
  controlbar = NULL,
  # controlbar = dashboardControlbar(
  #   skin = "light",
  #   sliderInput(
  #     inputId = "controller",
  #     label = "Update the first tabset",
  #     min = 1,
  #     max = 6,
  #     value = 2
  #   )
  # ),
  sidebar = ui_sidebar(),
  body = ui_body(),
)


shinyApp(ui, server)
