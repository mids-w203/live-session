#!/usr/bin/env bash

Rscript -e "bookdown::render_book(input = '.', clean = TRUE, output_format = 'bookdown::pdf_book')"
Rscript -e "bookdown::render_book(input = '.', clean = TRUE, output_format = 'bookdown::gitbook')"
