import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:kg_charts/kg_charts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Results extends StatefulWidget {
  final String id;
  final String name;

  const Results({super.key, required this.id, required this.name});
  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  int? puntajeTotal;
  List<String> Dimensiones = [
    "Gestión Productiva Primaria",
    "Gestión de Diseño y Desarrollo de Productos",
    "Gestión de Acabados Textiles",
    "Gestión de la Comerzializacion",
    "Gestión de Finanzas",
    "Gestión de la Tributación",
    "Educación",
    "Transporte",
    "Telecomunicaciones",
    "Salud",
    "Agua y Saneamiento",
    "Gestión Ambiental",
    "Tecnologiía  e Innovación",
    "Gestión Organizacional",
  ];
  List<int> puntajeDimension = List.filled(14, 0); // Rellena la lista con 0s

  @override
  void initState() {
    super.initState();
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
    for (var pregunta in response) {
      print(pregunta);
      puntajeTotal = puntajeTotal! + (pregunta['score'] as int);
      for (var i = 0; i < Dimensiones.length; i++) {
        if (Dimensiones[i] == pregunta['variable']) {
          puntajeDimension[i] += (pregunta['score'] as int);
        }
      }
    }
    setState(() {});
    print(puntajeTotal);
    print(puntajeDimension);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(166, 134, 13, 108),
          automaticallyImplyLeading: false,
          title: Center(
            child: const Text(
              'Resultados',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
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
                      ),
                                       ),
                   ),
                  puntajeTotal == null
                      ? CircularProgressIndicator()
                      : DonaConValorCentral(puntaje: puntajeTotal!),
                  Text(
                    'Su nivel es: ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  puntajeTotal == null
                      ? CircularProgressIndicator()
                      : RandomPositionContainer(
                          children: [
                            CircleWithText('1°',
                                hasBorder:
                                    (puntajeTotal! >= 0 && puntajeTotal! <= 20)
                                        ? true
                                        : false),
                            CircleWithText('2°',
                                hasBorder:
                                    (puntajeTotal! >= 21 && puntajeTotal! <= 40)
                                        ? true
                                        : false),
                            CircleWithText('3°',
                                hasBorder:
                                    (puntajeTotal! >= 41 && puntajeTotal! <= 60)
                                        ? true
                                        : false),
                            CircleWithText('4°',
                                hasBorder:
                                    (puntajeTotal! >= 61 && puntajeTotal! <= 80)
                                        ? true
                                        : false),
                            CircleWithText('5°',
                                hasBorder: (puntajeTotal! >= 81 &&
                                        puntajeTotal! <= 100)
                                    ? true
                                    : false),
                          ],
                        ),
                  RadarWidget(
                    skewing: 0,
                    radarMap: RadarMapModel(
                      legend: [
                        LegendModel('', const Color(0XFF0EBD8D)),
                      ],
                      indicator: [
                        IndicatorModel("G. Productiva Primaria", 100),
                        IndicatorModel(
                            "G. de Diseño y Desarrollo de Productos", 100),
                        IndicatorModel("G. de Acabados Textiles", 100),
                        IndicatorModel("G. de la Comerzializacion", 100),
                        IndicatorModel("G. de Finanzas", 100),
                        IndicatorModel("G. Tributación", 100),
                        IndicatorModel("Educación", 100),
                        IndicatorModel("Transporte", 100),
                        IndicatorModel("Telecomunicaciones", 100),
                        IndicatorModel("Salud", 100),
                        IndicatorModel("Agua y Saneamiento", 100),
                        IndicatorModel("G. Ambiental", 100),
                        IndicatorModel("Tecnologiía  e Innovación", 100),
                        IndicatorModel("G. Organizacional", 100),
                      ],
                      data: [
                        //   MapDataModel([48,32.04,1.00,94.5,19,60,50,30,19,60,50]),
                        //   MapDataModel([42.59,34.04,1.10,68,99,30,19,60,50,19,30]),
                        MapDataModel(
                            puntajeDimension.map((e) => e.toDouble()).toList()),
                      ],
                      radius: 105,
                      duration: 2000,
                      shape: Shape.square,
                      maxWidth: 60,
                      line: LineModel(4),
                    ),
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 10),
                    isNeedDrawLegend: true,
                    lineText: (p, length) => "${(p * 100 ~/ length)}%",
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
                  puntajeTotal == null
                      ? CircularProgressIndicator()
                      : Table(
                          puntajeDimension: puntajeDimension,
                        ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {},
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

  /*void fetchData() async {
   
  }*/
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
      height: 300,
      child: Stack(
        children: positionedChildren,
      ),
    );
  }
}

class Table extends StatefulWidget {
  final List<int> puntajeDimension;

  const Table({super.key, required this.puntajeDimension});
  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<Table> {
  List<List<String>> tableData = [];

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
    tableData[0][0] = "Gestión Productiva Primaria";
    tableData[1][0] = "Gestión de Diseño y Desarrollo de Productos";
    tableData[2][0] = "Gestión de Acabados Textiles";
    tableData[3][0] = "Gestión de la Comerzializacion";
    tableData[4][0] = "Gestión de Finanzas";
    tableData[5][0] = "Gestión de la Tributación";
    tableData[6][0] = "Educación";
    tableData[7][0] = "Transporte";
    tableData[8][0] = "Telecomunicaciones";
    tableData[9][0] = "Salud";
    tableData[10][0] = "Agua y Saneamiento";
    tableData[11][0] = "Gestión Ambiental";
    tableData[12][0] = "Tecnologiía  e Innovación";
    tableData[13][0] = "Gestión Organizacional";

    tableData[0][1] = "90";
    tableData[1][1] = "171";
    tableData[2][1] = "111";
    tableData[3][1] = "50";
    tableData[4][1] = "50";
    tableData[5][1] = "50";
    tableData[6][1] = "50";
    tableData[7][1] = "50";
    tableData[8][1] = "50";
    tableData[9][1] = "50";
    tableData[10][1] = "50";
    tableData[11][1] = "50";
    tableData[12][1] = "50";
    tableData[13][1] = "150";
    print("tablaassasdasdasdas");
    print(widget.puntajeDimension);
    for (int i = 0; i < 14; i++) {
      tableData[i][2] = widget.puntajeDimension[i].toString();
      double porcentaje =
          widget.puntajeDimension[i] / int.parse(tableData[i][1]) * 100.0;
      tableData[i][3] = '$porcentaje%';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Factor')),
          DataColumn(label: Text('Esperado')),
          DataColumn(label: Text('Puntaje')),
          DataColumn(label: Text('Porcentaje')),
        ],
        rows: List.generate(
          tableData.length,
          (index) => DataRow(
            cells: List.generate(
              tableData[index].length,
              (cellIndex) => DataCell(Text(tableData[index][cellIndex])),
            ),
          ),
        ),
      ),
    );
  }
}
