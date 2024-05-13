import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ict/model/indice.dart';
import 'package:ict/newForm.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Formulario extends StatefulWidget {
  final String id;
  final String name;
  const Formulario({super.key, required this.id, required this.name});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  String _selectedOrganization = "";
  final supabase = Supabase.instance.client;
  //String _selectedActivity = "";
  List<String> _Activities = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(166, 134, 13, 108),
        automaticallyImplyLeading: false,
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
              buildCheckboxListTile('Criador de Alpacas'),
              buildCheckboxListTile('Productor de Hilos Fibra de Alpaca'),
              buildCheckboxListTile(
                  'Artesano / Productor de productos textiles'),
              buildCheckboxListTile('Diseñador Textil'),
              buildCheckboxListTile('Comercializador de Productos Textiles'),
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<Category> selectedCategories = [];
          for (Category category in categories_data) {
            if (category.name == _selectedOrganization) {
              selectedCategories.add(category);
              print('nombre de la categoria seleccionada: ${category.name}');
            }
            for (String activity in _Activities) {
              print('nombres: ${activity} ${category.name}');
              if (category.name == activity) {
                selectedCategories.add(category);
              }
            }
          }

          /*await supabase.from('Respuestas').insert({
            'dimension': 'dimension 1',
            'variable': 'dimension 1',
            'category': 'dimension 1',
            'question': 'dimension 1',
            'response': 'dimension 1',
            'score': 4,
          });*/
          print('organizacion: $_selectedOrganization');
          print('actividades $_Activities');

          Queue<Category> queue = Queue.from(selectedCategories);
          for (Category category in categories_data) {
            if (category.name == 'Gestión de Acabados Textiles' ||
                category.name == 'Gestión de la Comercialización' ||
                category.name == 'Gestión de Finanzas' ||
                category.name == 'Gestión de la Tributación' ||
                category.name == 'Educación' ||
                category.name == 'Transporte' ||
                category.name == 'Telecomunicaciones' ||
                category.name == 'Salud' ||
                category.name == 'Agua y Saneamiento' ||
                category.name == 'Tecnologia e Innovación' ||
                (_selectedOrganization == 'Emprendedor' &&
                    category.name == 'G. Ambiental Emprendedor') ||
                ((_selectedOrganization == 'Asociación' ||
                        _selectedOrganization == 'Cooperativa') &&
                    category.name == 'G. Ambiental Asociacion/Cooperativa') ||
                (_selectedOrganization == 'Empresa ' &&
                    category.name == 'G. Ambiental Empresa')) {
              queue.addLast(category);
            }
          }
          print('longitud de la cola antes de pasar a next: ${queue.length}');

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NextForm(categories: queue, id: widget.id, name: widget.name),
            ),
          );
          print('Actividad seleccionada: $_selectedOrganization');
        },
        child: Icon(Icons.navigate_next),
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
