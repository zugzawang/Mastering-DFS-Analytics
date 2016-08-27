# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3.0

install.packages(c(
  "brew",
  "broom",
  "crayon",
  "devtools",
  "dplyr",
  "evaluate",
  "ggplot2",
  "googlesheets",
  "pbdZMQ",
  "praise",
  "readr",
  "readxl",
  "repr",
  "roxygen2",
  "RSQLite",
  "testthat",
  "tidyr",
  "uuid"),
  quiet = TRUE)
devtools::install_github("IRkernel/IRdisplay", build_vignettes = TRUE)
devtools::install_github("IRkernel/IRkernel", build_vignettes = TRUE)
