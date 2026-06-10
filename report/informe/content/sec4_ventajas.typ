= Ventajas, Limitaciones y Aplicaciones de las Máquinas de Vectores de Soporte (SVM)

== Antecedentes

=== Hiperplano

El hiperplano es la frontera de decisión utilizada por las Máquinas de Vectores de Soporte para separar las clases de un conjunto de datos.

- En dos dimensiones corresponde a una línea.
- En tres dimensiones corresponde a un plano.
- En espacios de mayor dimensionalidad recibe el nombre de hiperplano.

La calidad de la clasificación depende de la ubicación óptima de este hiperplano respecto a los datos.

=== Vectores de Soporte

Los vectores de soporte son las observaciones más cercanas al hiperplano de separación. Estos puntos son fundamentales porque determinan completamente la posición y orientación de la frontera de decisión.

Una característica importante de SVM es que únicamente estos puntos influyen directamente en el modelo final, lo que contribuye a su eficiencia en memoria.

=== Margen

El margen es la distancia entre el hiperplano y los vectores de soporte más cercanos de cada clase.

El objetivo principal de SVM es maximizar este margen, ya que una mayor separación entre clases suele producir una mejor capacidad de generalización sobre datos no observados.

=== El Truco del Kernel (Kernel Trick)

En numerosos problemas reales los datos no son linealmente separables. Para resolver esta limitación, SVM utiliza funciones kernel que permiten proyectar los datos a espacios de mayor dimensionalidad donde sí es posible encontrar una separación lineal.

El procedimiento consiste en:

- Tomar los datos originales en un espacio de baja dimensión.
- Transformarlos matemáticamente a un espacio de mayor dimensión.
- Encontrar un hiperplano de separación en dicho espacio.
- Proyectar el resultado nuevamente al espacio original.

Como consecuencia, la frontera de decisión observada en el espacio original puede adoptar formas no lineales complejas.

== Ventajas

=== Alta eficacia en espacios de gran dimensionalidad

Las SVM pueden trabajar eficientemente con conjuntos de datos que contienen miles de variables, incluso cuando el número de características supera al número de observaciones.

*Ejemplo:* análisis de microarrays de ADN con miles de genes y pocos pacientes.

*Aplicación:* clasificación de pacientes según riesgo de enfermedad.

=== Eficiencia en memoria

El modelo almacena principalmente los vectores de soporte en lugar de todas las observaciones del conjunto de entrenamiento.

*Ejemplo:* en un conjunto de 10 000 muestras, únicamente unas pocas centenas pueden convertirse en vectores de soporte.

*Aplicación:* detección de intrusiones en redes informáticas.

=== Robustez frente al sobreajuste

Al maximizar el margen entre clases, SVM favorece la generalización y reduce el riesgo de memorizar los datos de entrenamiento.

*Ejemplo:* clasificación automática de documentos de texto.

*Aplicación:* sistemas de filtrado de correo spam.

=== Flexibilidad mediante kernels

Las funciones kernel permiten resolver problemas complejos con fronteras de decisión no lineales.

*Ejemplo:* separación de datos con distribución circular utilizando un kernel radial (RBF).

*Aplicación:* sistemas de reconocimiento facial.

=== Aplicabilidad transversal

Las SVM han demostrado utilidad en múltiples dominios:

- Medicina: diagnóstico de cáncer de mama.
- Seguridad informática: detección de intrusiones.
- Procesamiento de lenguaje natural: clasificación de textos y análisis de sentimientos.
- Visión artificial: reconocimiento de objetos e imágenes.

== Limitaciones

=== Escalabilidad limitada

El entrenamiento de SVM requiere resolver un problema de optimización cuadrática cuyo costo computacional aumenta significativamente con el tamaño del conjunto de datos.

*Ejemplo:* sistemas de recomendación con millones de usuarios.

*Aplicación afectada:* análisis masivo de transacciones bancarias.

=== Sensibilidad a datos ruidosos

Cuando existe un elevado grado de solapamiento entre clases o presencia de ruido, la frontera de decisión puede volverse inestable.

*Ejemplo:* detección de fraude financiero.

*Aplicación afectada:* reconocimiento de voz en ambientes con ruido.

=== Salida no probabilística

Las SVM generan clasificaciones directas, pero no proporcionan probabilidades de pertenencia a una clase de forma nativa.

*Ejemplo:* diagnóstico médico donde se requiere conocer el nivel de confianza de una predicción.

*Aplicación:* utilización de métodos de calibración como Platt Scaling.

=== Dependencia de la selección del kernel

La calidad del modelo depende considerablemente de la elección del kernel y de sus hiperparámetros.

*Ejemplo:* clasificación de imágenes con una configuración inadecuada.

*Aplicación afectada:* análisis de sentimientos.

=== Escenarios ideales y problemáticos

*Escenarios ideales:*

- Conjuntos de datos medianos.
- Alta dimensionalidad.
- Clases claramente diferenciadas.

*Escenarios problemáticos:*

- Grandes volúmenes de datos.
- Alto nivel de ruido.
- Fuerte solapamiento entre clases.

== Aplicaciones Reales: Diagnóstico de Cáncer de Mama

=== Contexto Clínico

El cáncer de mama constituye una de las principales causas de mortalidad femenina a nivel mundial. La detección temprana es fundamental para aumentar las probabilidades de supervivencia.

Las SVM pueden emplearse para clasificar tumores como benignos o malignos utilizando características extraídas de biopsias y mamografías, tales como textura, forma, tamaño, simetría y concavidad celular.

=== Wisconsin Breast Cancer Dataset (WBCD)

Uno de los conjuntos de datos más utilizados para evaluar algoritmos de clasificación médica es el Wisconsin Breast Cancer Dataset (WBCD), desarrollado por el Dr. William Wolberg.

El objetivo consiste en determinar si una muestra obtenida mediante biopsia por aspiración con aguja fina corresponde a un tumor benigno o maligno.

El conjunto contiene 30 características relacionadas con:

- Radio celular.
- Textura.
- Perímetro.
- Área.
- Suavidad.
- Compacidad.
- Concavidad.
- Puntos cóncavos.
- Simetría.
- Dimensión fractal.

Este dataset se ha convertido en un estándar para investigación biomédica y sistemas de apoyo al diagnóstico médico.

=== Funcionamiento de SVM en el Diagnóstico

El proceso de clasificación sigue las siguientes etapas:

1. Ingreso de las características extraídas de la muestra.
2. Construcción del hiperplano óptimo de separación.
3. Identificación de los vectores de soporte.
4. Clasificación de nuevos pacientes.

Con configuraciones adecuadas, especialmente utilizando kernel RBF, las SVM pueden alcanzar precisiones superiores al 96 %, convirtiéndose en una herramienta efectiva para apoyar el diagnóstico clínico.

=== Importancia del Recall

En aplicaciones médicas, la métrica de *Recall* o exhaustividad resulta especialmente importante.

Un falso negativo implica clasificar incorrectamente un tumor maligno como benigno, lo que podría retrasar el tratamiento y comprometer la salud del paciente. Por ello, en este tipo de problemas el Recall suele considerarse más relevante que la exactitud global (*Accuracy*).

== Discusión

Las Máquinas de Vectores de Soporte ofrecen importantes ventajas competitivas frente a otros algoritmos de aprendizaje automático. Destacan por su efectividad en espacios de alta dimensionalidad, eficiencia en memoria y resistencia al sobreajuste mediante la maximización del margen de separación @geron2022.

No obstante, presentan limitaciones asociadas a la escalabilidad, sensibilidad al ruido y ausencia de estimaciones probabilísticas nativas. Estas características hacen que sean especialmente adecuadas para conjuntos de datos medianos y problemas donde las clases presentan una separación relativamente clara @geron2022.

En el ámbito médico, particularmente en el diagnóstico de cáncer de mama, las SVM continúan siendo una de las técnicas más utilizadas debido a su elevada capacidad predictiva y su facilidad de interpretación en datos tabulares.

== Investigaciones Recientes

- Ozer et al. (2020) integraron datos genómicos y clínicos para clasificar subtipos de cáncer de mama, obteniendo altos niveles de precisión en la predicción de recurrencias.

- Khoudi et al. (2025) desarrollaron la variante DWD-SVM aplicada al WBCD, alcanzando una precisión del 99.3 % y una mayor robustez frente a datos desbalanceados.

- Kiani Sarkaleh et al. (2026) propusieron un sistema de diagnóstico asistido por computadora basado en SVM y selección optimizada de características, logrando sensibilidades superiores al 99 % en mamografías digitales.

== Implementación en Sistemas Reales

Las SVM se encuentran integradas en diversos sistemas de apoyo a la toma de decisiones:

- Hospitales y clínicas para asistencia diagnóstica.
- Plataformas CAD (Computer-Aided Diagnosis).
- Sistemas biomédicos de investigación clínica.
- Herramientas de validación de hipótesis médicas y factores de riesgo.

Estas aplicaciones demuestran la vigencia de las SVM como una de las técnicas más relevantes dentro del aprendizaje supervisado para problemas de clasificación de alta precisión.