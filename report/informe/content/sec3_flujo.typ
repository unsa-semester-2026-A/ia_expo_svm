= Flujo de trabajo e hiperparámetros de SVM

== 1. Flujo general de trabajo de una SVM

Una Máquina de Vectores de Soporte no se usa directamente con los datos en bruto. Antes de entrenar el modelo, los datos pasan por una serie de etapas: información histórica, preparación de datos, definición de parámetros, entrenamiento, validación cruzada, formación del modelo, ingreso de nuevos datos, pronóstico y previsión final.

#figure(
image("../../src/img/flujo_svm_mehta.png", width: 82%),
caption: [Flujo general de trabajo de una SVM. Adaptado de Mehta, Sharma, Chauhan y Saho (2013).]
) [fig:flujo-svm-mehta](fig:flujo-svm-mehta)

=== 1.1 Información histórica

El flujo inicia con la información histórica. Esta corresponde al conjunto de datos disponible antes del entrenamiento. Puede estar formado por mediciones, registros, características o casos previamente clasificados.

En esta etapa todavía no se entrena la SVM. Lo importante es contar con datos representativos del problema, porque el modelo aprenderá patrones a partir de esa información.

=== 1.2 Formateo y preparación de datos

Después, los datos pasan por una etapa de formateo o preparación. Aquí se organizan las variables de entrada y la variable objetivo. También se revisa que los datos estén en un formato adecuado para el entrenamiento.

En el caso de SVM, esta fase es especialmente importante porque el modelo trabaja midiendo distancias entre puntos. Si una variable tiene valores muy pequeños y otra maneja valores demasiado grandes, la variable de mayor escala puede dominar el cálculo de la frontera de decisión.

Por eso, en una implementación práctica se suele usar `StandardScaler`. Esta técnica estandariza las variables para que tengan media cercana a cero y desviación estándar igual a uno. Así, todas las características quedan en una escala comparable.

#figure(
image("../../src/img/flujo_trabajo_svm.png", width: 90%),
caption: [Pipeline práctico de SVM: escalado de datos, entrenamiento y validación cruzada.]
) [fig:flujo-svm-practico](fig:flujo-svm-practico)

=== 1.3 Definición de parámetros de SVM

Una vez preparados los datos, se definen los hiperparámetros de la SVM. Estos valores se configuran antes del entrenamiento y controlan el comportamiento del modelo.

Los hiperparámetros principales son `C`, `gamma` y `kernel`. `C` controla cuánto se penalizan los errores de clasificación. `gamma` regula el alcance de influencia de cada muestra cuando se usa un kernel como RBF. El `kernel` define la forma en que los datos serán comparados o transformados para poder separarse.

=== 1.4 Proceso de entrenamiento

Luego se realiza el entrenamiento de la SVM. En esta etapa, el modelo recibe los datos preparados y aprende una frontera de decisión para separar las clases.

La SVM no busca cualquier frontera, sino una que deje el mayor margen posible entre los grupos. Ese margen permite que el modelo tenga una separación más clara y pueda responder mejor ante datos nuevos.

=== 1.5 Validación cruzada

Después del entrenamiento se aplica validación cruzada. Esta técnica divide el dataset en varias partes. En cada iteración, una parte se usa para probar el modelo y las demás se usan para entrenarlo.

La validación cruzada permite comprobar si el modelo mantiene un buen rendimiento en distintos subconjuntos de datos. Esto ayuda a detectar si la SVM realmente generaliza o si solo se ajustó demasiado al conjunto de entrenamiento.

=== 1.6 Modelo de formación

Luego de entrenar y validar el modelo, se obtiene el modelo de formación o modelo entrenado. Este modelo ya contiene la frontera de decisión aprendida durante el entrenamiento.

En esta etapa, la SVM ya no está aprendiendo desde cero. Ahora conserva el patrón encontrado en los datos históricos y queda lista para trabajar con nuevos datos.

=== 1.7 Nuevo conjunto de datos

El flujo también incluye un nuevo conjunto de datos. Estos son datos que el modelo no vio durante el entrenamiento.

Estos nuevos datos deben pasar por la misma preparación aplicada a los datos históricos. Si el modelo fue entrenado con variables escaladas, los nuevos datos también deben escalarse antes de la predicción.

=== 1.8 Proceso de pronóstico SVM

En el proceso de pronóstico, la SVM recibe el nuevo conjunto de datos y lo evalúa usando la frontera de decisión aprendida.

Cada nueva muestra se ubica respecto a esa frontera. Si cae de un lado, se asigna a una clase; si cae del otro lado, se asigna a la clase contraria. Así, la SVM transforma el aprendizaje previo en una decisión sobre datos nuevos.

=== 1.9 Previsión final

La previsión final es el resultado entregado por el modelo. Dependiendo del problema, puede ser una clasificación como positivo o negativo, falla o no falla, benigno o maligno, entre otras posibilidades.

Este resultado muestra que el flujo de trabajo de una SVM no termina en el entrenamiento. También requiere preparación, validación y aplicación sobre nuevos datos para comprobar su utilidad real.

== 2. Hiperparámetros principales de SVM

Los hiperparámetros son configuraciones que se establecen antes de entrenar el modelo. A diferencia de los parámetros internos aprendidos por la SVM, estos valores deben ser elegidos por el usuario o ajustados mediante pruebas.

Los tres hiperparámetros más importantes son `C`, `gamma` y `kernel`.

#figure(
image("../../src/img/c_gamma_rbf_sklearn.png", width: 80%),
caption: [Efecto de los hiperparámetros `C` y `gamma` en una SVM con kernel RBF. Fuente: Scikit-Learn, RBF SVM parameters.]
) [fig:c-gamma-sklearn](fig:c-gamma-sklearn)

=== 2.1 Parámetro C

El parámetro `C` controla la penalización por errores de clasificación. Define qué tan estricto será el modelo cuando algunos puntos queden mal clasificados.

Con un valor bajo de `C`, la SVM permite más errores durante el entrenamiento. Esto genera una frontera más flexible y con mayor margen. Aunque puede fallar en algunos puntos del conjunto de entrenamiento, suele tener mejor capacidad de generalización.

Con un valor alto de `C`, el modelo se vuelve más estricto. Intenta clasificar correctamente la mayor cantidad posible de puntos. El problema es que, si se exige demasiado, la frontera puede ajustarse demasiado al entrenamiento y perder rendimiento con datos nuevos.

Una forma sencilla de entender `C` es verlo como el nivel de exigencia del modelo. A menor `C`, el modelo tolera más errores. A mayor `C`, castiga más cada error.

=== 2.2 Parámetro gamma

El parámetro `gamma` determina el alcance de influencia de cada muestra. Su efecto se observa principalmente en kernels no lineales, especialmente en el kernel RBF.

Con un `gamma` bajo, cada punto influye en una zona más amplia. Esto produce una frontera de decisión más suave y general. El modelo no se concentra demasiado en puntos individuales, sino que observa una tendencia más global.

Con un `gamma` alto, cada punto influye solo en una zona cercana. Esto genera fronteras más detalladas y sensibles. Puede ser útil cuando los datos tienen una estructura compleja, pero también puede causar sobreajuste si el modelo empieza a seguir el ruido del entrenamiento.

Es importante aclarar que `gamma` no tiene efecto cuando se usa un kernel lineal. En ese caso, la separación se construye mediante una línea o hiperplano en el espacio original, por lo que no se necesita controlar una influencia local de los puntos.

=== 2.3 Kernel

El `kernel` define la forma en que la SVM compara los datos para construir la frontera de decisión. Su función es permitir que el modelo pueda trabajar con separaciones lineales o no lineales.

El kernel lineal se usa cuando las clases pueden separarse mediante una línea o un plano. El kernel RBF se usa cuando la separación es curva o más compleja. El kernel polinómico puede utilizarse cuando la relación entre las variables tiene una estructura de mayor grado.

Por tanto, el kernel define la forma general de la frontera, mientras que `C` y `gamma` ajustan qué tan estricta, suave o detallada será esa separación.

== 3. Análisis de la gráfica de C y gamma

La @fig:c-gamma-sklearn muestra cómo cambia la frontera de decisión al variar `C` y `gamma` en una SVM con kernel RBF. La imagen está organizada como una matriz: de izquierda a derecha aumenta `gamma`, y de arriba hacia abajo aumenta `C`.

Cuando `gamma` es bajo, como en la columna izquierda, la frontera es más suave. Esto ocurre porque cada punto tiene una influencia más amplia sobre el espacio de decisión. El modelo busca una separación general y no se ajusta demasiado a cada muestra individual.

Cuando `gamma` es alto, como en la columna derecha, la frontera se vuelve más local. El modelo reacciona con mayor sensibilidad a los puntos cercanos y genera regiones más pequeñas. Esto puede volver al modelo más preciso en el entrenamiento, pero también más propenso al sobreajuste.

Cuando `C` es bajo, como en la fila superior, el modelo permite más errores. La frontera no intenta clasificar perfectamente todos los puntos, sino mantener una separación más simple. Esto puede ayudar a generalizar mejor.

Cuando `C` es alto, como en la fila inferior, el modelo penaliza más los errores. Por eso intenta adaptarse mejor a los datos de entrenamiento. Si se combina con un `gamma` alto, la frontera puede volverse demasiado irregular.

#figure(
image("../../src/img/equilibrio_c_gamma.png", width: 90%),
caption: [Resumen visual del equilibrio entre `C` y `gamma` en el comportamiento del modelo SVM.]
) [fig:equilibrio-c-gamma](fig:equilibrio-c-gamma)

La @fig:equilibrio-c-gamma resume este comportamiento. Con `C` bajo y `gamma` bajo, el modelo es simple y suave, pero puede quedar demasiado general. Con `C` alto y `gamma` bajo, el modelo es más estricto, pero mantiene una frontera estable. Con `C` bajo y `gamma` alto, el modelo permite errores, aunque puede reaccionar a detalles locales. Con `C` alto y `gamma` alto, aparece el mayor riesgo de sobreajuste.

El objetivo no es escoger los valores más altos, sino encontrar un equilibrio. Un modelo demasiado simple puede no capturar patrones importantes. Un modelo demasiado complejo puede memorizar el entrenamiento. La mejor configuración es aquella que logra buen rendimiento con datos nuevos.

== 4. Relación entre flujo e hiperparámetros

El flujo de trabajo y los hiperparámetros están conectados. El escalado permite que la SVM calcule distancias de manera equilibrada. La definición de `C`, `gamma` y `kernel` determina la forma y complejidad de la frontera. La validación cruzada ayuda a comprobar si esa configuración funciona bien en diferentes subconjuntos de datos.

Por eso, una SVM no depende solo del algoritmo. También depende de cómo se preparan los datos, cómo se configuran sus hiperparámetros y cómo se valida el modelo antes de usarlo con datos nuevos.

== Referencias

Mehta, A. K., Sharma, R. N., Chauhan, S., & Saho, S. (2013). Transformer Diagnostics under Dissolved Gas Analysis Using Support Vector Machine. En *Power, Energy and Control (ICPEC), 2013 International Conference* (pp. 181–186). Dindigul.

Scikit-Learn. (s. f.). *sklearn.preprocessing.StandardScaler*. https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.StandardScaler.html

Scikit-Learn. (s. f.). *sklearn.svm.SVC*. https://scikit-learn.org/stable/modules/generated/sklearn.svm.SVC.html

Scikit-Learn. (s. f.). *RBF SVM parameters*. https://scikit-learn.org/stable/auto_examples/svm/plot_rbf_parameters.html

Scikit-Learn. (s. f.). *Cross-validation: evaluating estimator performance*. https://scikit-learn.org/stable/modules/cross_validation.html
