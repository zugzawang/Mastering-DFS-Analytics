# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3.0

install.packages(c(
  "Lahman",
  "pitchRx"),
  quiet = TRUE)
devtools::install_github("cboettig/Sxslt", build_vignettes = TRUE)
devtools::install_github("beanumber/openWAR", build_vignettes = FALSE)
devtools::install_github("beanumber/openWARData", build_vignettes = TRUE)
devtools::install_github("cpsievert/pitchRx", build_vignettes = TRUE)
