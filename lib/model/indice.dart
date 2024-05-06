class Option {
  final String text;
  final int score;

  Option(this.text, this.score);
}

class Question {
  final String text;
  final List<Option> options;
  final bool isMultipleChoice;
  Question(this.text, this.options, this.isMultipleChoice);
}

class Category {
  final String name;
  final String dimension;
  final String variable;
  final List<Question> questions;

  Category(this.name, this.dimension, this.variable, this.questions);
}

class Variable {
  final String name;
  final List<Category> categories;

  Variable(this.name, this.categories);
}

class Indice {
  final String dimension;
  final String variable;
  final List<String> pregunta;
  final List<String> opcionesRespuesta;
  final int puntaje;

  Indice({
    required this.dimension,
    required this.variable,
    required this.pregunta,
    required this.opcionesRespuesta,
    required this.puntaje,
  });
}

List<Category> categories = [
  Category(
    'Asociación',
    'Dimension Interna',
    'Gestión Organizacional',
    [
      Question(
        '¿La Asociación se encuentra inscrito en Registros Públicos (SUNARP)?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        false,
      ),
      Question(
        '¿La asociación cuánto tiempo lleva inscrito en Registros Públicos (SUNARP)?',
        [
          Option('1 - 6 meses', 1),
          Option('7 - 12 meses', 3),
          Option('1 - 5 años', 6),
          Option('6 - 10 años', 9),
          Option('Desconozco', 0),
        ],
        false,
      ),
    ],
  ),
  Category(
    'Categoria 2',
    [
      Question('Pregunta 3', [
        Option('Opción X', 5),
        Option('Opción Y', 3),
        Option('Opción Z', 2),
      ]),
      Question('Pregunta 4', [
        Option('Opción P', 4),
        Option('Opción Q', 2),
      ]),
    ],
  ),
];
