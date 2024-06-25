import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:ict/roadmap.dart';
import 'package:kg_charts/kg_charts.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

class Results extends StatefulWidget {
  final String id;
  final String name;
  final int code;
  final Map<int, Map<String, dynamic>> answeres;
  final String document;
  final List<String> activity;
  final String organization;
  const Results(
      {super.key,
      required this.id,
      required this.name,
      required this.code,
      required this.answeres,
      required this.document,
      required this.activity,
      required this.organization});
  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  int? puntajeTotal;
  int puntajeMaximo = 0;
  List<String> Dimensiones = [
    "Gestión Organizacional",
    "Gestión Productiva Primaria",
    "Gestión de Diseño y Desarrollo de Productos",
    "Gestión de Acabados Textiles",
    "Gestión de la Comercialización",
    "Gestión de Finanzas",
    "Gestión de la Tributación",
    "Educación",
    "Transporte",
    "Telecomunicaciones",
    "Salud",
    "Agua y Saneamiento",
    "Gestión Ambiental",
    "Tecnologia e Innovación",
  ];
  List<String> summaryDimensions = [
    "G. Organizacional",
    "G. Productiva Primaria",
    "G. de Diseño y Desarrollo de Productos",
    "G. de Acabados Textiles",
    "G. de la Comercialización",
    "G. de Finanzas",
    "G. de la Tributación",
    "Educación",
    "Transporte",
    "Telecomunicaciones",
    "Salud",
    "Agua y Saneamiento",
    "G. Ambiental",
    "Tecnologia e Innovación",
  ];
  List<int> puntajeDimension = List.filled(14, -1); // Rellena la lista con 0s
  List<int> puntajeDimensionMax = List.filled(14, 0);
  List<double> percentage = List.filled(14, 0);
  final GlobalKey _globalKey1 = GlobalKey();
  final GlobalKey _globalKey2 = GlobalKey();
  Set<String> dimensionUsed = {};
  @override
  void initState() {
    super.initState();
    if (widget.code == 1) puntajeMaximo = 249;
    if (widget.code == 2) puntajeMaximo = 206;
    if (widget.code == 3) puntajeMaximo = 204;
    puntajeDimensionMax[0] = 17;
    puntajeDimensionMax[1] = 55;
    widget.code == 1
        ? puntajeDimensionMax[2] = 53
        : widget.code == 2
            ? puntajeDimensionMax[2] = 10
            : puntajeDimensionMax[2] = 8;
    puntajeDimensionMax[3] = 31;
    puntajeDimensionMax[4] = 73;
    puntajeDimensionMax[5] = 8;
    puntajeDimensionMax[6] = 12;
    puntajeDimensionMax[7] = 6;
    puntajeDimensionMax[8] = 7;
    puntajeDimensionMax[9] = 9;
    puntajeDimensionMax[10] = 11;
    puntajeDimensionMax[11] = 8;
    puntajeDimensionMax[12] = 26;
    puntajeDimensionMax[13] = 15;
    print("puntaje maximo es: $puntajeMaximo");
    fetchData();
  }

  Future<void> fetchData() async {
    // La función fetchData es async
    final client = Supabase.instance.client;
    final response =
        await client.from('Respuestas').select().eq('user', widget.id);
    puntajeTotal = 0;
    print('el id es: ${widget.id}');
    print(response);
    /*for (var pregunta in response) {
      print(pregunta);
      puntajeTotal = puntajeTotal! + (pregunta['score'] as int);
      for (var i = 0; i < Dimensiones.length; i++) {
        if (Dimensiones[i] == pregunta['variable']) {
          puntajeDimension[i] += (pregunta['score'] as int);
        }
      }
    }*/
    widget.answeres.forEach((index, answer) {
      for (var i = 0; i < Dimensiones.length; i++) {
        if (Dimensiones[i] == answer['variable']) {
          dimensionUsed.add(Dimensiones[i]);
        }
      }
    });
    widget.answeres.forEach((index, answer) {
      print('${answer['question']} ${answer['score']}');
      puntajeTotal = puntajeTotal! + (answer['score'] as int);
      for (var i = 0; i < Dimensiones.length; i++) {
        if (Dimensiones[i] == answer['variable']) {
          if (puntajeDimension[i] == -1) puntajeDimension[i] = 0;
          puntajeDimension[i] += (answer['score'] as int);
        }
      }
    });
    for (var i = 0; i < Dimensiones.length; i++) {
      percentage[i] = puntajeDimension[i] / puntajeDimensionMax[i];
    }
    setState(() {});
    print(puntajeTotal);
    print(puntajeDimension);
    print(puntajeDimensionMax);
    print("puntaje maximo es: $puntajeMaximo");
    print("es::::::::::::::");
    print(puntajeDimension.map((e) => e.toDouble()).toList());
  }

  Future<void> _generatePDF() async {
    final pdf = pdfWidgets.Document();
    print(widget.answeres);
    // Verificar que los datos estén presentes
    if (widget.answeres == null || widget.answeres.isEmpty) {
      print('No hay datos para generar el PDF.');
      return;
    }

    // Agrupar las preguntas por categoría
    Map<String, List<Map<String, dynamic>>> groupedAnswers = {};

    widget.answeres.forEach((index, answer) {
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
                          text: widget.name,
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
                          text: widget.name,
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
                          text: widget.name,
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
                          text: '${widget.name} cuando sea vomos',
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
      Set<Uint8List> images, Uint8List headerImageBytes) async {
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
                            text: widget.name,
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
                            text: widget.name,
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
                            text: widget.name,
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
                            text: widget.name,
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
  Future<Set<Uint8List>> _captureAndGeneratePdf() async {
    Set<Uint8List> images = {};

    // Capturar cada gráfico usando sus respectivas GlobalKey
    images.add(await _capturePng(_globalKey1));
    images.add(await _capturePng(_globalKey2));
    //images.add(await _capturePng(_globalKey3));
    return images;
    Uint8List headerImageBytes = await _loadHeaderImage();
    _generatePDFWithGraphs(images, headerImageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 122, 51, 129),
          automaticallyImplyLeading: true,
          title: Center(
            child: const Text(
              'Resultados',
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
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    key: _globalKey1,
                    child: Column(children: [
                      puntajeTotal == null
                          ? CircularProgressIndicator()
                          : DonaConValorCentral(puntaje: puntajeTotal!),
                      Text(
                        'Su nivel competitividad es:',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: ui.TextAlign.center,
                      ),
                      puntajeTotal == null
                          ? CircularProgressIndicator()
                          : RandomPositionContainer(
                              children: [
                                CircleWithText('1°',
                                    hasBorder: (puntajeTotal! >= 0 &&
                                            puntajeTotal! <=
                                                puntajeMaximo / 5.0)
                                        ? true
                                        : false),
                                CircleWithText('2°',
                                    hasBorder: (puntajeTotal! >=
                                                ((puntajeMaximo / 5.0) + 1) &&
                                            puntajeTotal! <=
                                                (puntajeMaximo / 5.0) * 2)
                                        ? true
                                        : false),
                                CircleWithText('3°',
                                    hasBorder: (puntajeTotal! >=
                                                ((puntajeMaximo / 5.0) * 2 +
                                                    1) &&
                                            puntajeTotal! <=
                                                (puntajeMaximo / 5.0) * 3)
                                        ? true
                                        : false),
                                CircleWithText('4°',
                                    hasBorder: (puntajeTotal! >=
                                                ((puntajeMaximo / 5.0) * 3 +
                                                    1) &&
                                            puntajeTotal! <=
                                                (puntajeMaximo / 5.0) * 4)
                                        ? true
                                        : false),
                                CircleWithText('5°',
                                    hasBorder: (puntajeTotal! >=
                                                ((puntajeMaximo / 5.0) * 4 +
                                                    1) &&
                                            puntajeTotal! <=
                                                (puntajeMaximo / 5.0) * 5)
                                        ? true
                                        : false),
                              ],
                            ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Niveles de competitividad según el puntaje',
                          textAlign: ui.TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      tablaNiveles(),
                    ]),
                  ),
                  RepaintBoundary(
                    key: _globalKey2,
                    child: Column(
                      children: [
                        Text(
                          'Mapa de Radar',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 30),
                          child: RadarWidget(
                            skewing: 0,
                            radarMap: RadarMapModel(
                              legend: [
                                LegendModel(
                                    '', ui.Color.fromARGB(166, 122, 51, 129)),
                              ],
                              indicator: List.generate(summaryDimensions.length,
                                      (index) => index)
                                  .where((index) => dimensionUsed
                                      .contains(Dimensiones[index]))
                                  .map((index) => IndicatorModel(
                                        summaryDimensions[index],
                                        puntajeDimensionMax[index].toDouble(),
                                      ))
                                  .toList(),
                              data: [
                                //   MapDataModel([48,32.04,1.00,94.5,19,60,50,30,19,60,50]),
                                //MapDataModel([42.59,34.04,1.10,68,74,30,19,60,50,19,30,50,19,30]),
                                //MapDataModel([60.0, 8.0, 0.0, 60.0, 1.0, 4.0, 3.0, 2.0, 8.0, 7.0, 6.0, 7.0, 0.0, 4.0]),
                                MapDataModel(puntajeDimension
                                    .where((e) => e >= 0)
                                    .map((e) => e.toDouble())
                                    .toList()),
                              ],
                              radius: 104,
                              duration: 2000,
                              shape: Shape.square,
                              maxWidth: 60,
                              line: LineModel(4),
                            ),
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                            isNeedDrawLegend: false,
                            //lineText: (p, length) => "${(p * 100 ~/ length)}%",
                            dilogText: (IndicatorModel indicatorModel,
                                List<LegendModel> legendModels,
                                List<double> mapDataModels) {
                              StringBuffer text = StringBuffer("");
                              for (int i = 0; i < mapDataModels.length; i++) {
                                text.write(
                                    "${legendModels[i].name} : ${mapDataModels[i].toString()}");
                                if (i != mapDataModels.length - 1) {
                                  text.write("\n");
                                }
                              }
                              return text.toString();
                            },
                            outLineText: (data, max) => "${data * 100 ~/ max}%",
                          ),
                        ),
                        Text(
                          'Factores de evaluación de competitivad',
                          textAlign: ui.TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        puntajeTotal == null
                            ? CircularProgressIndicator()
                            : TableD(
                                puntajeDimension: puntajeDimension,
                                puntajeDimensionMax: puntajeDimensionMax,
                                dimensionUsed: dimensionUsed,
                              ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        Set<Uint8List> images = await _captureAndGeneratePdf();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RoadMap(
                                    images: images,
                                    answers: widget.answeres,
                                    id: widget.id,
                                    name: widget.name,
                                    document: widget.document,
                                    activity: widget.activity,
                                    organization: widget.organization,
                                    percentage: percentage,
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(166, 134, 13, 108),
                        elevation: 3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                      ),
                      child: const Text(
                        'Ver mi Hoja de Ruta',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tablaNiveles() {
    List<List<String>> tableData = List.generate(
      5,
      (_) => List<String>.filled(3, ''),
    );
    tableData[0][1] = 'Muy Alto';
    tableData[1][1] = 'Alto';
    tableData[2][1] = 'Mediana';
    tableData[3][1] = 'Bajo';
    tableData[4][1] = 'Muy Bajo';
    for (int i = 0; i < 5; i++) {
      tableData[i][0] = (5 - i).toString();
      tableData[5 - i - 1][2] =
          '${((puntajeMaximo / 5.0) * i + (i != 0 ? 1 : 0)).toStringAsFixed(1)} - ${((puntajeMaximo / 5.0) * (i + 1)).toStringAsFixed(1)} puntos';
    }
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(50.0),
          1: FixedColumnWidth(120.0),
          2: FixedColumnWidth(175.0),
        },
        border: TableBorder.all(),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Nivel',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Nivel de Competitividad',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Puntaje',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ...tableData.map(
            (row) => TableRow(
              children: row.map(
                (cell) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cell,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DonaConValorCentral extends StatefulWidget {
  final int puntaje;

  const DonaConValorCentral({super.key, required this.puntaje});
  @override
  State<DonaConValorCentral> createState() => _DonaConValorCentralState();
}

class _DonaConValorCentralState extends State<DonaConValorCentral> {
  List<_ChartData> data = [];
  @override
  void initState() {
    super.initState();
    print('el puntaje es widget.puntaje ${widget.puntaje}');
    data = [
      _ChartData('Gold', widget.puntaje.toDouble(),
          const Color.fromRGBO(71, 5, 116, 1)),
      _ChartData('Gold', 100, Colors.grey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <CircularSeries<_ChartData, String>>[
        DoughnutSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            pointColorMapper: (_ChartData data, _) => data.color,
            innerRadius: '80%')
      ],
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Center(
            child: Text(
              '${data[0].y.toInt()} \n Puntos',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(71, 5, 116, 1),
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class CircleWithText extends StatelessWidget {
  final String text;
  final bool hasBorder;

  const CircleWithText(
    this.text, {
    Key? key,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color.fromRGBO(71, 5, 116, 1),
      borderPadding: const EdgeInsets.all(4), // Color de las líneas punteadas
      strokeWidth: hasBorder ? 12 : 0,
      dashPattern: const [4, 13],
      borderType: BorderType.Circle,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: hasBorder ? null : const Color.fromRGBO(71, 5, 116, 1),
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: hasBorder ? Colors.black : Colors.white,
                  ),
                ),
                TextSpan(
                  text: '\nnivel',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: hasBorder ? Colors.black : Colors.white,
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

class RandomPositionContainer extends StatelessWidget {
  final List<Widget> children;

  RandomPositionContainer({required this.children});

  @override
  Widget build(BuildContext context) {
    List<Widget> positionedChildren = [];
    final List<List<double>> positions = [
      [215, 25],
      [180, 125],
      [115, 30],
      [65, 115],
      [5, 5]
    ];
    for (var i = 0; i < children.length; i++) {
      positionedChildren.add(
        Positioned(
          left: positions[i][0],
          top: positions[i][1],
          child: children[i],
        ),
      );
    }

    return Container(
      width: 300,
      height: 260,
      child: Stack(
        children: positionedChildren,
      ),
    );
  }
}

class TableD extends StatefulWidget {
  final List<int> puntajeDimension;
  final List<int> puntajeDimensionMax;
  final Set<String> dimensionUsed;

  const TableD({
    super.key,
    required this.puntajeDimension,
    required this.puntajeDimensionMax,
    required this.dimensionUsed,
  });

  @override
  _TableDState createState() => _TableDState();
}

class _TableDState extends State<TableD> {
  List<List<String>> tableData = [];
  Set<int> outIndex = {};
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 14; i++) {
      tableData.add([
        'Fila ${i + 1}, Celda 1',
        'Fila ${i + 1}, Celda 2',
        'Fila ${i + 1}, Celda 3',
        'Fila ${i + 1}, Celda 4',
      ]);
    }
    tableData[0][0] = "G. Organizacional";
    tableData[1][0] = "G. Productiva Primaria";
    tableData[2][0] = "G. de Diseño y Desarrollo de Productos";
    tableData[3][0] = "G. de Acabados Textiles";
    tableData[4][0] = "G. de la Comercialización";
    tableData[5][0] = "G. de Finanzas";
    tableData[6][0] = "G. de la Tributación";
    tableData[7][0] = "Educación";
    tableData[8][0] = "Transporte";
    tableData[9][0] = "Telecomunicaciones";
    tableData[10][0] = "Salud";
    tableData[11][0] = "Agua y Saneamiento";
    tableData[12][0] = "G. Ambiental";
    tableData[13][0] = "Tecnología e Innovación";

    for (int i = 0; i < 14; i++) {
      if (widget.puntajeDimension[i] < 0) outIndex.add(i);
      tableData[i][1] = widget.puntajeDimensionMax[i].toString();
      tableData[i][2] = widget.puntajeDimension[i].toString();
      double porcentaje =
          widget.puntajeDimension[i] / widget.puntajeDimensionMax[i] * 100.0;
      tableData[i][3] = '${porcentaje.toStringAsFixed(2)}%';
    }
  }

  bool isPercentage(String value) {
    final percentageRegExp = RegExp(r'^\d{1,3}(\.\d+)?%$');
    return percentageRegExp.hasMatch(value);
  }

  Color getColor(String value) {
    if (isPercentage(value)) {
      double percentage = double.parse(value.replaceAll('%', ''));
      if (percentage < 50.0) {
        return const ui.Color.fromARGB(255, 255, 200, 206);
      } else {
        return ui.Color.fromARGB(255, 198, 239, 205);
      }
    }
    return Colors.transparent;
  }

  Color getTextColor(String value) {
    if (isPercentage(value)) {
      double percentage = double.parse(value.replaceAll('%', ''));
      if (percentage < 50.0) {
        return const Color.fromARGB(255, 150, 20, 32);
      } else {
        return const Color.fromARGB(255, 15, 84, 19);
      }
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Table(
          columnWidths: {
            0: FixedColumnWidth(16.0),
            1: FixedColumnWidth(340.0),
          },
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                Container(),
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(138.0),
                    1: FixedColumnWidth(67.0),
                    2: FixedColumnWidth(57.0),
                    3: FixedColumnWidth(78.0),
                  },
                  border: TableBorder.symmetric(inside: BorderSide()),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      children: [
                        ...["Factor", "Esperado", "Puntaje", "Porcentaje"].map(
                          (header) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(header,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Container(
                    color: const ui.Color.fromARGB(255, 254, 235, 156),
                    alignment: Alignment.center,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text('Interno',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(138.0),
                    1: FixedColumnWidth(67.0),
                    2: FixedColumnWidth(57.0),
                    3: FixedColumnWidth(78.0),
                  },
                  border: TableBorder.symmetric(inside: BorderSide()),
                  children: [
                    for (int i = 0; i < 7; i++)
                      if (!outIndex.contains(i))
                        TableRow(
                          children: tableData[i].map(
                            (cell) {
                              return TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.intrinsicHeight,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(2.0),
                                  color: getColor(cell),
                                  child: Text(
                                    cell,
                                    softWrap: true,
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: getTextColor(cell)),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                  ],
                )
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
                  child: Container(
                    alignment: Alignment.center,
                    color: Color.fromARGB(255, 40, 199, 151),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Center(
                        child: Text('Externo',
                            textAlign: TextAlign.center,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(138.0),
                    1: FixedColumnWidth(67.0),
                    2: FixedColumnWidth(57.0),
                    3: FixedColumnWidth(78.0),
                  },
                  border: TableBorder.symmetric(inside: BorderSide()),
                  children: [
                    ...tableData.sublist(7, 14).map(
                          (row) => TableRow(
                            children: row.map(
                              (cell) {
                                return TableCell(
                                  verticalAlignment: TableCellVerticalAlignment
                                      .intrinsicHeight,
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(2.0),
                                    color: getColor(cell),
                                    child: Center(
                                      child: Text(
                                        cell,
                                        style: TextStyle(
                                            color: getTextColor(cell)),
                                        softWrap: true,
                                        maxLines: 3,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
