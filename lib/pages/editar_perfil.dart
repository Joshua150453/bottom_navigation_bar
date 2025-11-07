import 'package:flutter/material.dart';

// Esta pantalla permite capturar el nombre mediante un TextField
class EditarPerfilScreen extends StatefulWidget {
  const EditarPerfilScreen({super.key});

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {

  // Controlador para acceder al texto escrito en el TextField
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior de la pantalla
      appBar: AppBar(title: const Text('Editar perfil')),

      // Contenido centrado con padding
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input donde se ingresará el nombre
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),

            const SizedBox(height: 20),

            // Botón para guardar el nombre correctamente
            ElevatedButton(
              onPressed: () {
                // Devuelve el valor ingresado a la pantalla anterior
                Navigator.pop(context, _controller.text);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
