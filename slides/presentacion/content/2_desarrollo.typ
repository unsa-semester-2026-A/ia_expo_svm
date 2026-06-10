#import "@preview/touying:0.7.4": *
#import "../config.typ" as config

// 2. Desarrollo y Solución
= Desarrollo

== Solución Propuesta
A continuación se muestra la implementación modular en Python para resolver el modelo físico:

```python
def solve_system(g, w):
    # Resolver transformada de Fourier numéricamente
    result = compute_integral(g, w)
    return result
```

Este código se ejecuta eficientemente para diversos rangos de frecuencia.

== Resultados de la Simulación
Podemos observar los resultados experimentales en la siguiente tabla:

#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 10pt,
    align: horizon + center,
    stroke: 0.5pt + rgb("#621820"),
    table.cell(fill: rgb("#621820"))[*Frecuencia (Hz)*],
    table.cell(fill: rgb("#621820"))[*Amplitud (m)*],
    table.cell(fill: rgb("#621820"))[*Error (%)*],
    [10.0], [0.85], [1.2%],
    [20.0], [1.42], [0.8%],
    [30.0], [0.95], [1.5%],
  )
]

== Diagrama y Logotipos
Incluimos una figura descriptiva del proyecto con la acreditación:

#figure(
  image("../src/fig/fixed/abet.png", width: 30%),
  caption: [Acreditación del programa bajo criterios ABET.]
) <fig:logo-abet>

Como se detalla en la @fig:logo-abet, los criterios guían nuestro desarrollo.
