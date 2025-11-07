import 'package:flutter/material.dart';
import 'editar_perfil.dart'; // Importamos la pantalla para editar el nombre

// StatefulWidget permite cambiar estado (texto del perfil y navegación)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Índice del tab seleccionado
  int _selectedIndex = 0;

  // Nombre que se mostrará en la sección perfil
  String _nombreUsuario = "Sin definir";

  // Lista de tabs (excepto Perfil, porque ese se genera dinámicamente)
  late final List<Widget> _pages = [
    const Center(child: Text('Inicio', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Usuarios', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Configuración', style: TextStyle(fontSize: 24))),
    Container(), // Placeholder para la pestaña Perfil
  ];

  // Widget del tab Perfil (dinámico para que se actualice con setState)
  Widget perfilWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text(
            "Nombre del usuario:",
            style: TextStyle(fontSize: 18),
          ),

          // Mostrar el nombre del usuario
          Text(
            _nombreUsuario,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          // Botón para ir a "Editar perfil"
          ElevatedButton(
            child: const Text("Editar perfil"),
            onPressed: () async {
              // Navega y espera el resultado
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
              }
            },
          ),
        ],
      ),
    );
  }

  // Cambia el índice del tab cuando se toca en el BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('BottomNavigationBar Demo')),

      // Si estamos en Perfil (índice 3), muestra perfilWidget()
      // Caso contrario, muestra la página correspondiente
      body: _selectedIndex == 3 ? perfilWidget() : _pages[_selectedIndex],

      // Barra inferior con navegación
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        // Colores Usados
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Usuarios'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
