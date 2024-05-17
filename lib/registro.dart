import 'package:flutter/material.dart';
import 'package:ict/formulario.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _provinciaController = TextEditingController();
  final TextEditingController _distritoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 122, 51, 129),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Center(
            child: Text(
              "Registro de Datos",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Datos de Contacto',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormCustom(
                    label: 'Nombre(Nombres y Apellidos)/Razon Social',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Por favor, ingrese este campo';
                      }
                      return null;
                    },
                    controller: _nombreController,
                  ),
                  TextFormCustom(
                    label: 'DNI/RUC',
                    keyboard: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Por favor, ingrese este campo';
                      }
                      if (value.length < 8) {
                        return 'Debe tener al menos 8 dígitos';
                      }
                      return null;
                    },
                    controller: _dniController,
                  ),
                  TextFormCustom(
                    label: 'Celular',
                    keyboard: TextInputType.phone,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Por favor, ingrese este campo';
                      }
                      if (value.length < 9) {
                        return 'Debe tener al menos 9 dígitos';
                      }
                      return null;
                    },
                    controller: _celularController,
                  ),
                  TextFormCustom(
                    label: 'Correo Electrónico',
                    keyboard: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Por favor, ingrese este campo';
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return 'Ingrese un correo electrónico válido';
                      }
                      return null;
                    },
                    controller: _emailController,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Datos de Ubicación',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormCustom(
                    label: 'Región',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Por favor, ingrese este campo';
                      }
                      return null;
                    },
                    controller: _regionController,
                  ),
                  TextFormCustom(
                    label: 'Provincia',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Por favor, ingrese este campo';
                      }
                      return null;
                    },
                    controller: _provinciaController,
                  ),
                  TextFormCustom(
                    label: 'Distrito',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Por favor, ingrese este campo';
                      }
                      return null;
                    },
                    controller: _distritoController,
                  ),
                  TextFormCustom(
                    label: 'Dirección',
                    keyboard: TextInputType.streetAddress,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Por favor, ingrese este campo';
                      }
                      return null;
                    },
                    controller: _direccionController,
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final client = Supabase.instance.client;
                          await client.from('User').insert([
                            {
                              'name': _nombreController.text,
                              'cellphone': _celularController.text,
                              'email': _emailController.text,
                              'region': _regionController.text,
                              'province': _provinciaController.text,
                              'district': _distritoController.text,
                              'address': _direccionController.text,
                              'numDocument': _dniController.text,
                            },
                          ]);
                          final data = await client
                              .from('User')
                              .select()
                              .eq('numDocument', _dniController.text);
                          print(data);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Formulario(
                                  id: data[0]['id'], name: data[0]['name']),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 122, 51, 129),
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
        ),
      ),
    );
  }
}

class TextFormCustom extends StatelessWidget {
  final String label;
  final TextInputType? keyboard;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;

  const TextFormCustom({
    Key? key,
    required this.label,
    this.keyboard,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
