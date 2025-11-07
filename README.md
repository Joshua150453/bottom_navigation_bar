<table align="center">
    <thead>
        <tr>
            <td><img src="https://1.bp.blogspot.com/-3wALNMake70/XK-07VtIngI/AAAAAAABOrY/n3X_ZJV5fGEpTs8ppMQvKk_yic7BfyBYQCLcBGAs/s1600/universidad-la-salle-logo.jpg?raw=true" alt="EPIS" style="width:50%; height:auto"/></td>
            <th>
                <span style="font-weight:bold;">UNIVERSIDAD LA SALLE</span><br />
                <span style="font-weight:bold;">FACULTAD DE INGENIERÍA DE SOFTWARE</span><br />
            </th>
        </tr>
    </thead>
    <tbody>
        <tr><td colspan="3"><span style="font-weight:bold;">Formato</span>: Septimo Entregable</td></tr>
    </tbody>
</table>

<div align="center">
    <span style="font-weight:bold;">GUÍA DEL AVANCE</span><br />
</div>

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="3">INFORMACIÓN BÁSICA</th></tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2">
                    <table>
                        <tr><td>ASIGNATURA:</td><td>Programación para Dispositivos Moviles</td></tr>
                        <tr><td>TÍTULO DEL TRABAJO:</td><td> Actividades en Clase:  BottomNavigationBar Flutter</td></tr>
                        <tr>
                            <td>NÚMERO DEL TRABAJO:</td><td>09 - Tarea Evidencia</td>
                            <td>AÑO:</td><td>2025</td>
                            <td>NRO. SEMESTRE:</td><td>VI</td>
                        </tr>
                        <tr>
                            <td colspan="6">DOCENTE:
                                <ul>
                                    <li>Josue Miguel Flores Parra - jfloresp@ulasalle.edu.pe</li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">INTEGRANTE:
                                <ul>
                                    <li>Ortiz Rosas Joshua David</li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    </table>
                    <table>
                </td>
            </tr>
        </tbody>
    </table>
</div>

# INFORME DE FUNCIONAMIENTO – NAVEGACIÓN INFERIOR EN FLUTTER (BottomNavigationBar)

🔗 [Ubicacion de los archivos para la realizacion de la actividad](https://github.com/Joshua150453/bottom_navigation_bar/tree/master/lib)

## 1. Objetivo del proyecto
Implementar una aplicación con navegación entre diferentes pestañas utilizando BottomNavigationBar, permitiendo además enviar y recibir datos entre pantallas (en este caso, capturar y mostrar el nombre del usuario).

## 2. Archivos del proyecto
### main.dart
Punto de entrada de la app. Carga el diseño, tema y define la pantalla inicial.
🔗 [Ubicacion de main.dart](https://github.com/Joshua150453/bottom_navigation_bar/blob/master/lib/main.dart)


### home_page.dart
Gestiona la navegación inferior y muestra las diferentes pestañas, incluyendo el perfil.
🔗 [Ubicacion de home_page.dart](https://github.com/Joshua150453/bottom_navigation_bar/blob/master/lib/pages/home_page.dart)


### editar_perfil.dart
Pantalla que permite ingresar un nombre y devolverlo a home_page.dart.
🔗 [Ubicacion de editar_perfil.dart](https://github.com/Joshua150453/bottom_navigation_bar/blob/master/lib/pages/editar_perfil.dart)


## 3. Explicación del archivo main.dart
```Kotlin
// Importamos Flutter y el archivo donde está nuestra pantalla principal
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  // runApp inicia la aplicación
  runApp(const MyApp());
}
```
### ¿Qué hace este fragmento?
  - Es el punto de entrada de la aplicación Flutter.
  - La función main() se ejecuta primero y llama a runApp(), que inicializa toda la app.
  - runApp() muestra el widget raíz, en este caso MyApp().

### Widget MyApp
```Kotlin
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomNavigationBar Demo',

      // Tema visual de la app
      theme: ThemeData(primarySwatch: Colors.blue),

      // Indicamos que la pantalla inicial será MyHomePage
      home: const MyHomePage(),
    );
  }
}
```
### ¿Qué hace MyApp?
- Es el widget principal de la aplicación.
- Contiene un MaterialApp, que configura:
  - El tema visual
  - El título del proyecto
  - La pantalla que se mostrará primero: MyHomePage()
home: const MyHomePage() enlaza este archivo con home_page.dart.

## 4. Funcionamiento de home_page.dart (pantalla principal)
Este archivo usa StatefulWidget para:
  - Controlar el tab seleccionado (_selectedIndex)
  - Almacenar el nombre ingresado desde otra pantalla (_nombreUsuario)

El BottomNavigationBar permite cambiar entre cuatro pestañas:
  1. Inicio
  2. Usuarios
  3. Configuración
  4. Perfil (pestaña con botón para editar nombre)

Cada pestaña se almacena en una lista de widgets:
```Kotlin
late final List<Widget> _pages = [
    const Center(child: Text('Inicio', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Usuarios', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Configuración', style: TextStyle(fontSize: 24))),
    Container(), // Placeholder para la pestaña Perfil
  ];
```

Cuando el usuario toca una pestaña, se ejecuta:
```Kotlin
void_onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
```
Esto actualiza el contenido mostrado en pantalla.

## 5. Funcionamiento de editar_perfil.dart (captura de datos)
  - La pantalla contiene un TextField donde el usuario escribe su nombre.
  - Al presionar Guardar, se usa:
```Kotlin
Navigator.pop(context, _controller.text);
```
Esto hace dos cosas:
  1. Cierra la pantalla de edición.
  2. Envía el texto escrito hacia home_page.dart.

En home_page.dart, se recibe así:
```Kotlin
final nombre = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditarPerfilScreen(),
                ),
              );

              // Si recibimos un nombre desde EditarPerfilScreen:
              if (nombre != null) {
                setState(() {
                  _nombreUsuario = nombre; // Se actualiza el nombre
                });
```
Esto actualiza el texto mostrado en el tab Perfil sin recargar la app.

## 7. Conclusión
Este proyecto permite comprender:
- ✅ Uso de BottomNavigationBar
- ✅ Manejo de estado con StatefulWidget
- ✅ Navegación entre pantallas (Navigator.push y Navigator.pop)
- ✅ Paso de datos entre pantallas










