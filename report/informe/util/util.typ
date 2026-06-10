// Utilidades para Typst
#let codeBgColor = rgb("#F1F3F4")

#let fontBuild(content, weight, size, alignTo, color) = [
  #set text(size: size, weight: weight, fill: color)
  #if alignTo != none [
    #align(alignTo)[#content]
  ] else [
    #content
  ]
]

#let codeBlock(file, lang: "text") = block(
  fill: codeBgColor,
  breakable: true,
  width: 100%,
  inset: 1em,
  radius: 8pt,
)[
  #raw(read(file), lang: lang)
]

#let unordList(items) = [
  #set list(indent: 1em, marker: "-")
  #for item in items [
    - #item
  ]
]
