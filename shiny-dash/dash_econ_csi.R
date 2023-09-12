econ_csi_UI <- function() {
  ns <- NS("econ_csi")
  tagList(
    dash_box(
      12,
      "▣ 주택가견전망",
      pre("http://www.econ.yale.edu/~shiller/data.htm")
    ),
    dash_box(
      12,
      "▣ CAPE Ratio ",
      actionBttn(ns("btn1"), "show data", color = "primary", style = "bordered"),
      DTOutput(ns("dt1"))
    )
  )
}

econ_csi_SV <- function() {
}