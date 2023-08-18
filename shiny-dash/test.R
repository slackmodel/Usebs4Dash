library(reticulate)
os <- import("os")
os$listdir(".")

library(reticulate)
version <- "3.9.12"
install_python(version)
virtualenv_create("my-environment", version = version)
use_virtualenv("my-environment")


rsconnect::setAccountInfo(
  name = "slackmodel",
  token = "0D45860810696C5D8CA57636F9853330",
  secret = "<SECRET>"
)

library(rsconnect)
rsconnect::deployApp("path/to/your/app")


library(readxl)
ie_data <- read_excel("shiny-dash/ie_data.xls", sheet = "Data", skip = 7)
