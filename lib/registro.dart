import 'package:flutter/material.dart';
import 'package:ict/formulario.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(166, 134, 13, 108),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text(
            "Registro de Datos",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Datos de Contacto',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormCustom(label: 'Nombre/Razon Social'),
                    TextFormCustom(label: 'DNI/RUC'),
                    TextFormCustom(
                        label: 'Celular', keyboard: TextInputType.phone),
                    TextFormCustom(
                      label: 'Correo Electrónico',
                      keyboard: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Datos de Ubicación',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormCustom(label: 'Región'),
                    TextFormCustom(label: 'Provincia'),
                    TextFormCustom(label: 'Distrito'),
                    TextFormCustom(
                      label: 'Dirección',
                      keyboard: TextInputType.streetAddress,
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 100),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Formulario()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(166, 134, 13, 108),
                          elevation: 3,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                        child: const Text(
                          'Iniciar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class TextFormCustom extends StatelessWidget {
  String label;
  TextInputType? keyboard = TextInputType.text;
  TextFormCustom({super.key, required this.label, this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
