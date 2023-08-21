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
      actionBttn(ns("btn1"), "조회"),
      DTOutput(ns("dt1"))
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
      
      # re1 ----
      re1 <- eventReactive(list(input$btn1), {
        message("re1")
        ie_data <- read_excel("ie_data.xls", sheet = "Data", skip = 7)
        ie_data <- ie_data %>% mutate(Date = format(Date, nsmall = 2))
      })

      output$dt1 <- renderDT({
        dt1 <- re1()
        # datatable(
        #   iris,
        #   extensions = "Buttons", options = list(
        #     dom = "Bfrtip",
        #     buttons = c("copy", "csv", "excel", "pdf", "print")
        #   )
        # )
        DT::datatable(dt1,
          extensions = c("Buttons", "Scroller"),
            selection = "none",
          options = list(
            # dom = "Bt",
            dom = 'Bfrtip',
            autoWidth = TRUE,
            paging = FALSE,
            scrollX = TRUE,
            scrollY = "250px",
            buttons = c('copy', 'csv', 'excel', 'pdf', 'print')
            
          )
        ) %>%
          DT::formatStyle(names(dt1), lineHeight = "20%") %>% 
          # DT::formatDate("Date", method = "toLocaleDateString") %>% 
          DT::formatRound(2:length(dt1), digits = 2)
      })
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
