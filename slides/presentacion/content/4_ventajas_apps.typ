#import "@preview/touying:0.7.4": *
#import "../config.typ" as config

= Ventajas, Limitaciones y Aplicaciones

== Ventajas de SVM
- *Alta dimensionalidad:* Eficaz incluso en espacios donde el número de características supera al de muestras.
- *Eficiencia de memoria:* Utiliza únicamente un subconjunto de puntos de entrenamiento (vectores de soporte).
- *Robustez:* Es menos propenso al sobreajuste si se eligen adecuadamente C y el kernel.
#pause
- *Versatilidad:* Permite definir kernels personalizados para tipos de datos complejos.

== Limitaciones de SVM
- *Escalabilidad:* No escala de manera óptima en grandes conjuntos de datos (mayor a 100,000 muestras).
- *Sensibilidad al ruido:* Sensible a clases solapadas y valores atípicos (outliers).
- *Falta de probabilidades directas:* No proporciona estimaciones de probabilidad de manera directa (requiere calibración de Platt).
#pause
- *Complejidad de selección:* Elegir la combinación perfecta de kernel, C y Gamma puede ser costosa.

== Aplicación: Diagnóstico Médico
- Utilización clásica con el *Wisconsin Breast Cancer Dataset* para clasificar tumores en benignos o malignos.
- Este caso de uso se conecta directamente con la demostración práctica programada a continuación.
- En diagnósticos de salud, el *Recall* es prioritario sobre el *Accuracy* global.
#pause
- Es crítico minimizar los falsos negativos, ya que omitir la detección de un tumor maligno tiene consecuencias graves.
