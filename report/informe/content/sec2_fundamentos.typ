= Fundamentos Matemáticos y Kernel Trick

== El Hiperplano Divisorio

Como se mencionó anteriormente, el objetivo principal de una Máquina de Vectores de Soporte (SVM) es encontrar una frontera que permita separar correctamente dos clases de datos. Matemáticamente, esta frontera de decisión recibe el nombre de *hiperplano*.

El hiperplano representa el “muro” o límite que divide los datos de distintas categorías dentro del espacio de características. Dependiendo de la cantidad de variables presentes en el conjunto de datos, la forma geométrica del hiperplano cambia:

• En dos dimensiones (2D): el hiperplano se representa como una línea recta.

• En tres dimensiones (3D): el hiperplano corresponde a un plano.

• En dimensiones superiores: aunque ya no puede visualizarse fácilmente, el concepto matemático sigue siendo el mismo.

La ecuación general del hiperplano está dada por:

$
w^T x + b = 0
$

Donde:

• *w*: representa el vector de pesos que define la orientación del hiperplano.

• *x*: corresponde a los datos de entrada.

• *b*: es el sesgo o desplazamiento respecto al origen.

El problema fundamental es que pueden existir infinitos hiperplanos capaces de separar dos clases. Sin embargo, SVM selecciona el hiperplano óptimo, es decir, aquel que maximiza la separación entre las categorías.

== Los Vectores de Soporte

=== Definición geométrica

Los vectores de soporte son los puntos del conjunto de datos que se encuentran más cerca del hiperplano de separación. Debido a su posición, son considerados los datos más importantes para el modelo, ya que cualquier modificación sobre ellos puede alterar significativamente la frontera de decisión.

=== Propiedad de parsimonia

Una característica importante de las SVM es que el modelo final depende únicamente de los vectores de soporte y no de todos los datos del conjunto de entrenamiento.

• Si se elimina un punto alejado de la frontera, el hiperplano prácticamente no cambia.

• Si se modifica un vector de soporte, la frontera sí cambia significativamente.

Esto hace que SVM sea un modelo robusto frente a datos ruidosos o alejados de la región crítica de decisión.

#figure(
image("../src/img/fundamentos.jpg", width: 80%),
caption: [Representación gráfica de un modelo SVM en un espacio 2D. Se observa la frontera de decisión (hiperplano) que separa la Clase A de la Clase B. El área entre las líneas punteadas es el margen, y los puntos que lo definen (marcados con flechas azules) son los Vectores de Soporte.]
)


== Maximización del Margen: Hard Margin y Soft Margin

=== El margen geométrico

El margen representa la distancia entre el hiperplano divisor y los vectores de soporte más cercanos de cada clase. SVM busca maximizar esta distancia debido a que un margen amplio mejora la capacidad de generalización del modelo.

Un margen pequeño vuelve al modelo más sensible al ruido y aumenta el riesgo de *overfitting*, mientras que un margen amplio proporciona mayor robustez.

=== Hard Margin

El *Hard Margin* se aplica cuando los datos pueden separarse perfectamente mediante un hiperplano. En este enfoque no se permiten errores de clasificación.

Sin embargo, en problemas reales suelen existir valores atípicos (*outliers*) o ruido, por lo que este enfoque puede generar fronteras demasiado rígidas.

=== Soft Margin

El *Soft Margin* introduce variables de holgura que permiten ciertos errores de clasificación para obtener una frontera más flexible y generalizable.

El equilibrio entre maximizar el margen y permitir errores se controla mediante el parámetro:

$
C
$

• Un valor alto de $C$ penaliza fuertemente los errores.

• Un valor bajo de $C$ permite una frontera más flexible.

#figure(
  image("../src/img/fundamentos2.png", width: 85%),
  caption: [Comparativa visual entre los enfoques de Margen Duro (Hard Margin) y Margen Blando (Soft Margin) en SVM. A la izquierda se observa cómo el margen duro delimita una franja estricta y más angosta sin permitir clasificaciones erróneas. A la derecha, el margen blando amplía la zona de separación aceptando cierto nivel de holgura (puntos que cruzan la línea punteada) para priorizar la flexibilidad del modelo.]
)


== El Kernel Trick

=== El problema de la no linealidad

En muchos problemas reales los datos no son linealmente separables. Existen distribuciones complejas, como patrones circulares o clases concéntricas, donde una línea recta no puede dividir correctamente las categorías.

Para resolver este problema, SVM utiliza el llamado *Kernel Trick*.

=== Mapeo a altas dimensiones

La idea consiste en transformar los datos originales hacia un espacio de mayor dimensionalidad mediante una función:

$
phi(x)
$

En este nuevo espacio, los datos pueden volverse linealmente separables mediante un hiperplano.

=== El truco matemático

Calcular explícitamente todas las transformaciones hacia espacios de alta dimensión sería computacionalmente costoso. El *Kernel Trick* evita este problema calculando directamente el producto punto entre los datos transformados:

$
phi(x_i) dot phi(x_j)
$

En lugar de calcular explícitamente las nuevas coordenadas, se utiliza una función kernel:

$
K(x_i, x_j) = phi(x_i) dot phi(x_j)
$

Esto permite trabajar implícitamente en espacios de alta dimensionalidad sin construirlos de manera explícita.

=== Kernel RBF

Uno de los kernels más utilizados es el *Radial Basis Function* (RBF) o kernel gaussiano, definido por:

$
K(x_i, x_j) = exp(-gamma norm(x_i - x_j)^2)
$

Este kernel mide la similitud entre dos puntos según la distancia entre ellos:

• Si los puntos están cerca, el valor del kernel es alto.

• Si están alejados, el valor tiende a cero.

El parámetro $gamma$ controla el radio de influencia de cada punto:

• Un valor alto de $gamma$ genera fronteras complejas y aumenta el riesgo de *overfitting*.

•  Un valor bajo produce fronteras más suaves, aunque puede ocasionar *underfitting*.
