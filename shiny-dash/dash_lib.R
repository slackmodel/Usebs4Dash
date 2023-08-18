# dash_lib.R

dash_box <- function(width = 12, title= NULL, ...) {
    box(
      width = width,
      title = title,
      solidHeader = TRUE,
      background = NULL,
      status = "primary",
      list(...)
    )
}
