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
        backgroundColor: const Color.fromARGB(255, 122, 51, 129),
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
          Map<String, Category> categoriesMap = getCategories();
          if (categoriesMap.containsKey(_selectedOrganization)) {
            selectedCategories.add(categoriesMap[_selectedOrganization]!);
          }
          for (String activity in _Activities) {
            if (categoriesMap.containsKey(activity)) {
              selectedCategories.add(categoriesMap[activity]!);
            }
          }
          /*for (Category category in categories_data) {
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
          }*/

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

          List<String> values = [
            'Gestión de Acabados Textiles',
            'Gestión de la Comercialización',
            'Gestión de Finanzas',
            'Gestión de la Tributación',
            'Educación',
            'Transporte',
            'Telecomunicaciones',
            'Salud',
            'Agua y Saneamiento',
            'Tecnologia e Innovación',
          ];
          for (var val in values) {
            if (categoriesMap.containsKey(val)) {
              selectedCategories.add(categoriesMap[val]!);
            }
          }
          if (_selectedOrganization == 'Emprendedor' &&
              categoriesMap.containsKey('G. Ambiental Emprendedor')) {
            selectedCategories.add(categoriesMap['G. Ambiental Emprendedor']!);
          }
          if ((_selectedOrganization == 'Asociación' ||
                  _selectedOrganization == 'Cooperativa') &&
              categoriesMap
                  .containsKey('G. Ambiental Asociacion/Cooperativa')) {
            selectedCategories
                .add(categoriesMap['G. Ambiental Asociacion/Cooperativa']!);
          }
          if (_selectedOrganization == 'Empresa ' &&
              categoriesMap.containsKey('G. Ambiental Empresa')) {
            selectedCategories.add(categoriesMap['G. Ambiental Empresa']!);
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NextForm(
                categories: selectedCategories,
                id: widget.id,
                name: widget.name,
                code: 0,
                globalAnswers: {},
                indexCategories: 0,
                used: {},
              ),
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
