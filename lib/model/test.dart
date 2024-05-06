class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  int _selectedCategoryIndex = 0; // Índice de la categoría seleccionada

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seleccione una categoría:',
          style: TextStyle(fontSize: 18.0),
        ),
        DropdownButton<int>(
          value: _selectedCategoryIndex,
          items: List.generate(
            categories.length,
            (index) => DropdownMenuItem<int>(
              value: index,
              child: Text(categories[index].name),
            ),
          ),
          onChanged: (index) {
            setState(() {
              _selectedCategoryIndex = index;
            });
          },
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Obtener preguntas de la categoría seleccionada
            List<Question> selectedCategoryQuestions =
                categories[_selectedCategoryIndex].questions;

            // Aquí puedes navegar a la siguiente pantalla pasando las preguntas
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    NextForm(questions: selectedCategoryQuestions),
              ),
            );
          },
          child: Text('Siguiente'),
        ),
      ],
    );
  }
}

class NextForm extends StatelessWidget {
  final List<Question> questions;

  NextForm({required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Preguntas'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index].text),
            subtitle: questions[index].isMultipleChoice
                ? Text('Seleccione una o más opciones')
                : Text('Seleccione una opción'),
            // Aquí puedes mostrar las opciones de selección según sea necesario
          );
        },
      ),
    );
  }
}
