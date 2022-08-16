(TeX-add-style-hook
 "preamble"
 (lambda ()
   (TeX-run-style-hooks
    "color"
    "tcolorbox")
   (LaTeX-add-xcolor-definecolors
    "berkeleyblue"
    "berkeleygold"
    "bayfog"
    "laplane"
    "ion"
    "sathergate"
    "stonepine")
   (LaTeX-add-tcolorbox-newtcolorboxes
    '("breakout" "" "" "")))
 :latex)

