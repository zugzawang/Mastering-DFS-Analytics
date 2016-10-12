#! /bin/bash -v

R -e "bookdown::render_book(input = 'index.Rmd', output_format = 'all')"
