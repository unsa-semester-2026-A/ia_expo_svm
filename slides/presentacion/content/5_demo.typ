#import "@preview/touying:0.7.4": *
#import "../config.typ" as config

= Demostración Práctica

== Dataset: Wisconsin Breast Cancer
- Cuenta con *569 muestras* de biopsias de tejido mamario.
- Registra *30 características* numéricas calculadas a partir de imágenes digitalizadas.
- Viene precargado directamente en la biblioteca `scikit-learn` de Python sin necesidad de descargas externas.
#pause
- Tarea de clasificación binaria: identificar si el tejido es *Maligno* (0) o *Benigno* (1).

== Código de Implementación
```python
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC

data = load_breast_cancer()
X_train, X_test, y_train, y_test = train_test_split(
    data.data, data.target, test_size=0.2, random_state=42
)
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)
model = SVC(kernel='rbf', C=1.0, gamma='scale')
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
```

== Interpretación de Resultados
- El clasificador alcanza una exactitud (*Accuracy*) promedio aproximada del *97%*.
- *Prioridad del Recall (Malignos):* Es fundamental lograr un recall alto para la clase maligna para minimizar falsos negativos.
- Un falso negativo significa dar de alta a un paciente enfermo de cáncer, lo cual representa un riesgo de muerte.
#pause
- *Conclusión:* SVM destaca en medicina por su precisión y fiabilidad con muestras de tamaño moderado.
