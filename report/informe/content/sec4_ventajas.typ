= Ventajas, Limitaciones y Aplicaciones

= Antecedentes
=== Hiperplano
Es el límite de decisión que separa los datos.  
- En 2D es una línea.  
- En 3D un plano.  
- En más dimensiones se le llama hiperplano.

=== Vectores de Soporte
Son los puntos de datos más cercanos al hiperplano.  
Definen la posición y orientación de la frontera; si se mueven, el hiperplano cambia.

=== Margen
Es la distancia entre el hiperplano y los vectores de soporte más cercanos.  
La SVM busca maximizar esta distancia para asegurar buena generalización.

=== El "Truco del Kernel"
Cuando los datos no son linealmente separables:  
- Se proyectan a un espacio de mayor dimensión.  
- Allí sí se pueden separar con un hiperplano.  
- Al volver al espacio original, la frontera se ve como una curva compleja.

== Ventajas

1. Alta eficacia en espacios de gran dimensionalidad  
   - Ejemplo: análisis de microarrays de ADN.  
   - Aplicación: clasificación de pacientes según riesgo de enfermedad.

2. Eficiencia en memoria  
   - Ejemplo: de 10,000 muestras, solo 200 pueden ser vectores de soporte.  
   - Aplicación: detección de intrusiones en redes.

3. Robustez frente al sobreajuste  
   - Ejemplo: clasificación de textos.  
   - Aplicación: filtros de spam en correos electrónicos.

4. Flexibilidad mediante kernels  
   - Ejemplo: kernel radial separa círculos concéntricos.  
   - Aplicación: reconocimiento facial.

5. Aplicabilidad transversal  
   - Medicina: diagnóstico de cáncer de mama.  
   - Seguridad informática: detección de intrusiones.  
   - NLP: clasificación de textos.  
   - Visión artificial: reconocimiento de objetos.

== Limitaciones

1. Escalabilidad limitada  
   - Ejemplo: sistemas de recomendación con millones de usuarios.  
   - Aplicación: análisis de transacciones bancarias masivas.

2. Sensibilidad a datos mezclados o ruidosos  
   - Ejemplo: detección de fraudes.  
   - Aplicación: reconocimiento de voz con ruido ambiental.

3. Salida no probabilística  
   - Ejemplo: diagnóstico médico requiere probabilidades.  
   - Aplicación: técnicas como Platt scaling se usan como aproximación.

4. Dependencia del kernel  
   - Ejemplo: clasificación de imágenes con kernel mal configurado.  
   - Aplicación: análisis de sentimientos.

5. Escenarios ideales vs problemáticos  
   - Ideales: datasets medianos, clases bien diferenciadas.  
   - Problemáticos: datasets masivos, datos ruidosos o solapados.

== Aplicaciones

Las Máquinas de Vectores de Soporte ofrecen importantes ventajas competitivas frente a otros algoritmos de aprendizaje automático.  
Su principal virtud radica en su efectividad en espacios de alta dimensionalidad y eficiencia en memoria @geron2022.  

A pesar de sus bondades, presentan limitaciones:  
- No escalan bien con datasets masivos.  
- Son sensibles al ruido y solapamiento.  
- No entregan probabilidades de clase sin calibración adicional @geron2022.  

En ámbitos clínicos como el diagnóstico de cáncer de mama, las SVM han demostrado un desempeño excepcional.  
Aquí la métrica de *Recall* es más relevante que la exactitud general, pues un falso negativo puede retrasar un tratamiento vital.

Las Máquinas de Vectores de Soporte ofrecen importantes ventajas competitivas frente a otros algoritmos de aprendizaje automático. Su principal virtud radica en su extraordinaria efectividad en espacios de alta dimensionalidad, incluso cuando el número de variables supera ampliamente la cantidad de muestras de entrenamiento. Asimismo, al depender exclusivamente de los vectores de soporte para definir la frontera de decisión, presentan una gran eficiencia en el consumo de memoria. Adicionalmente, el algoritmo demuestra una notable resistencia al sobreajuste, especialmente en configuraciones con regularización adecuada @geron2022.

A pesar de sus bondades, las SVM también presentan limitaciones significativas. No escalan de manera eficiente cuando el conjunto de datos de entrenamiento supera las decenas o cientos de miles de muestras, debido al costo computacional cuadrático de resolver el problema de optimización subyacente. Adicionalmente, son sensibles al ruido y al solapamiento extremo entre clases, y no proveen estimaciones de probabilidad de clase de manera nativa sin recurrir a técnicas de calibración adicionales @geron2022. En el ámbito del diagnóstico médico, como en el estudio del conjunto de datos de cáncer de mama de Wisconsin, las SVM han demostrado un desempeño excepcional. En este contexto clínico sensible, la métrica de exhaustividad (Recall) adquiere mayor relevancia que la exactitud general (Accuracy), ya que clasificar erróneamente un tumor maligno como benigno (falso negativo) puede retrasar un tratamiento vital para el paciente.
