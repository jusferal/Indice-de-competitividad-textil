import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:ict/registro.dart';

class RoadMap extends StatelessWidget {
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
                CustomPaint(
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
