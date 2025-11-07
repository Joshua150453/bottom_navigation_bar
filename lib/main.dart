// Importamos Flutter y el archivo donde está la pantalla principal
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

/*
 * Actividad principal (Formulario)
 * Autor: Joshua David Ortiz Rosas
 * Fecha creación: 07/11/2025
 * Última modificación: 07/11/2025
 */

void main() {
  // runApp inicia la aplicación
  runApp(const MyApp());
}

// Widget principal de la app
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
