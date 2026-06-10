#import "@preview/touying:0.7.4": *
#import "../config.typ" as config

= Fundamentos Matemáticos

== Vectores de Soporte
- Son los puntos del conjunto de entrenamiento que están más cerca del hiperplano de decisión.
- Estos puntos críticos determinan de manera exclusiva la orientación y posición del hiperplano.
- Eliminar cualquier otro punto de entrenamiento no altera la frontera de decisión final del modelo.
#pause
- Por lo tanto, el modelo SVM es altamente eficiente en memoria al depender solo de este subconjunto.

== Maximización del Margen
- El objetivo fundamental es maximizar el margen geométrico entre las clases.
- Un margen más amplio proporciona una mayor robustez y mejor capacidad de generalización.
- Se busca un hiperplano definido por $w^T x + b = 0$ que separe limpiamente las clases.
#pause
- Los márgenes se definen por los hiperplanos paralelos $w^T x + b = 1$ y $w^T x + b = -1$.

== Kernel Trick (Truco del Kernel)
- Resuelve problemas no lineales proyectando los datos originales a un espacio de mayor dimensionalidad.
- Evita calcular explícitamente las coordenadas en el espacio transformado, reduciendo el costo computacional.
- Kernels comunes: Lineal, Polinómico y RBF (Función de Base Radial).
#pause
- La fórmula del kernel RBF está definida como:
  $ K(x_i, x_j) = exp(-gamma ||x_i - x_j||^2) $
