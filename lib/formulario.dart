import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ict/model/indice.dart';
import 'package:ict/model/newForm.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  String _selectedOrganization = "";
  //String _selectedActivity = "";
  List<String> _Activities = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(166, 134, 13, 108),
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
                color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '¿Cuál es la actividad a la que se dedica?',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 10.0),
              buildCheckboxListTile('Criador de alpacas'),
              buildCheckboxListTile('Productor de hilos fibra de alpaca'),
              buildCheckboxListTile(
                  'Artesano / Productor de productos textiles'),
              buildCheckboxListTile('Diseñador textil'),
              buildCheckboxListTile('Comercializador de productos textiles'),
              const SizedBox(height: 20.0),
              const Text(
                '¿A qué tipo de organización pertenece?',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 10.0),
              Column(
                children: [
                  buildRadioListTile('Emprendedor'),
                  buildRadioListTile('Asociación'),
                  buildRadioListTile('Cooperativa'),
                  buildRadioListTile('Empresa'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  List<Category> selectedCategories = [];
                  for (Category category in categories_data) {
                    if (category.name == _selectedOrganization) {
                      selectedCategories.add(category);
                      print(
                          'nombre de la categoria seleccionada: ${category.name}');
                    }
                    for (String activity in _Activities) {
                      if (category.name == activity) {
                        selectedCategories.add(category);
                      }
                    }
                  }
                  print('organizacion: $_selectedOrganization');
                  print('actividades $_Activities');

                  Queue<Category> queue = Queue.from(selectedCategories);
                  print(
                      'longitud de la cola antes de pasar a next: ${queue.length}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextForm(categories: queue),
                    ),
                  );
                  print('Actividad seleccionada: $_selectedOrganization');
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioListTile(String title) {
    return RadioListTile(
      title: Text(title),
      value: title,
      groupValue: _selectedOrganization,
      onChanged: (value) {
        setState(() {
          _selectedOrganization = value!;
        });
      },
    );
  }

  Widget buildCheckboxListTile(String title) {
    final bool isChecked = _Activities.contains(title);
    return CheckboxListTile(
      controlAffinity:
          ListTileControlAffinity.leading, // Mueve el checkbox al principio
      title: Text(title),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          if (value!) {
            _Activities.add(title);
          } else {
            _Activities.remove(title);
          }
        });
      },
    );
  }
}
