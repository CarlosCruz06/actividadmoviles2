import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definición de estilo de texto para evitar repetición
    final TextStyle textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade700,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('assets/UP.jpg'), // Asegúrate de tener la imagen en esta ubicación
              radius: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Carlos Ivan Cruz Zarmiento',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Ingeniería en Software 9B',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Programación Móvil II',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '221236',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Contenedor vacío sin contenido adicional
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
