import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:kg_charts/kg_charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(166, 134, 13, 108),
          title: const Text(
            'Resultados',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  DonaConValorCentral(),
                  const Text(
                    'Su nivel es:',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RandomPositionContainer(
                    children: const [
                      CircleWithText('1°'),
                      CircleWithText('2°'),
                      CircleWithText('3°'),
                      CircleWithText('4°'),
                      CircleWithText('5°', hasBorder: true),
                    ],
                  ),
                  RadarWidget(
                    skewing: 0,
                    radarMap: RadarMapModel(
                      legend: [
                        LegendModel('10/10', const Color(0XFF0EBD8D)),
                      ],
                      indicator: [
                        IndicatorModel("Gestión Productiva Primaria", 100),
                        IndicatorModel(
                            "Gestión de Diseño y Desarrollo de Productos", 100),
                        IndicatorModel("Gestión de Acabados Textiles", 100),
                        IndicatorModel("Gestión de la Comerzializacion", 100),
                        IndicatorModel("Gestión de Finanzas", 100),
                        IndicatorModel("Gestión de la Tributación", 100),
                        IndicatorModel("Educación", 100),
                        IndicatorModel("Transporte", 100),
                        IndicatorModel("Telecomunicaciones", 100),
                        IndicatorModel("Salud", 100),
                        IndicatorModel("Agua y Saneamiento", 100),
                        IndicatorModel("Gestión Ambiental", 100),
                        IndicatorModel("Tecnologiía  e Innovación", 100),
                        IndicatorModel("Gestión Organizacional", 100),
                      ],
                      data: [
                        //   MapDataModel([48,32.04,1.00,94.5,19,60,50,30,19,60,50]),
                        //   MapDataModel([42.59,34.04,1.10,68,99,30,19,60,50,19,30]),
                        MapDataModel([
                          100,
                          90,
                          90,
                          90,
                          10,
                          20,
                          100,
                          90,
                          90,
                          90,
                          90,
                          20,
                          80,
                          20
                        ]),
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
                  Table(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(166, 134, 13, 108),
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
}

class DonaConValorCentral extends StatelessWidget {
  final List<_ChartData> data = [
    _ChartData('Gold', 12, const Color.fromRGBO(71, 5, 116, 1)),
    _ChartData('Gold', 100, Colors.grey),
    //_ChartData('Gold', 100),
  ];

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
  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<Table> {
  List<List<String>> tableData = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 15; i++) {
      tableData.add([
        'Fila ${i + 1}, Celda 1',
        'Fila ${i + 1}, Celda 2',
        'Fila ${i + 1}, Celda 3',
        'Fila ${i + 1}, Celda 4',
      ]);
    }
    tableData[0][0] = "Gestión Productiva Primaria";
    tableData[1][0] ="Gestión de Diseño y Desarrollo de Productos";
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
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
