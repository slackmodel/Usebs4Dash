library(reticulate)
os <- import("os")
os$listdir(".")

library(reticulate)
version <- "3.9.12"
install_python(version)
virtualenv_create("my-environment", version = version)
use_virtualenv("my-environment")