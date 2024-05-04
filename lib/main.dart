import 'package:flutter/material.dart';
import 'package:ict/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ICT',
      
      theme: ThemeData(
        textTheme: TextTheme(
      bodyText1: TextStyle(fontFamily: 'Poppins'), // Aplica Poppins a todos los textos
      // Agrega más estilos de texto aquí si es necesario
    ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 14, 2, 43)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Indice de Competitividad Textil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.gre,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/CITEtex-Cusco.png',
                  width: 200,
                  height: 80,
                ),
              ),
              
              Image.asset(
                'assets/images/indicator.png',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Registro()),
              );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 12, 145, 56),
                  elevation: 3,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: const Text(
                  'Iniciar Evaluación',
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
