import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:ict/registro.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;

class RoadMap extends StatelessWidget {
  final List<Uint8List> images;
  final Map<int, Map<String, dynamic>> answers;
  final String id;
  final String name;
  final String document;
  final List<String> activity;
  final String organization;

  RoadMap(
      {super.key,
      required this.images,
      required this.answers,
      required this.id,
      required this.name,
      required this.document,
      required this.activity,
      required this.organization});

  final GlobalKey _globalKey1 = GlobalKey();
  Future<void> _generatePDF() async {
    final pdf = pdfWidgets.Document();
    print(answers);
    // Verificar que los datos estén presentes
    if (answers == null || answers.isEmpty) {
      print('No hay datos para generar el PDF.');
      return;
    }

    // Agrupar las preguntas por categoría
    Map<String, List<Map<String, dynamic>>> groupedAnswers = {};

    answers.forEach((index, answer) {
      final category = answer['category'];
      if (!groupedAnswers.containsKey(category)) {
        groupedAnswers[category] = [];
      }
      groupedAnswers[category]?.add(answer);
    });

    // Lista para almacenar todos los widgets
    final content = <pdfWidgets.Widget>[];
    content.add(
      pdfWidgets.Center(
        child: pdfWidgets.Text(
          'Hoja de Respuestas',
          style: pdfWidgets.TextStyle(
            fontSize: 24,
            fontWeight: pdfWidgets.FontWeight.bold,
            color: PdfColors.purple,
          ),
        ),
      ),
    );
    content.add(pdfWidgets.Container(
        margin: pdfWidgets.EdgeInsets.symmetric(vertical: 20),
        padding: pdfWidgets.EdgeInsets.all(10),
        color: PdfColors.white,
        child: pdfWidgets.Row(
            mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
            children: [
              pdfWidgets.Column(
                crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                children: [
                  pdfWidgets.RichText(
                    text: pdfWidgets.TextSpan(
                      children: [
                        pdfWidgets.TextSpan(
                          text: 'NOMBRES: ',
                          style: pdfWidgets.TextStyle(
                            fontSize: 12,
                            fontWeight: pdfWidgets.FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                        pdfWidgets.TextSpan(
                          text: name,
                          style: pdfWidgets.TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  pdfWidgets.SizedBox(height: 5),
                  pdfWidgets.RichText(
                    text: pdfWidgets.TextSpan(
                      children: [
                        pdfWidgets.TextSpan(
                          text: 'RUC/DNI: ',
                          style: pdfWidgets.TextStyle(
                            fontSize: 12,
                            fontWeight: pdfWidgets.FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                        pdfWidgets.TextSpan(
                          text: document,
                          style: pdfWidgets.TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              pdfWidgets.Column(
                crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                children: [
                  pdfWidgets.RichText(
                    text: pdfWidgets.TextSpan(
                      children: [
                        pdfWidgets.TextSpan(
                          text: 'ACTIVIDAD: ',
                          style: pdfWidgets.TextStyle(
                            fontSize: 12,
                            fontWeight: pdfWidgets.FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                        pdfWidgets.TextSpan(
                          text: activity.toString(),
                          style: pdfWidgets.TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  pdfWidgets.SizedBox(height: 5),
                  pdfWidgets.RichText(
                    text: pdfWidgets.TextSpan(
                      children: [
                        pdfWidgets.TextSpan(
                          text: 'TIPO DE ORGANIZACIÓN: ',
                          style: pdfWidgets.TextStyle(
                            fontSize: 12,
                            fontWeight: pdfWidgets.FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                        pdfWidgets.TextSpan(
                          text: organization,
                          style: pdfWidgets.TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ])));
    int numQuestion = 0;
    groupedAnswers.forEach((category, answers) {
      // Añadir el encabezado de la categoría
      content.add(pdfWidgets.Header(
        level: 1,
        text: category,
        textStyle: pdfWidgets.TextStyle(
          fontSize: 18,
          fontWeight: pdfWidgets.FontWeight.bold,
          color: PdfColors.blueAccent,
        ),
      ));

      answers.forEach((answer) {
        final question = answer['question'];
        final response = answer['response'];
        numQuestion += 1;
        // Añadir la pregunta al contenido
        content.add(pdfWidgets.Text(
          '${numQuestion}.- $question',
          style: pdfWidgets.TextStyle(
            fontSize: 14,
            fontWeight: pdfWidgets.FontWeight.bold,
          ),
        ));
        content.add(pdfWidgets.SizedBox(height: 5));

        // Añadir la respuesta o las respuestas al contenido
        if (response is String) {
          content.add(
            pdfWidgets.Bullet(
              text: response,
              style: pdfWidgets.TextStyle(
                fontSize: 12,
              ),
            ),
          );
        } else if (response is List<String>) {
          response.forEach((resp) {
            content.add(
              pdfWidgets.Bullet(
                text: resp,
                style: pdfWidgets.TextStyle(
                  fontSize: 12,
                ),
              ),
            );
          });
        }
        content.add(pdfWidgets.SizedBox(height: 15));
      });
    });

    // Añadir todo el contenido a una sola página o a múltiples páginas si es necesario
    pdf.addPage(
      pdfWidgets.MultiPage(
        build: (context) => content,
        margin: pdfWidgets.EdgeInsets.all(
            20), // Ajuste de márgenes según sea necesario
      ),
    );

    String? outputPath = await FilePicker.platform.saveFile(
      dialogTitle: 'Save PDF to...',
      fileName: 'example.pdf',
    );

    if (outputPath != null) {
      final file = File(outputPath);
      try {
        final bytes = await pdf.save();
        print('Tamaño del PDF en bytes: ${bytes.length}');
        await file.writeAsBytes(bytes);
        print('PDF saved to $outputPath');
      } catch (e, stackTrace) {
        print('Error saving PDF: $e');
        print('Stack Trace: $stackTrace');
      }
    } else {
      print('User canceled the picker');
    }
  }

  Future<Uint8List> _capturePng(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (e) {
      print(e);
      return Uint8List(0);
    }
  }

  Future<Uint8List> _loadHeaderImage() async {
    final ByteData data = await rootBundle.load('assets/images/header.png');
    return data.buffer.asUint8List();
  }

  // Función para generar el PDF con todas las imágenes de gráficos capturadas
  Future<void> _generatePDFWithGraphs(
      List<Uint8List> images, Uint8List headerImageBytes) async {
    final pdf = pdfWidgets.Document();
    final headerImage = pdfWidgets.MemoryImage(headerImageBytes);

    pdf.addPage(
      pdfWidgets.MultiPage(
        margin: pdfWidgets.EdgeInsets.all(
            0), // Margen a cero para mantener la imagen lo más arriba posible
        header: (context) {
          return pdfWidgets.Container(
            alignment: pdfWidgets.Alignment.topCenter,
            child: pdfWidgets.Image(
              headerImage,
              fit: pdfWidgets.BoxFit.contain,
              width: PdfPageFormat
                  .a4.width, // Ajusta el ancho al máximo de la página A4
              height: PdfPageFormat
                  .a4.height, // Ajusta la altura al 10% de la página A4
            ),
          );
        },
        build: (context) => [
          // Agregar el contenido detallado
          pdfWidgets.Container(
            margin: pdfWidgets.EdgeInsets.symmetric(vertical: 20),
            padding: pdfWidgets.EdgeInsets.all(10),
            child: pdfWidgets.Row(
              mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
              children: [
                pdfWidgets.Column(
                  crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                  children: [
                    pdfWidgets.RichText(
                      text: pdfWidgets.TextSpan(
                        children: [
                          pdfWidgets.TextSpan(
                            text: 'NOMBRES: ',
                            style: pdfWidgets.TextStyle(
                              fontSize: 12,
                              fontWeight: pdfWidgets.FontWeight.bold,
                              color: PdfColors.black,
                            ),
                          ),
                          pdfWidgets.TextSpan(
                            text: name,
                            style: pdfWidgets.TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    pdfWidgets.SizedBox(height: 5),
                    pdfWidgets.RichText(
                      text: pdfWidgets.TextSpan(
                        children: [
                          pdfWidgets.TextSpan(
                            text: 'RUC/DNI: ',
                            style: pdfWidgets.TextStyle(
                              fontSize: 12,
                              fontWeight: pdfWidgets.FontWeight.bold,
                              color: PdfColors.black,
                            ),
                          ),
                          pdfWidgets.TextSpan(
                            text: document,
                            style: pdfWidgets.TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                pdfWidgets.Column(
                  crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                  children: [
                    pdfWidgets.RichText(
                      text: pdfWidgets.TextSpan(
                        children: [
                          pdfWidgets.TextSpan(
                            text: 'ACTIVIDAD: ',
                            style: pdfWidgets.TextStyle(
                              fontSize: 12,
                              fontWeight: pdfWidgets.FontWeight.bold,
                              color: PdfColors.black,
                            ),
                          ),
                          pdfWidgets.TextSpan(
                            text: activity.toString(),
                            style: pdfWidgets.TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    pdfWidgets.SizedBox(height: 5),
                    pdfWidgets.RichText(
                      text: pdfWidgets.TextSpan(
                        children: [
                          pdfWidgets.TextSpan(
                            text: 'TIPO DE ORGANIZACIÓN: ',
                            style: pdfWidgets.TextStyle(
                              fontSize: 12,
                              fontWeight: pdfWidgets.FontWeight.bold,
                              color: PdfColors.black,
                            ),
                          ),
                          pdfWidgets.TextSpan(
                            text: organization,
                            style: pdfWidgets.TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Agregar las imágenes de los gráficos
          ...images.map((imageBytes) {
            final pdfImage = pdfWidgets.MemoryImage(imageBytes);
            return pdfWidgets.Center(
              child: pdfWidgets.Image(
                pdfImage,
                width: PdfPageFormat.a4.width *
                    1.8, // Ajusta el ancho al 80% de la página A4
                height: PdfPageFormat.a4.height *
                    0.8, // Ajusta la altura al 40% de la página A4
                fit: pdfWidgets.BoxFit.contain, // Ajusta el ajuste de la imagen
              ),
            );
          }).toList(),
        ],
      ),
    );

    String? outputPath = await FilePicker.platform.saveFile(
      dialogTitle: 'Save PDF to...',
      fileName: 'graficos.pdf',
    );

    if (outputPath != null) {
      final file = File(outputPath);
      try {
        final bytes = await pdf.save();
        await file.writeAsBytes(bytes);
        print('PDF saved to $outputPath');
      } catch (e, stackTrace) {
        print('Error saving PDF: $e');
        print('Stack Trace: $stackTrace');
      }
    } else {
      print('User canceled the picker');
    }
  }

  // Capturar y generar el PDF con todos los gráficos
  void _captureAndGeneratePdf() async {
    List<Uint8List> imagesRes = images;

    // Capturar cada gráfico usando sus respectivas GlobalKey
    //imagesRes.add(await _capturePng(_globalKey1));
    //images.add(await _capturePng(_globalKey3));
    Uint8List headerImageBytes = await _loadHeaderImage();
    _generatePDFWithGraphs(imagesRes, headerImageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 122, 51, 129),
          title: const Center(
            child: Text(
              'Hoja de Ruta',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  width: double.infinity,
                  height: 230,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.282, 1.0],
                      colors: [
                        Color.fromARGB(130, 122, 51, 129),
                        Color.fromARGB(255, 255, 255, 255),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/images/Alpaca - Face right.png',
                          width: 220,
                          height: 220,
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 30,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          width: 160,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(100, 122, 51, 129),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            'Te recomendamos seguir los siguientes pasos',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/start.png',
                  width: 72,
                  height: 80,
                ),
                const SizedBox(
                  height: 30,
                ),
                RepaintBoundary(
                  key: _globalKey1,
                  child: CustomPaint(
                    painter: StepPainter(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 1; i <= 14; i++)
                            StepNumber(
                              stepNumber: i,
                              content:
                                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  child: Image.asset(
                    'assets/images/end.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registro()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(166, 134, 13, 108),
                      elevation: 3,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    child: const Text(
                      'Nuevo Calculo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: _captureAndGeneratePdf,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(166, 134, 13, 108),
                      elevation: 3,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    child: const Text(
                      'Descargar Informe',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: _generatePDF,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(166, 134, 13, 108),
                      elevation: 3,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    child: const Text(
                      'Descargar Backup de Preguntas',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StepPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    var path = Path();

    double start = 2; // Adjust the start position based on your layout
    double space = (size.height - 1600) / 2; // Space between circles

    path.moveTo(size.width / 2, start);
    for (int i = 1; i < 15; i++) {
      path.arcToPoint(
        Offset(size.width / 2, start + space * i),
        radius: const Radius.circular(50),
        clockwise: i % 2 == 0,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class StepNumber extends StatelessWidget {
  final int stepNumber;
  final String content;

  StepNumber({required this.stepNumber, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        stepNumber % 2 == 0
            ? Container(
                width: 100,
                height: 100,
                child: Text(
                  content,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
            : Text(
                'Paso $stepNumber',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 122, 51, 129),
                  fontWeight: FontWeight.bold,
                ),
              ),
        Container(
          alignment: Alignment.center,
          margin: stepNumber % 2 == 1
              ? const EdgeInsets.only(left: 60, bottom: 30)
              : const EdgeInsets.only(right: 60, bottom: 30),
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 10, 2, 110),
            shape: BoxShape.circle,
          ),
          child: Text(
            '$stepNumber',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        stepNumber % 2 == 1
            ? Container(
                width: 100,
                height: 100,
                child: Text(
                  content,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
            : Text(
                'Paso $stepNumber',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 122, 51, 129),
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }
}
