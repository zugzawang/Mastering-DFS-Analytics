# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3.0

install.packages(c(
  "bookdown",
  "devtools",
  "googlesheets",
  "pbdZMQ",
  "repr",
  "roxygen2",
  "RSQLite",
  "tidyverse"),
  quiet = TRUE)
devtools::install_github("IRkernel/IRdisplay", build_vignettes = TRUE)
devtools::install_github("IRkernel/IRkernel", build_vignettes = TRUE)
devtools::install_github("rstudio/bookdown", build_vignettes = TRUE)
print("Install finished")
