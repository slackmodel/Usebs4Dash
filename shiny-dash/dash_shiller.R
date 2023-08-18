# dash_shiller.R

shiller_MENU <- function() {
  tagList(
    menuItem(
      text = "Shiller",
      # icon = icon("bars"),
      startExpanded = TRUE,
      menuSubItem(
        text = "Shiller 1",
        tabName = "tab1",
        icon = icon("table")
      ),
      menuSubItem(
        text = "Item 2",
        tabName = "tab2",
        icon = icon("circle")
      )
    ),
  )
}

shiller_UI <- function(id) {
  ns <- NS(id)
  tagList(
    dash_box(
      12,
      "▣ 1. ",
      pre("http://www.econ.yale.edu/~shiller/data.htm")
    ),
    dash_box(
      12,
      "▣ 2. ",
      plotOutput("distPlot")
    )
  )
  # shiny::tagList(
  #   tabItem(
  #     tabName = "tab1",
  #   ),
  #   # tabItem(
  #   #   tabName = "tab2",
  #   #   checkboxGroupInput(
  #   #     "variable", "Variables to show:",
  #   #     c(
  #   #       "Cylinders" = "cyl",
  #   #       "Transmission" = "am",
  #   #       "Gears" = "gear"
  #   #     )
  #   #   ),
  #   #   tableOutput("data")
  #   # )
  # )
}

shiller_SV <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # count <- reactiveVal(0)
      #
      # observeEvent(input$button, {
      #   count(count() + 1)
      # })
      #
      # set.seed(122)
      # histdata <- rnorm(500)
      #
      # output$plot1 <- renderPlot({
      #   data <- histdata[seq_len(input$slider)]
      #   hist(data)
      # })
      #
      # output$out <- renderText({
      #   count()
      # })
      # count
    }
  )
}
