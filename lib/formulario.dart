import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  String _selectedActivity = "";
  //String _selectedActivity = "";
  List<String> _selectedTypes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¿Cuál es la actividad a la que se dedica?',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            buildCheckboxListTile('Criador de alpacas'),
            buildCheckboxListTile('Productor de hilos fibra de alpaca'),
            buildCheckboxListTile('Artesano / Productor de productos textiles'),
            buildCheckboxListTile('Diseñador textil'),
            buildCheckboxListTile('Comercializador de productos textiles'),
            SizedBox(height: 20.0),
            Text(
              '¿A qué tipo de organización pertenece?',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
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
                // Aquí puedes hacer lo que quieras con la opción seleccionada
                print('Actividad seleccionada: $_selectedActivity');
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioListTile(String title) {
    return RadioListTile(
      title: Text(title),
      value: title,
      groupValue: _selectedActivity,
      onChanged: (value) {
        setState(() {
          _selectedActivity = value!;
        });
      },
    );
  }

  Widget buildCheckboxListTile(String title) {
    final bool isChecked = _selectedTypes.contains(title);
    return CheckboxListTile(
      controlAffinity:
          ListTileControlAffinity.leading, // Mueve el checkbox al principio
      title: Text(title),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          if (value!) {
            _selectedTypes.add(title);
          } else {
            _selectedTypes.remove(title);
          }
        });
      },
    );
  }
}
