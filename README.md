# Entorno de Trabajo con Typst

Este repositorio contiene la estructura para generar documentos en Typst, dividido en dos componentes principales: un informe escrito y una presentación de diapositivas.

## 1. Instalación de Typst

Typst es un sistema de composición de textos basado en lenguajes de marcado. A diferencia de LaTeX, se compila como un único archivo binario, lo que hace su instalación muy directa.

### En Windows

Puedes instalar Typst utilizando administradores de paquetes desde la terminal (PowerShell o CMD).

**Opción A: Usando Winget (Recomendado)**
```powershell
winget install --id Typst.Typst

```

**Opción B: Usando Scoop**

```powershell
scoop install typst

```

### En Linux

Dependiendo de tu distribución y herramientas disponibles, tienes varias alternativas desde la terminal.

**Opción A: Arch Linux (vía pacman)**

```bash
sudo pacman -S typst

```

**Opción B: Alpine Linux**

```bash
apk add typst

```

**Opción C: Universal vía Cargo (Requiere Rust instalado)**

```bash
cargo install typst-cli

```

**Opción D: Binario precompilado (Cualquier distribución)**

1. Descarga el binario para Linux desde la [página de releases en GitHub](https://github.com/typst/typst/releases).
2. Extrae el archivo comprimido.
3. Mueve el ejecutable a una ruta accesible por tu sistema:

```bash
sudo mv typst /usr/local/bin/

```

### Editor Recomendado

Para editar los archivos `.typ`, se recomienda utilizar **Visual Studio Code** con la extensión **Tinymist Typst** o **Typst LSP**. Esto proporciona autocompletado, resaltado de sintaxis y vista previa en tiempo real.

---

## 2. Compilación del Proyecto

Este proyecto tiene dos puntos de entrada principales: uno para el informe y otro para las diapositivas. Posiciónate en la carpeta raíz del proyecto (donde se encuentra este README) y ejecuta los siguientes comandos.

### Compilar el Informe

Para generar el archivo `report.pdf`:

```bash
typst compile report/report.typ

```

### Compilar las Diapositivas

Para generar el archivo `diapositivas.pdf`:

```bash
typst compile slides/diapositivas.typ

```

### Modo de Observación (Watch)

Si estás editando activamente los documentos, usa el comando `watch`. Typst recompilará automáticamente el PDF en fracciones de segundo cada vez que guardes cambios en cualquier archivo `.typ` del proyecto.

Para el informe:

```bash
typst watch report/report.typ

```

Para las diapositivas:

```bash
typst watch slides/diapositivas.typ

```

## 3. Estructura del Proyecto

* `report/`: Contiene la configuración (`config.typ`), contenido modular por secciones (`content/`), utilidades e imágenes (`src/`) y la bibliografía para el documento principal.
* `slides/`: Contiene una estructura homóloga adaptada para la presentación. Utiliza utilidades e imágenes propias separadas del informe.

