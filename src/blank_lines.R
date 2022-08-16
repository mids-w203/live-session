blank_lines <- function(n = 10) {
  if(knitr::is_latex_output()){
    cat(paste0('\\vspace{', n, 'cm}'))
  } else if(knitr::is_html_output()) { 
    cat(rep("&nbsp;  ", n), sep="\n")
  }
}

