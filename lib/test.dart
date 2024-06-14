import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';



class prueba extends StatefulWidget {
  @override
  _pruebaState createState() => _pruebaState();
}

class _pruebaState extends State<prueba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exportar Pantalla como PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _exportToPDF(context);
          },
          child: Text('Exportar a PDF'),
        ),
      ),
    );
  }

  Future<void> _exportToPDF(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Pregunta: quessss',
                  ),
              pw.SizedBox(height: 5),
              pw.Text('Respuesta: ressss'),
              pw.SizedBox(height: 15),
            ],
          );
        },
      ),
    );

    // Guardar PDF temporalmente
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());

    // Permitir al usuario elegir la ubicación de guardado
    String? outputFilePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Guardar PDF en...',
      fileName: 'example.pdf',
    );

    if (outputFilePath != null) {
      // Mover el archivo temporal a la ubicación seleccionada
      final newFile = await file.copy(outputFilePath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF guardado en: ${newFile.path}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Guardado cancelado')),
      );
    }
  }
}
