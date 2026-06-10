#import "@preview/touying:0.7.4": *
#import "../config.typ" as config

= Introducción

== ¿Qué es SVM?
- Algoritmo de aprendizaje supervisado utilizado para clasificación y regresión.
- Su objetivo principal es encontrar un hiperplano óptimo en un espacio multidimensional.
- Maximiza la distancia (margen) entre las muestras más cercanas de diferentes clases.
#pause
- Propuesto originalmente por Bernhard E. Boser, Isabelle M. Guyon y Vladimir N. Vapnik en 1992, y consolidado por Cortes & Vapnik en 1995.

== Problemas que Resuelve
- Clasificación binaria lineal y no lineal mediante fronteras de decisión óptimas.
- Extensible a clasificación multiclase (estrategias One-vs-One y One-vs-All).
- Regresión mediante Support Vector Regression (SVR) y detección de anomalías con One-Class SVM.
#pause
- Aplicable a problemas médicos prácticos, como clasificar tumores en benignos o malignos según sus características biológicas.
