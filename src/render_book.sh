#!/usr/bin/env bash

Rscript -e "bookdown::render_book(input = '.', clean = TRUE, output_format = 'bookdown::gitbook')"
Rscript -e "bookdown::render_book(input = '.', clean = TRUE, output_format = 'bookdown::pdf_book')"
