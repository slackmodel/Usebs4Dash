library(bs4Dash)
library(shinyWidgets)

message(getwd())
source("dash_shiller.R")

# ui ----
ui <- dashboardPage(
  header = dashboardHeader(skin = "dark"),
  footer = bs4DashFooter(),
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
    fixed = FALSE,
    sidebarMenu(
      id = "sidebar",
      compact = FALSE,
      childIndent = TRUE,
      legacy = TRUE,
      siller_MENU()
    )
  ),
  body = dashboardBody(
    tabItems(
      tabItem(tabName = "tab1", siller_UI("siller"))
    )
  ),
)

server <- function(input, output, session) {
  siller_SV("siller")
}

shinyApp(ui, server)