(TeX-add-style-hook
 "preamble"
 (lambda ()
   (TeX-run-style-hooks
    "color"
    "tcolorbox")
   (LaTeX-add-color-definecolors
    "berkeleyblue"
    "berkeleygold"))
 :latex)

