econ_shiller_UI <- function() {
  ns <- NS("econ_shiller")
  tagList(
    dash_box(
      12,
      "▣ CAPE Ratio source",
      pre(glue(
        .sep = "\n",
        "CAPE : Cyclically Adjusted Price Earnings Ratio",
        "TR CAPE : Cyclically  Adjusted Total Return Price Earnings Ratio",
        "http://www.econ.yale.edu/~shiller/data.htm"
      ))
    ),
    dash_box(
      12,
      "▣ CAPE Ratio ",
      actionBttn(ns("btn1"), "show data", color = "primary", style = "bordered"),
      plotlyOutput(ns("pl1")),
      hr(),
      br(),
      DTOutput(ns("dt1"))
    )
  )
}

fun_econ_shiller <- function() {
  message("fun_econ_shiller")
  ie_data <- read_excel("ie_data.xls", sheet = "Data", skip = 7) %>%
    filter(!is.na(Date)) %>%
    select_if(negate(is_logical)) %>%
    mutate(Date = format(Date, nsmall = 2)) %>%
    arrange(desc(Date))

  ie_data %>% rename(
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
}

econ_shiller_SV <- function() {
  moduleServer(
    "econ_shiller",
    function(input, output, session) {
      # re1 ----
      re1 <- eventReactive(list(input$btn1),
        {
          fun_econ_shiller()
        },
        # ignoreInit = TRUE
        ignoreInit =FALSE 
      )

      output$dt1 <- renderDT({
        dt1 <- re1()
        DT::datatable(dt1,
          extensions = c("Buttons", "Scroller"),
          selection = "none",
          options = list(
            # dom = "Bt",
            dom = "Bfrtip",
            autoWidth = TRUE,
            paging = TRUE,
            scrollX = TRUE,
            scrollY = "250px",
            buttons = c("copy", "csv", "excel", "pdf", "print")
          )
        ) %>%
          DT::formatStyle(names(dt1), lineHeight = "20%") %>%
          # DT::formatDate("Date", method = "toLocaleDateString") %>%
          DT::formatRound(2:length(dt1), digits = 2)
      })

      output$pl1 <- renderPlotly({
        ie_data <- re1()
        ay <- list(
          tickfont = list(color = "red"),
          overlaying = "y",
          side = "right",
          title = "<b>S&P comp.</b>"
        )

        ie_data %<>% mutate(Date = ym(Date))
        plot_ly(ie_data, x = ~Date, y = ~CAPE, type = "scatter", mode = "lines", name = "CAPE") %>%
          add_trace(y = ~`TR CAPE`, type = "scatter", mode = "lines", name = "TR CAPE") %>%
          add_trace(ie_data, x = ~Date, y = ~`S&P Comp. P`, type = "scatter", mode = "lines", name = "S&P", yaxis = "y2") %>%
          layout(
            xaxis = list(),
            yaxis = list(
              nticks = 6,
              tickvals = c(0, 10, 20, 30, 40, 50)
            ),
            yaxis2 = ay
          )
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
