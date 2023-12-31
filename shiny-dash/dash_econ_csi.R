econ_csi_UI <- function() {
  ns <- NS("econ_csi")
  tagList(
    dash_box(
      12,
      "▣ 주택가격전망",
      pre(glue(
        .sep = "\n",
        "https://ecos.bok.or.kr/",
        "6.2.1. 소비자동향조사(전국, 월, 2008.9~)",
        "물가전망조사-주택가격전망CSI"
      ))
    ),
    dash_box(
      12,
      "▣ CAPE Ratio ",
      actionBttn(ns("btn1"), "show data", color = "primary", style = "bordered"),
      DTOutput(ns("dt1"))
    )
  )
}

fun_econ_csi <- function() {
  message("fun_econ_csi")
  dt1 <- read_excel("./data/소비자동향조사(전국, 월, 2008.9~)_28003114.xlsx", sheet = "데이터", skip = 6) 
  dt1
}

econ_csi_SV <- function() {
  moduleServer(
    "econ_csi",
    function(input, output, session) {
      # re1 ----
      re1 <- eventReactive(list(input$btn1),
        {
          fun_econ_csi()
        },
        # ignoreInit = TRUE
        ignoreInit = FALSE
      )

      output$dt1 <- renderDT({
        dt1 <- re1()
        
        dt1 %>%
          # select(Date, CAPE, `TR CAPE`, everything()) %>%
          DT::datatable(
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
          DT::formatStyle(names(dt1), lineHeight = "20%")# %>%
          # DT::formatDate("Date", method = "toLocaleDateString") %>%
          # DT::formatRound(2:length(dt1), digits = 2)
      })
    }
  )
}
