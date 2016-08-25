# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3.0

install.packages(c(
  "broom",
  "devtools",
  "dplyr",
  "ggplot2",
  "pbdZMQ",
  "readr",
  "readxl",
  "tidyr"),
  quiet = TRUE)
devtools::install_github("IRkernel/IRdisplay", build_vignettes = TRUE)
devtools::install_github("IRkernel/IRkernel", build_vignettes = TRUE)
