# Recepies
    Segunda Actividad del Curso comp Movil

## Getting Started


>Widgets and Functions Explained as 0 knowlage

| Widgets          | Description |
| ---------------- | ----------- |
| MaterialApp      | Widget principal de Flutter o clase que actúa como root o raíz del proyecto. Proporciona funcionalidades clave como la definición de rutas, temas, localización, entre otros. Esencial para cualquier aplicación Flutter, ya que envuelve todo el árbol de widgets. |
| Scaffold         | Widget que implementa la estructura visual básica de una pantalla de material design. Proporciona contenedores para elementos como app bars, snack bars, y un body que contiene el contenido principal de la pantalla. |
| AppBar           | Un widget que se utiliza en la parte superior de la aplicación como una barra de herramientas. Contiene elementos como el título, íconos y acciones que el usuario puede realizar. |
| Center           | Un widget que centra a su hijo dentro de sí mismo. Se utiliza comúnmente para centrar un widget en la pantalla o dentro de un contenedor. |
| ElevatedButton   | Un widget que representa un botón con elevación, lo que significa que tiene un efecto de sombra debajo de él. Se utiliza para realizar acciones importantes y generalmente se resalta en la interfaz de usuario. |
| Route            | Un objeto que representa una pantalla o página en Flutter. Se utiliza en el sistema de navegación para cargar y transicionar entre diferentes pantallas o vistas en la aplicación. |
| PageRouteBuilder | Un constructor de rutas de página personalizable en Flutter que permite definir animaciones de transición personalizadas entre pantallas. |

### Propiedades de PageRouteBuilder
- `pageBuilder`: Una función que construye el contenido de la pantalla. Se llama cada vez que la ruta asociada es navegada.
- `transitionsBuilder`: Una función que define la animación de transición entre pantallas. Permite personalizar cómo se anima la transición de una pantalla a otra.

### Propiedades de MaterialApp
- `title`: Una cadena de texto que describe la aplicación, utilizada en la herramienta para cambiar de tareas, por ejemplo.
- `home`: El widget que se mostrará cuando se inicie la aplicación y no se haya definido ninguna ruta.
- `theme`: Define el tema global para la aplicación, afectando a colores, tipografías y estilos de widgets.

### Propiedades de Scaffold
- `appBar`: Un widget que se coloca en la parte superior del Scaffold. Normalmente es un AppBar, que se utiliza para mostrar un título, iconos o acciones relacionadas con la pantalla actual.
- `body`: El contenido principal del Scaffold. Ocupa la mayor parte de la pantalla y generalmente contiene otros widgets presentados en un contexto relevante para la aplicación.
- `floatingActionButton`: Un botón que se coloca sobre el `body` y generalmente en la esquina inferior derecha (aunque su posición puede ser ajustada). Se utiliza para una acción principal en la pantalla.
