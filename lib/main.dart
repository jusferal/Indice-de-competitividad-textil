import 'package:flutter/material.dart';
import 'package:ict/registro.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ebyieyonfghqlwrrbtqh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVieWlleW9uZmdocWx3cnJidHFoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUwOTc3NzIsImV4cCI6MjAzMDY3Mzc3Mn0.znNSlSFgAUrFxDcr_CSu_d4zfIW8KSKFvpjt011XcAA',
  );
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
        //textTheme: TextTheme(
        //bodyText1: TextStyle(fontFamily: 'Poppins'), // Aplica Poppins a todos los textos
        // Agrega más estilos de texto aquí si es necesario
        //  ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 67, 2, 80)),
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
        backgroundColor: Color.fromARGB(255, 136, 133, 133),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(166, 134, 13, 108),
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
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
              /*Image.asset(
                'assets/images/indicator.png',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),*/
              Container(
                padding: EdgeInsets.only(top: 50, bottom: 20),
                width: 200,
                child: Text(
                  "Aplicativo de Indice de Competitividad Textil",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
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
                  backgroundColor: Color.fromARGB(166, 134, 13, 108),
                  elevation: 3,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
                child: const Text(
                  'Iniciar Evaluación',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
