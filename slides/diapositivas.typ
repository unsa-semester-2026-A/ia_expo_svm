#import "@preview/touying:0.7.4": *
#import themes.metropolis: *
#import "presentacion/config.typ" as config
#import "presentacion/util/util.typ" as util

// Configuración general del texto y fuentes
#set text(
  font: config.textFont,
  lang: "es",
  size: 20pt,
)

// Estilo de bloques de código
#show raw.where(block: true): it => block(
  fill: rgb("#f6f8fa"),
  width: 100%,
  inset: 1em,
  radius: 6pt,
  stroke: 0.5pt + rgb("#e1e4e8"),
  text(size: 14pt, fill: rgb("#24292e"), it),
)

// Configuración del tema Metropolis con color de la universidad
#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  // Logotipos en la esquina superior derecha
  header-right: self => {
    context {
      if utils.slide-counter.get().first() > 1 {
        image("presentacion/src/fig/fixed/unsa.png", height: 1em)
      }
    }
  },
  // Información al pie de página (izq)
  footer: self => {
    context {
      if utils.slide-counter.get().first() > 1 [
        #set text(size: 10pt, fill: config.themeColor.darken(20%))
        #config.courseName
      ]
    }
  },
  // Numeración al pie de página (der)
  footer-right: self => {
    context {
      if utils.slide-counter.get().first() > 1 [
        #set text(size: 10pt, fill: config.themeColor.darken(20%))
        #utils.slide-counter.display()
      ]
    }
  },
  config-info(
    title: config.presentationTitle,
    subtitle: config.presentationSubtitle,
    author: if config.memberList.len() < 4 {
      config.memberList.join("\n")
    } else {
      grid(
        columns: 2,
        column-gutter: 2em,
        row-gutter: 0.8em,
        ..config.memberList
      )
    },
    institution: "EPIS, UNSA",
    date: config.presentationDate,
    logo: align(center)[#image("presentacion/src/fig/fixed/unsa.png", height: auto)],
  ),
  config-colors(
    primary: config.themeColor,
    primary-light: config.themeColor.lighten(80%),
    neutral-lightest: rgb("#fafafa"),
    neutral-darkest: rgb("#222222"),
  ),
)

#set list(marker: ([#text(fill: config.themeColor)[•]], [#text(fill: config.themeColor)[–]]))
// Generar la diapositiva de título
#title-slide()

// Configurar marcadores de lista elegantes

// Incluir archivos modulares de contenido
#include "presentacion/content/1_introduccion.typ"
#include "presentacion/content/2_desarrollo.typ"
#include "presentacion/content/3_conclusiones.typ"
