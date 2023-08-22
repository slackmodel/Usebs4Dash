library(shiny)
library(bs4Dash)
library(thematic)
library(waiter)
library(shinyWidgets)
library(DT)

thematic_shiny()

source("dash_lib.R")
source("dash_shiller.R")

# ui ----
ui <- dashboardPage(
  fullscreen = FALSE,
  # preloader = list(html = tagList(spin_1(), "Loading ..."), color = "#343a40"),
  help = FALSE,
  # scrollToTop = TRUE,
  header = dashboardHeader(
    fixed = TRUE,
    leftUi = NULL,
    rightUi = NULL,
    title = dashboardBrand(
      title = "dashboard",
      color = "primary",
      # href = "https://adminlte.io/themes/v3",
      # image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png"
    )
  ),
  # header = dashboardHeader(
  #   skin = "dark", fixed = TRUE, compact = TRUE, title = "DASH"
  # ),
  # footer = bs4DashFooter(),
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
    width = "200px",
    inputId = "sidebarState",
    collapsed = FALSE,
    minified = FALSE,
    expandOnHover = FALSE,
    fixed = FALSE,
    startExpanded = TRUE,
    sidebarMenu(
      id = "sidebar",
      compact = TRUE,
      childIndent = TRUE,
      legacy = FALSE,
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
