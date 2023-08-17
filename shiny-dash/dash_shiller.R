# dash_shiller.R

siller_MENU <- function() {
  tagList(
    menuItem(
      text = "Item List 1",
      icon = icon("bars"),
      startExpanded = TRUE,
      menuSubItem(
        text = "Item 1",
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

siller_UI <- function(id) {
  ns <- NS(id)
  tagList(
    box(
      solidHeader = FALSE,
      title = "siller 1",
      background = NULL,
      width = 12,
      status = "primary",
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

siller_SV <- function(id) {
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
