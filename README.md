# CV Interactivo con Flutter

Este es un proyecto de una aplicación de currículum vitae (CV) interactivo desarrollado con Flutter. La aplicación está diseñada para ser completamente responsiva, adaptándose a diferentes tamaños de pantalla, desde dispositivos móviles hasta navegadores web en escritorio.

## 🚀 Características

- **Diseño Responsivo**: La interfaz se ajusta automáticamente para ofrecer una experiencia de usuario óptima tanto en móvil como en web.
- **Componentes Reutilizables**: El código está estructurado en widgets modulares y reutilizables para cada sección del CV (experiencia, educación, etc.).
- **Secciones Desplegables**: Las habilidades se agrupan en categorías que se pueden expandir y contraer para una visualización más limpia.
- **Estado Persistente**: El estado de las secciones desplegables se mantiene al hacer scroll, mejorando la usabilidad.
- **Información de Contacto**: Un `FloatingActionButton` abre un diálogo con la información de contacto.
- **Estilo Moderno**: Una paleta de colores limpia y profesional con una tipografía clara.

## 📸 Vistas Previas

A continuación se muestra cómo se adapta la aplicación a diferentes tamaños de pantalla.

**Vista Móvil**

<p align="center">
  <img src=".assets/img/readme/versionMobil.png" alt="Vista Móvil de la App" width="300"/>
</p>

**Vista Web/Escritorio**

<p align="center">
  <img src="./assets/img/readme/versionWeb.png" alt="Vista Web de la App" width="700"/>
</p>


## 🛠️ Tecnologías Utilizadas

- **Flutter**: Framework de UI para construir aplicaciones nativas para móvil, web y escritorio desde una única base de código.
- **Dart**: Lenguaje de programación optimizado para la construcción de interfaces de usuario.

## ⚙️ Instalación y Puesta en Marcha

Sigue estos pasos para ejecutar el proyecto en tu entorno local.

1.  **Clonar el repositorio:**
    ```sh
    git clone git@github.com:nuriacalo/CV_Interfaces.git
    cd nombre-del-directorio
    ```

2.  **Obtener las dependencias de Flutter:**
    ```sh
    flutter pub get
    ```

3.  **Ejecutar la aplicación:**
    Puedes ejecutar la aplicación en un emulador, un dispositivo físico o en un navegador web.
    ```sh
    flutter run
    ```
    Para ejecutar específicamente en Chrome:
    ```sh
    flutter run -d chrome
    ```

## 📂 Estructura del Proyecto

El código fuente principal se encuentra en el directorio `lib/`.

```
lib/
├── main.dart               # Punto de entrada principal, contiene la pantalla de inicio y los datos del CV.
└── widgets/
    ├── education_card.dart     # Widget para mostrar un elemento de educación.
    ├── expandable_section.dart # Widget para las secciones de habilidades desplegables.
    ├── languages_card.dart     # Widget para mostrar un idioma.
    └── work_experience_card.dart # Widget para mostrar una experiencia laboral.
```

## ✏️ Personalización

Toda la información personal (experiencia, educación, habilidades, etc.) se encuentra centralizada en el archivo `lib/main.dart` dentro de la clase `_MyHomePageState`. Puedes modificar directamente las listas y mapas de datos en este archivo para personalizar el contenido del CV con tu propia información.