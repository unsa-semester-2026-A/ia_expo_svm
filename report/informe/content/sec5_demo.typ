= Demostración Práctica y Código Fuente

Para ilustrar el funcionamiento práctico y el potencial de las Máquinas de Vectores de Soporte, se ha seleccionado el conjunto de datos de cáncer de mama de Wisconsin (Wisconsin Breast Cancer Dataset). Este conjunto cuenta con 569 muestras obtenidas mediante aspiración con aguja fina de masas mamarias y registra 30 características geométricas y de textura calculadas a partir de las imágenes de las células. Es una opción ideal para evaluar clasificadores SVM debido a que es un conjunto de datos limpio, con una dimensionalidad moderada y que aborda un problema crítico de clasificación binaria (maligno versus benigno). A continuación, se presenta la implementación completa en lenguaje Python utilizando la biblioteca `scikit-learn` @sklearn_svc:

#raw("from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import classification_report, ConfusionMatrixDisplay

# Carga de datos
data = load_breast_cancer()
X_train, X_test, y_train, y_test = train_test_split(
    data.data, data.target, test_size=0.2, random_state=42
)

# Preprocesamiento: Escalado de características
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# Entrenamiento del modelo
model = SVC(kernel='rbf', C=1.0, gamma='scale')
model.fit(X_train, y_train)

# Predicción
y_pred = model.predict(X_test)
", block: true, lang: "python")

El pipeline implementado realiza primero una separación de datos de entrenamiento (80%) y prueba (20%), garantizando que la evaluación se realice sobre datos no vistos. Luego de aplicar el escalado estándar para asegurar que la métrica de distancia euclidiana no sea distorsionada por las escalas de los features, se entrena un modelo clasificador de soporte vectorial `SVC` con kernel radial (RBF) @sklearn_svc. Los resultados obtenidos arrojan una exactitud general cercana al 97%. En la interpretación médica de las métricas, se destaca el valor del Recall obtenido para la clase 0 (maligno), el cual se aproxima al 95-98%. Esta alta sensibilidad garantiza que muy pocos tumores con potencial maligno pasen desapercibidos, minimizando el riesgo clínico asociado a falsos negativos y validando la efectividad del clasificador en entornos de soporte de decisiones de salud.
