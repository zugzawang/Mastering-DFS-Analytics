#! /bin/bash

for i in bootstrap tufte gitbook
do
  ln -sf _output.yml.${i} _output.yml
  ln -sf index.Rmd.${i} index.Rmd
  R -e "bookdown::render_book(input = 'index.Rmd', output_format = 'all')"
  rm -fr ${i}_book
  cp -rp _book ${i}_book
done
