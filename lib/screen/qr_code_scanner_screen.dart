import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeScannerScreen extends StatelessWidget {
  const QrCodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) {
          final List<Barcode> barcodes = capture.barcodes;

          for (final barcode in barcodes) {
            if (barcode.rawValue != null) {
              String url = barcode.rawValue!; // Obtén el valor del código QR

              // Muestra un diálogo para preguntar si desea abrir la URL
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Código QR detectado'),
                    content: Text('¿Deseas abrir la siguiente URL?\n$url'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cierra el diálogo
                        },
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () async {
                          // Intenta abrir la URL
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'No se pudo abrir $url';
                          }
                          Navigator.of(context).pop(); // Cierra el diálogo
                        },
                        child: const Text('Abrir'),
                      ),
                    ],
                  );
                },
              );

              break; // Salir del bucle después de encontrar el primer código
            }
          }
        },
      ),
    );
  }
}
