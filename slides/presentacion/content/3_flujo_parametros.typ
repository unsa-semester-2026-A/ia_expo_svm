#import "@preview/touying:0.7.4": *
#import "../config.typ" as config

= Flujo de Trabajo e Hiperparámetros

== Pipeline de SVM
- *Paso 1: StandardScaler.* Escala los datos para evitar que variables con mayor rango dominen el cálculo de distancias.
- *Paso 2: Ajuste (fit).* Entrenamiento del clasificador SVC sobre el conjunto de entrenamiento escalado.
- *Paso 3: Validación (cross_val_score).* Evaluación de la generalización del modelo mediante validación cruzada.
#pause
- *Paso 4: Predicción (predict).* Clasificación de nuevas muestras de prueba.
- _Nota:_ ¡El escalado de características es absolutamente crítico para el éxito del modelo SVM!

== Hiperparámetro C
- Controla el compromiso entre maximizar el margen y minimizar el error de clasificación.
- *C bajo:* Permite un margen más amplio aceptando algunos errores (mayor regularización, evita sobreajuste).
- *C alto:* Penaliza estrictamente los errores, buscando un margen más estrecho (riesgo de sobreajuste).
#pause
- Un ajuste cuidadoso de C es clave para balancear sesgo y varianza.

== Kernel y Gamma
- El hiperparámetro *Gamma* regula el radio de influencia de los vectores de soporte individuales.
- *Gamma alto:* Influencia cercana, resulta en fronteras más complejas y ajustadas (posible sobreajuste).
- *Gamma bajo:* Influencia amplia, resulta en fronteras más suaves y generalizadas.
#pause
#align(center)[
  #table(
    columns: (auto, auto),
    inset: 6pt,
    [*Kernel*], [*Aplicabilidad típica*],
    [Lineal], [Datos linealmente separables o alta dimensionalidad],
    [RBF], [Datos no lineales en general (por defecto)],
    [Polinómico], [Relaciones complejas de grado definido],
  )
]
