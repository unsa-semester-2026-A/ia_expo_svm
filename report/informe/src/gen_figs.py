"""
Genera las figuras para la sección 5 del informe SVM.
Salida: informe/src/img/demo_*.png
"""
import os
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
from matplotlib.colors import ListedColormap
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import classification_report, confusion_matrix

# ─── Paleta ────────────────────────────────────────────────────────────────────
C_MAL = "#c0392b"   # rojo: maligno
C_BEN = "#2980b9"   # azul: benigno
C_SVM = "#27ae60"   # verde: SVM boundary
ALPHA  = 0.55

plt.rcParams.update({
    "figure.dpi": 150,
    "axes.spines.top": False,
    "axes.spines.right": False,
    "font.family": "DejaVu Sans",
    "axes.titlesize": 11,
    "axes.labelsize": 9,
})

OUT = os.path.join(os.path.dirname(__file__), "img")
os.makedirs(OUT, exist_ok=True)

# ─── Pipeline ──────────────────────────────────────────────────────────────────
data = load_breast_cancer()
X, y = data.data, data.target

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)
scaler = StandardScaler()
X_train_s = scaler.fit_transform(X_train)
X_test_s  = scaler.transform(X_test)

model = SVC(kernel="rbf", C=1.0, gamma="scale", random_state=42)
model.fit(X_train_s, y_train)
y_pred = model.predict(X_test_s)

cm = confusion_matrix(y_test, y_pred)
report = classification_report(y_test, y_pred, target_names=data.target_names, output_dict=True)

# ══════════════════════════════════════════════════════════════════════════════
# FIG 1 – Matriz de Confusión
# ══════════════════════════════════════════════════════════════════════════════
fig, ax = plt.subplots(figsize=(4.5, 3.8))

im = ax.imshow(cm, cmap="Blues", vmin=0)
plt.colorbar(im, ax=ax, shrink=0.82)

for i in range(2):
    for j in range(2):
        color = "white" if cm[i, j] > cm.max() * 0.6 else "black"
        ax.text(j, i, str(cm[i, j]), ha="center", va="center",
                fontsize=16, fontweight="bold", color=color)

labels = ["Maligno (0)", "Benigno (1)"]
ax.set_xticks([0, 1]); ax.set_xticklabels(labels, fontsize=8)
ax.set_yticks([0, 1]); ax.set_yticklabels(labels, fontsize=8, rotation=90, va="center")
ax.set_xlabel("Predicción", fontsize=9)
ax.set_ylabel("Real", fontsize=9)
ax.set_title("Matriz de Confusión — SVM RBF", fontsize=11, fontweight="bold")

plt.tight_layout()
fig.savefig(os.path.join(OUT, "demo_confusion.png"), bbox_inches="tight")
plt.close(fig)
print("✓  demo_confusion.png")

# ══════════════════════════════════════════════════════════════════════════════
# FIG 2 – Métricas por clase (barras)
# ══════════════════════════════════════════════════════════════════════════════
fig, ax = plt.subplots(figsize=(5.5, 3.2))

clases  = ["Maligno (0)", "Benigno (1)"]
metrics = ["precision", "recall", "f1-score"]
labels_m = ["Precisión", "Recall", "F1-Score"]
colors_m = ["#8e44ad", "#2980b9", "#27ae60"]

x = np.arange(len(clases))
w = 0.22
for k, (m, lbl, col) in enumerate(zip(metrics, labels_m, colors_m)):
    vals = [report["malignant"][m], report["benign"][m]]
    bars = ax.bar(x + (k - 1) * w, vals, w, label=lbl, color=col, alpha=0.85)
    for bar, val in zip(bars, vals):
        ax.text(bar.get_x() + bar.get_width() / 2,
                bar.get_height() + 0.005,
                f"{val:.2f}", ha="center", va="bottom", fontsize=7.5)

ax.set_ylim(0, 1.12)
ax.set_xticks(x); ax.set_xticklabels(clases)
ax.set_ylabel("Valor")
ax.set_title("Métricas de Clasificación por Clase", fontweight="bold")
ax.legend(fontsize=8, loc="lower right")
ax.axhline(1.0, color="gray", linestyle="--", linewidth=0.7, alpha=0.6)

plt.tight_layout()
fig.savefig(os.path.join(OUT, "demo_metricas.png"), bbox_inches="tight")
plt.close(fig)
print("✓  demo_metricas.png")

# ══════════════════════════════════════════════════════════════════════════════
# FIG 3 – Frontera de decisión 2D (2 features escaladas)
# ══════════════════════════════════════════════════════════════════════════════
feat_a, feat_b = 0, 2   # mean radius, mean perimeter (muy discriminativos)
X2_train = X_train_s[:, [feat_a, feat_b]]
X2_test  = X_test_s[:, [feat_a, feat_b]]

svm2 = SVC(kernel="rbf", C=1.0, gamma="scale", random_state=42)
svm2.fit(X2_train, y_train)

h = 0.04
x_min, x_max = X2_train[:, 0].min() - 0.5, X2_train[:, 0].max() + 0.5
y_min, y_max = X2_train[:, 1].min() - 0.5, X2_train[:, 1].max() + 0.5
xx, yy = np.meshgrid(np.arange(x_min, x_max, h),
                     np.arange(y_min, y_max, h))
Z = svm2.predict(np.c_[xx.ravel(), yy.ravel()]).reshape(xx.shape)

cmap_bg = ListedColormap(["#fddede", "#d6eaf8"])

fig, ax = plt.subplots(figsize=(5.5, 4.2))
ax.contourf(xx, yy, Z, alpha=0.35, cmap=cmap_bg)
ax.contour(xx, yy, Z, colors=[C_SVM], linewidths=1.2)

mal_tr = X2_train[y_train == 0]
ben_tr = X2_train[y_train == 1]
mal_te = X2_test[y_test == 0]
ben_te = X2_test[y_test == 1]

ax.scatter(mal_tr[:, 0], mal_tr[:, 1], c=C_MAL, s=18, alpha=ALPHA, label="Maligno (train)")
ax.scatter(ben_tr[:, 0], ben_tr[:, 1], c=C_BEN, s=18, alpha=ALPHA, label="Benigno (train)")
ax.scatter(mal_te[:, 0], mal_te[:, 1], c=C_MAL, s=50, marker="*", label="Maligno (test)", zorder=5)
ax.scatter(ben_te[:, 0], ben_te[:, 1], c=C_BEN, s=50, marker="*", label="Benigno (test)", zorder=5)

# Vectores de soporte
sv = svm2.support_vectors_
ax.scatter(sv[:, 0], sv[:, 1], s=90, facecolors="none",
           edgecolors="black", linewidths=1.0, zorder=6, label="Vectores de soporte")

ax.set_xlabel(f"{data.feature_names[feat_a]} (escalado)")
ax.set_ylabel(f"{data.feature_names[feat_b]} (escalado)")
ax.set_title("Frontera de Decisión SVM (kernel RBF, 2 features)", fontweight="bold")
ax.legend(fontsize=7.5, loc="upper right")

plt.tight_layout()
fig.savefig(os.path.join(OUT, "demo_frontera.png"), bbox_inches="tight")
plt.close(fig)
print("✓  demo_frontera.png")

print("\nTodas las figuras generadas en:", OUT)
