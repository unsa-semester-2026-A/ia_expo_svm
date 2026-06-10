#import "@preview/touying:0.7.4": *
#import "../config.typ" as config

// 1. Introducción y Objetivos
= Introducción

== Contexto y Motivación
- Presentación del problema a resolver.
- Importancia de la metodología empleada en el laboratorio.
- Integración de los criterios ABET para la mejora continua del estudiante en ingeniería.

#pause
En esta práctica se evaluará el impacto del modelamiento y simulación numérica.

== Objetivos de la Práctica
- *Objetivo General:* Implementar y validar los modelos físicos a través de simulaciones computacionales.
- *Objetivos Específicos:*
  - Comprender los fundamentos de la dinámica física bajo estudio.
  - Desarrollar un script en Python/Matlab para la resolución de ecuaciones diferenciales.
  - Analizar la convergencia de las soluciones numéricas obtenidas.

== Marco Teórico
La ecuación fundamental que rige el sistema está dada por:

$ f(x) = integral_(-infinity)^(infinity) g(t) e^(-i w t) d t $

Donde:
- $g(t)$ es la función de excitación temporal.
- $w$ es la frecuencia angular del sistema.
- $f(x)$ representa la respuesta espectral.
