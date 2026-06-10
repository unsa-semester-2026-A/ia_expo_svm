= Flujo de Trabajo e Hiperparámetros

El desarrollo de un modelo efectivo basado en Máquinas de Vectores de Soporte requiere un flujo de trabajo riguroso y estructurado. Este pipeline comienza de forma obligatoria con el preprocesamiento y escalado de las variables de entrada. Dado que las SVM calculan distancias geométricas en el espacio de características para determinar el hiperplano óptimo, la presencia de variables con rangos numéricos disparidad distorsionaría significativamente la métrica de distancia. Por esta razón, el uso de herramientas como `StandardScaler` es crítico, transformando cada característica para que posea una media de cero y una desviación estándar unitaria @sklearn_svc. Posteriormente, se procede al ajuste del modelo utilizando el conjunto de entrenamiento escalado, seguido de una fase de validación cruzada (`cross_val_score`) para obtener una estimación insesgada del rendimiento del clasificador.

La optimización de una SVM depende fuertemente de la selección de sus hiperparámetros fundamentales: la constante de regularización $C$, el parámetro de escala $gamma$ (cuando se emplean kernels como RBF) y el tipo de kernel seleccionado @sklearn_svc. El hiperparámetro $C$ establece el equilibrio entre la amplitud del margen y la tolerancia al error de entrenamiento. Un valor de $C$ elevado penaliza estrictamente las clasificaciones erróneas, dando como resultado un margen estrecho y un mayor riesgo de sobreajuste; por el contrario, un $C$ reducido fomenta un margen más holgado que mejora la generalización. A su vez, $gamma$ regula la complejidad geométrica de la frontera de decisión al controlar el alcance de cada vector de soporte individual.

#align(center)[
  #rect(width: 80%, height: 5cm, stroke: 0.5pt)[
    #align(center + horizon)[
      _Figura 3.1 — Diagrama de flujo del pipeline de preprocesamiento, optimización y evaluación de SVM_
    ]
  ]
]
