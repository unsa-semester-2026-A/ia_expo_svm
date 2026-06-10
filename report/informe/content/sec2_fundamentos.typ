= Fundamentos Matemáticos y Kernel Trick

El principio fundamental de una Máquina de Vectores de Soporte radica en la identificación y utilización de los llamados vectores de soporte. Estos vectores corresponden a las muestras de entrenamiento que se encuentran situadas en el límite del margen de decisión, siendo los puntos más cercanos al hiperplano separador. Matemáticamente, la posición y orientación del hiperplano óptimo dependen exclusivamente de estos puntos críticos; el resto del conjunto de datos podría modificarse o eliminarse sin alterar en absoluto la frontera de decisión resultante. La optimización del modelo se formula conceptualmente como un problema de programación cuadrática con restricciones, cuyo objetivo es maximizar la distancia geométrica (margen) entre las clases, manteniendo al mismo tiempo un control sobre los errores de clasificación a través de variables de holgura en el caso de márgenes blandos @cortes1995 @geron2022.

Para escenarios donde los datos no son linealmente separables en su espacio original, las SVM aplican una de sus herramientas más potentes: el truco del kernel (Kernel Trick). Este mecanismo proyecta implícitamente los datos de entrada a un espacio de características de mayor dimensionalidad donde las clases se vuelven linealmente separables @geron2022. La gran ventaja computacional del truco del kernel es que permite calcular el producto escalar en este nuevo espacio sin necesidad de evaluar explícitamente las coordenadas transformadas de los puntos. Entre las funciones de kernel más utilizadas destaca la Función de Base Radial (RBF), cuya formulación matemática está dada por:

$ K(x_i, x_j) = exp(-gamma ||x_i - x_j||^2) $

Donde $gamma$ es un parámetro que define el radio de influencia de cada vector de soporte en la frontera de decisión.

#align(center)[
  #rect(width: 80%, height: 5cm, stroke: 0.5pt)[
    #align(center + horizon)[
      _Figura 2.1 — Representación conceptual de la maximización del margen y el efecto del Kernel Trick en SVM_
    ]
  ]
]
