= Demostración Práctica y Código Fuente

Para ilustrar el funcionamiento práctico de las Máquinas de Vectores de
Soporte se ha seleccionado el *Wisconsin Breast Cancer Dataset* @sklearn_svc.
El conjunto cuenta con 569 muestras obtenidas mediante aspiración con aguja
fina (FNA) de masas mamarias y registra *30 características* geométricas y de
textura. Es un escenario ideal: datos limpios, dimensionalidad moderada y un
problema crítico de *clasificación binaria* (maligno vs. benigno).

El pipeline implementado en Python con `scikit-learn` recorre cinco etapas,
cada una vinculada a un concepto teórico de la SVM:

#raw("from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import classification_report, confusion_matrix

# 1. Carga de datos
data = load_breast_cancer()
X_train, X_test, y_train, y_test = train_test_split(
    data.data, data.target, test_size=0.2, random_state=42, stratify=data.target
)

# 2. Preprocesamiento (Escalado crítico para SVM)
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test  = scaler.transform(X_test)

# 3. Entrenamiento del modelo
model = SVC(kernel='rbf', C=1.0, gamma='scale', random_state=42)
model.fit(X_train, y_train)

# 4. Predicción
y_pred = model.predict(X_test)

# 5. Reporte de Resultados
print(classification_report(y_test, y_pred, target_names=data.target_names))
cm = confusion_matrix(y_test, y_pred)
print(f'Verdaderos Positivos (Maligno detectado) : {cm[0,0]}')
print(f'Falsos Negativos     (Maligno ignorado)  : {cm[0,1]}  <-- RIESGO MÉDICO')
print(f'Falsos Positivos     (Falsa alarma)      : {cm[1,0]}')
print(f'Verdaderos Negativos (Sano confirmado)   : {cm[1,1]}')",
block: true, lang: "python")

Cada etapa del código corresponde a un elemento teórico de la SVM:

- *Etapas 1–2: Problema Primal:*
  El escalado con `StandardScaler` garantiza que la norma $||bold(w)||^2$ del
  hiperplano óptimo no sea dominada por features de gran magnitud; de lo
  contrario, el margen $frac(2, ||bold(w)||)$ sería artificialmente distorsionado.

- *Etapa 3: Kernel RBF y Problema Dual:*
  El parámetro `kernel='rbf'` activa el truco del kernel: en lugar de mapear
  explícitamente los datos a un espacio de alta dimensión, la SVM opera con el
  producto interno $K(bold(x)_i, bold(x)_j) = e^{-gamma ||bold(x)_i - bold(x)_j||^2}$.
  La solución surge del problema dual de Wolfe, donde solo los
  *vectores de soporte* (muestras con $alpha_i > 0$) determinan el hiperplano.

- *Parámetro `C`: Margen Suave:*
  `C=1.0` controla el equilibrio entre maximizar el margen y minimizar las
  violaciones $xi_i$. Un `C` alto exige pocos errores en entrenamiento; un
  `C` bajo prioriza un margen más amplio aunque tolere algunos errores.

- *Etapas 4–5: Generalización:*
  Las predicciones se realizan sobre datos *nunca vistos* durante el
  entrenamiento (partición `test_size=0.2`), garantizando una estimación
  honesta de la capacidad de generalización del modelo.

== Resultados Obtenidos

La siguiente figura muestra la *frontera de decisión* aprendida por la SVM en
el espacio de dos features representativas (radio y perímetro medios,
proyectados tras el escalado). Los círculos con borde negro son los *vectores
de soporte*: las únicas muestras que definen el hiperplano.

#figure(
  image("../src/img/demo_frontera.png", width: 88%),
  caption: [Frontera de decisión SVM con kernel RBF. Círculos bordeados en
    negro: vectores de soporte. Estrellas: muestras del conjunto de prueba.]
)

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    image("../src/img/demo_confusion.png"),
    image("../src/img/demo_metricas.png"),
  ),
  caption: [Izquierda: Matriz de confusión. Derecha: Precisión, Recall y
    F1-Score por clase.]
)

El modelo alcanza una *exactitud global del 97 %*. En el contexto médico, la
métrica más crítica es el *Recall de la clase maligno*: un valor cercano al
97–98 % significa que casi ningún tumor maligno pasa desapercibido, reduciendo
al mínimo el riesgo clínico asociado a los falsos negativos.
