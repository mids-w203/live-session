# Live Session Doc, Development

1. We're taking in documents from `/instructor_central/live_session/` and moving them to `/live-session/` which is changing format, and presentation style. 
2. Weeks are defined by 
  a. A distinct file, that is numbered. 
  b. A top-level heading, #
3. Concepts or tasks within the weeks are defined by 
  a. A second-level heading, ## 
4. All images should be hosted internally, in the `/images/` folder, which is shared between all weeks. 

Process to knit this: 

1. Make modifications to files that are in `1-*.Rmd` through `14-*.Rmd`. Then; 
2. Issue: `bookdown::render_book(input = "./index.Rmd", output_format = "bookdown::pdf_book", clean = TRUE)`