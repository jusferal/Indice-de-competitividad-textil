class Option {
  final String text;
  final int score;

  Option(this.text, this.score);
}

class Question {
  final String text;
  final List<Option> options;
  final int typeWidget;
  bool isVisible;
  Question(this.text, this.options, this.typeWidget, this.isVisible);
}

class Category {
  final String name;
  final String dimension;
  final String variable;
  final List<Question> questions;

  Category(this.name, this.dimension, this.variable, this.questions);
}


List<Category> categories_data = [
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
        0,
        true,
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
        0,
        false,
      ),
      Question(
        '¿La asociación cuenta con el Registro Único del Contribuyente (RUC)?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        '¿Cuál es la situación actual del RUC de la asociación?',
        [
          Option('Activo y Habido', 1),
          Option('Suspendido y Habido', 3),
        ],
        0,
        false,
      ),
      Question(
        '¿La asociación cuenta con Estatuto actualizado?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        '¿La junta directiva de la asociación se encuentra activa y registrada en SUNARP?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        '¿A parte de la junta directiva ¿La asociación cuenta con un organigrama (área de finanzas, ventas, marketing, producción y otros)?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        '¿Conoce cuál es el CIIU de la Asociación?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        '¿Cuál es el CIIU principal de la Asociación?',
        [
          Option('', 3),
        ],
        2,
        false,
      ),
      Question(
        '¿Cuál es el Régimen tributario al que pertenece?',
        [
          Option('Nuevo Régime Único Simplificado (NRUS)', 1),
          Option('Régimen Especial de Impuesto a la Renta (RER)', 3),
          Option('Régimen MYPE Tributario (RMT)', 6),
          Option('Régimen General', 9),
          Option('Ninguno', 0),
        ],
        0,
        true,
      ),
    ],
  ),
  Category(
    'Cooperativa',
    'Dimension Interna',
    'Gestión Organizacional',
    [
      Question(
        '¿Cuenta con escritura pública?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        '¿Qué información se encuentra en su estatuto?',
        [
          Option('Denominación de la sociedad', 3),
          Option('Objeto social', 3),
          Option('Domicilio fiscal', 3),
          Option('Duración y ámbito de actuación', 3),
          Option('Capital mínimo aportado ', 3),
          Option('Todas las anteriores', 9),
        ],
        1,
        true,
      ),
      Question(
        'Respecto a la estructura interna, cuenta con',
        [
          Option('Asamblea general', 3),
          Option('Consejo Rector', 3),
          Option('Intervención ', 3),
          Option('Comité de Recursos', 3),
          Option('Todas las anteriores', 9),
        ],
        1,
        true,
      ),
      Question(
        '¿Cuenta con un organigrama de gestión?',
        [
          Option('Si', 3),
          Option('No', 0),
        ],
        0,
        true,
      ),
    ],
  ),
  Category(
    'Empresa',
    'Dimension Interna',
    'Gestión Organizacional',
    [
      Question(
        '¿Cuál es el Régimen tributario al que pertenece?',
        [
          Option('Nuevo Régimen Único Simplificado (NRUS)', 1),
          Option('Régimen Especial de Impuesto a la Renta (RER)', 3),
          Option('Régimen MYPE Tributario (RMT)', 6),
          Option('Régimen General', 9),
        ],
        0,true,
      ),
      Question(
        '¿Cuál es el número de trabajadores con el que cuenta?',
        [
          Option('1 - 10 trabajadores', 1),
          Option('11 - 50 trabajadores', 3),
          Option('51 - 250 trabajadores', 6),
          Option('Más de 250 trabajadores', 9),
        ],
        0,true,
      ),
      Question(
        '¿Cuenta con un organigrama de gestión?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,true,
      ),
      Question(
        '¿A qué régimen societario pertenece su empresa?',
        [
          Option('Empresa Individual de Responsabilidad Limitada (E.I.R.L)', 0),
          Option('Sociedad Anónima Abierta (S.A.A)', 0),
          Option('Sociedad Anónima Cerrada (S.A.C)', 0),
          Option('Sociedad Anónima (S.A)', 0),
        ],
        0,false,
      ),
    ],
  ),
  Category(
    'Emprendedor',
    'Dimension Interna',
    'Gestión Organizacional',
    [
      Question(
        '¿Cuenta con el Registro Único del Contribuyente (RUC)?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        'Tipo de Régimen Único del contribuyente (RUC) que posee',
        [
          Option('Persona natural con negocio', 3),
          Option('Persona natural sin negocio', 1),
        ],
        0,
        false,
      ),
      Question(
        '¿Alguna vez realizó el Análisis FODA de su organización?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        '¿Su organización cuenta con un propósito (Misión)?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        'Si la respuesta es "Sí". Mencione su Misión',
        [
          Option('-', 3),
        ],
        2,
        false,
      ),
      Question(
        '¿Su organización cuenta con una proyección a futuro (Visión)?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        'Si la respuesta es "Sí". Mencione su Visión',
        [
          Option('-', 3),
        ],
        2,
        false,
      ),
      Question(
        '¿La organización cuenta con valores clave?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        'Si la respuesta es "Sí". Mencione sus valores clave',
        [
          Option('-', 3),
        ],
        2,
        false,
      ),
      Question(
        '¿La organización cuenta con objetivos estratégicos?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
      ),
      Question(
        'Si la respuesta es "Sí". Mencione sus objetivos estratégicos',
        [
          Option('-', 3),
        ],
        2,
        false,
      ),
    ],
  ),
];
