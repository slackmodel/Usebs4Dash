library(bs4Dash)
ui <- dashboardPage(
  header = dashboardHeader(skin = "dark"),
  body = dashboardBody(
    tabItems(
      tabItem(
        tabName = "tab1",
        sliderInput("obs", "Number of observations:",
                    min = 0, max = 1000, value = 500
        ),
        plotOutput("distPlot")
      ),
      tabItem(
        tabName = "tab2",
        checkboxGroupInput(
          "variable", "Variables to show:",
          c(
            "Cylinders" = "cyl",
            "Transmission" = "am",
            "Gears" = "gear"
          )
        ),
        tableOutput("data")
      ),
      tabItem(
        tabName = "tab3",
        checkboxInput("val", "Some value", FALSE),
        textOutput("value")
      ),
      tabItem(
        tabName = "tab4",
        "Nothing special here!"
      ),
      tabItem(
        tabName = "tab5",
        "Tab 5"
      ),
      tabItem(
        tabName = "tab6",
        "Tab 6"
      ),
      tabItem(
        tabName = "tab7",
        "Tab 7"
      )
    )
  ),
  sidebar = bs4DashSidebar(
    skin = "light",
    inputId = "sidebarState",
    collapsed = TRUE,
    minified = FALSE,
    expandOnHover = FALSE,
    fixed = FALSE,
    sidebarMenu(
      id = "sidebar",
      menuItem(
        text = "Tab 1",
        tabName = "tab1",
        icon = icon("van-shuttle")
      ),
      menuItem(
        text = "Tab 2",
        tabName = "tab2",
        icon = icon("shuttle-space"),
        selected = TRUE
      ),
      menuItem(
        text = "Item List 1",
        icon = icon("bars"),
        startExpanded = TRUE,
        menuSubItem(
          text = "Item 3",
          tabName = "tab3",
          icon = icon("circle")
        ),
        menuSubItem(
          text = "Item 4",
          tabName = "tab4",
          icon = icon("circle")
        )
      ),
      menuItem(
        text = "Item List 2",
        icon = icon("bars"),
        startExpanded = FALSE,
        menuSubItem(
          text = "Item 5",
          tabName = "tab5",
          icon = icon("circle")
        ),
        menuSubItem(
          text = "Item 6",
          tabName = "tab6",
          icon = icon("circle")
        )
      ),
      menuItem(
        text = "Tab 7",
        tabName = "tab7",
        icon = icon("house")
      )
    )
  ),
  controlbar = dashboardControlbar(
    skin = "light",
    sliderInput(
      inputId = "controller",
      label = "Update the first tabset",
      min = 1,
      max = 6,
      value = 2
    )
  ),
  footer = bs4DashFooter()
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)