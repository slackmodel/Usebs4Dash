library(shiny)
library(bs4Dash)
library(thematic)
library(waiter)
library(shinyWidgets)

thematic_shiny()

source("dash_lib.R")
source("dash_shiller.R")

# ui ----
ui <- dashboardPage(
  fullscreen = TRUE,
  header = dashboardHeader(skin = "dark", fixed = FALSE, compact = TRUE,
                           title = "DASH"),
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
  sidebar = bs4DashSidebar(
    skin = "light",
    inputId = "sidebarState",
    collapsed = TRUE,
    minified = FALSE,
    expandOnHover = TRUE,
    fixed = TRUE,
    sidebarMenu(
      id = "sidebar",
      compact = FALSE,
      childIndent = TRUE,
      legacy = TRUE,
      shiller_MENU()
    )
  ),
  body = dashboardBody(
    tabItems(
      tabItem(tabName = "tab1", shiller_UI("shiller"))
    )
  ),
)

server <- function(input, output, session) {
  shiller_SV("shiller")
}

shinyApp(ui, server)
