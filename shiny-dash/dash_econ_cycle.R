econ_cycle_UI <- function() {
  ns <- NS("econ_cycle")
  tagList(
    dash_box(
      12,
      "▣ 경기순환변동치",
      pre(glue(
        .sep = "\n",
       "<통계표 메타자료>",
       " ○ 통계표ID : DT_1C8015",
       " ○ 통계표명 : 경기종합지수(2020=100)(10차) ",
       " ○ 출처 : KOSIS(「경기종합지수」, 통계청)",
       " ○ 통계표URL : https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1C8015&conn_path=I3",
       " 경기종합지수 중 동행종합지수는 최근 3개월, 선행종합지수 및 후행종합지수는 최근 2개월이 잠정치입니다."
      ))
    ),
    dash_box(
      12,
      "▣ 경기순환 변동치 ",
      actionBttn(ns("btn1"), "show data", color = "primary", style = "bordered"),
      DTOutput(ns("dt1"))
    )
  )
}

fun_econ_cycle <- function() {
  message("fun_econ_cycle")
  
  dt1 <- read_csv("data/101_DT_1C8015.csv", locale = locale(encoding = "cp949"))
  dt1 %>% select(1:3)
}

econ_cycle_SV <- function() {
  moduleServer(
    "econ_cycle",
    function(input, output, session) {
      # re1 ----
      re1 <- eventReactive(list(input$btn1),
        {
          fun_econ_cycle()
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
