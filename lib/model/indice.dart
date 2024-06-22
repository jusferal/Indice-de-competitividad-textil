class Option {
  final String text;
  final int score;
  final String typeOption;
  Option(this.text, this.score, this.typeOption);
}

class Question {
  static int _idCounter = 0;
  final int id;
  final String text;
  final List<Option> options;
  final String typeWidget;
  bool isVisible;
  final String behavior;
  final int totalScore;
  Question(
      {required this.text,
      required this.options,
      required this.typeWidget,
      required this.isVisible,
      required this.behavior,
      required this.totalScore})
      : id = _idCounter++;
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
          text:
              '¿La Asociación se encuentra inscrito en Registros| Públicos (SUNARP)?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿La asociación cuánto tiempo lleva inscrito en Registros Públicos (SUNARP)?',
          options: [
            Option('1 - 6 meses', 1, 'normal'),
            Option('7 - 12 meses', 2, 'normal'),
            Option('1 - 5 años', 3, 'normal'),
            Option('6 - 10 años', 4, 'normal'),
            Option('Desconozco', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 4),
      Question(
          text:
              '¿La asociación cuenta con el Registro Único del Contribuyente (RUC)?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Cuál es la situación actual del RUC de la asociación?',
          options: [
            Option('Activo y Habido', 1, 'normal'),
            Option('Suspendido y Habido', 2, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 2),
      Question(
          text: '¿La asociación cuenta con Estatuto actualizado?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿La junta directiva de la asociación se encuentra activa y registrada en SUNARP?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿A parte de la junta directiva ¿La asociación cuenta con un organigrama (área de finanzas, ventas, marketing, producción y otros)?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Conoce cuál es el CIIU de la Asociación?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Cuál es el CIIU principal de la Asociación?',
          options: [
            Option('', 1, 'edit'),
          ],
          typeWidget: 'edit',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿Cuál es el Régimen tributario al que pertenece?',
          options: [
            Option('Nuevo Régime Único Simplificado (NRUS)', 1, 'normal'),
            Option(
                'Régimen Especial de Impuesto a la Renta (RER)', 2, 'normal'),
            Option('Régimen MYPE Tributario (RMT)', 3, 'normal'),
            Option('Régimen General', 4, 'normal'),
            Option('Ninguna de las anteriores', 0, 'ninguno'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 4),
    ],
  ),
  Category(
    'Cooperativa',
    'Dimension Interna',
    'Gestión Organizacional',
    [
      Question(
          text: '¿Cuenta con escritura pública?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Qué información se encuentra en su estatuto?',
          options: [
            Option('Denominación de la sociedad', 1, 'normal'),
            Option('Objeto social', 1, 'normal'),
            Option('Domicilio fiscal', 1, 'normal'),
            Option('Duración y ámbito de actuación', 1, 'normal'),
            Option('Capital mínimo aportado ', 1, 'normal'),
            Option('Todas las anteriores', 3, 'todas'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: 'Respecto a la estructura interna, cuenta con',
          options: [
            Option('Asamblea general', 1, 'normal'),
            Option('Consejo Rector', 1, 'normal'),
            Option('Intervención ', 1, 'normal'),
            Option('Comité de Recursos', 1, 'normal'),
            Option('Todas las anteriores', 3, 'todas'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Cuenta con un organigrama de gestión?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
    ],
  ),
  Category(
    'Empresa',
    'Dimension Interna',
    'Gestión Organizacional',
    [
      Question(
          text: '¿Cuál es el Régimen tributario al que pertenece?',
          options: [
            Option('Nuevo Régimen Único Simplificado (NRUS)', 1, 'normal'),
            Option(
                'Régimen Especial de Impuesto a la Renta (RER)', 3, 'normal'),
            Option('Régimen MYPE Tributario (RMT)', 6, 'normal'),
            Option('Régimen General', 9, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 9),
      Question(
          text: '¿Cuál es el número de trabajadores con el que cuenta?',
          options: [
            Option('1 - 10 trabajadores', 1, 'normal'),
            Option('11 - 50 trabajadores', 3, 'normal'),
            Option('51 - 250 trabajadores', 6, 'normal'),
            Option('Más de 250 trabajadores', 9, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 9),
      Question(
          text: '¿Cuenta con un organigrama de gestión?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿A qué régimen societario pertenece su empresa?',
          options: [
            Option('Empresa Individual de Responsabilidad Limitada (E.I.R.L)',
                0, 'normal'),
            Option('Sociedad Anónima Abierta (S.A.A)', 0, 'normal'),
            Option('Sociedad Anónima Cerrada (S.A.C)', 0, 'normal'),
            Option('Sociedad Anónima (S.A)', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 0),
    ],
  ),
  Category(
    'Emprendedor',
    'Dimension Interna',
    'Gestión Organizacional',
    [
      Question(
          text: '¿Cuenta con el Registro Único del Contribuyente (RUC)?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: 'Tipo de Régimen Único del contribuyente (RUC) que posee',
          options: [
            Option('Persona natural con negocio', 3, 'normal'),
            Option('Persona natural sin negocio', 1, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text: '¿Alguna vez realizó el Análisis FODA de su organización?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Su organización cuenta con un propósito (Misión)?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: 'Si la respuesta es "Sí". Mencione su Misión',
          options: [
            Option('-', 1, 'edit'),
          ],
          typeWidget: 'edit',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿Su organización cuenta con una proyección a futuro (Visión)?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: 'Si la respuesta es "Sí". Mencione su Visión',
          options: [
            Option('-', 1, 'edit'),
          ],
          typeWidget: 'edit',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿La organización cuenta con valores clave?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: 'Si la respuesta es "Sí". Mencione sus valores clave',
          options: [
            Option('-', 1, 'edit'),
          ],
          typeWidget: 'edit',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿La organización cuenta con objetivos estratégicos?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: 'Si la respuesta es "Sí". Mencione sus objetivos estratégicos',
          options: [
            Option('-', 1, 'edit'),
          ],
          typeWidget: 'edit',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
    ],
  ),
  Category(
    'Criador de Alpacas',
    'Dimension Interna',
    'Gestión Productiva Primaria',
    [
      Question(
          text: '¿Qué raza de alpaca posee?',
          options: [
            Option('Suri', 1, 'normal'),
            Option('Huacaya', 1, 'normal'),
            Option('Suri y Huacaya', 3, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Cuál es la cantidad de alpacas que posee?',
          options: [
            Option('1 - 50 alpacas (Pequeño criador)', 1, 'normal'),
            Option('51 - 150 alpacas (Mediano)', 3, 'normal'),
            Option('Más de 150 (Grande)', 6, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 6),
      Question(
          text: '¿Qué tipo de esquila realiza?',
          options: [
            Option('Manual', 1, 'normal'),
            Option('Mecánica', 1, 'normal'),
            Option('Manual y mecánica', 3, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Qué tipo de herramienta utiliza para realizar la esquila de la alpaca?',
          options: [
            Option('Cuchillo', 1, 'normal'),
            Option('Tijera', 3, 'normal'),
            Option('Esquiladora mecánica', 9, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 9),
      Question(
          text: '¿Cuántas veces al año realiza la esquila de la alpaca?',
          options: [
            Option('1 vez al año', 1, 'normal'),
            Option('2 veces al año', 3, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Realiza la esquila aplicando las normas tecnicas peruanas de buenas practicas de esquila?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Realiza la venta de fibra de alpaca?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿De qué manera realiza la venta de la fibra de alpaca?',
          options: [
            Option('Fibra en brosa', 1, 'normal'),
            Option('Fibra categorizada', 3, 'normal'),
            Option('Fibra clasificada', 6, 'normal'),
            Option('Todas las anteriores', 9, 'todas'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'launcher',
          totalScore: 9),
    ],
  ),
  Category(
    'Fibra en brosa',
    'Dimension Interna',
    'Gestión Productiva Primaria',
    [
      Question(
          text: '¿Qué cantidad de fibra en brosa vende?',
          options: [
            Option('1 - 30 libras', 1, 'normal'),
            Option('31 - 60 libras', 3, 'normal'),
            Option('Más de 60 libras', 6, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 6),
      Question(
          text: '¿Cuál es el precio de venta de la fibra en brosa?',
          options: [
            Option('S/ 5 - S/ 10', 1, 'normal'),
            Option('S/ 11 - S/ 15', 3, 'normal'),
            Option('S/ 16 - S/ 20', 6, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 6),
      Question(
          text: '¿A quién vende la fibra en brosa?',
          options: [
            Option('Acopiador minorista (compadre)', 1, 'normal'),
            Option('Acopiador mayorista', 1, 'normal'),
            Option('En ferias', 3, 'normal'),
            Option('A una empresa', 3, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 6),
    ],
  ),
  Category(
    'Fibra categorizada',
    'Dimension Interna',
    'Gestión Productiva Primaria',
    [
      Question(
          text: '¿Conoce la categorizacion de fibra de alpaca?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Aplica la norma técnica peruana de categorización de fibra de alpaca?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿Qué cantidad de fibra categorizada vende?',
          options: [
            Option('1 - 30 libras', 1, 'normal'),
            Option('31 - 60 libras', 3, 'normal'),
            Option('Más de 60 libras', 6, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 6),
      Question(
          text: '¿Cuál es el precio de venta de la fibra en brosa?',
          options: [
            Option('S/ 5 - S/ 10', 1, 'normal'),
            Option('S/ 11 - S/ 15', 3, 'normal'),
            Option('S/ 16 - S/ 20', 6, 'normal'),
            Option('Más de S/ 20', 9, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 9),
      Question(
          text: '¿A quién vende la fibra categorizada?',
          options: [
            Option('Acopiador minorista', 1, 'normal'),
            Option('Acopiador mayorista', 3, 'normal'),
            Option('En ferias', 6, 'normal'),
            Option('A una empresa', 9, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 6),
    ],
  ),
  Category(
    'Artesano / Productor de productos textiles',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          text: '¿Que tipo de artesanías elabora?',
          options: [
            Option('Prendas Tejidas a Punto', 0, 'normal'),
            Option('Peletería', 0, 'normal'),
            Option('Tejido Plano en Telar', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'launcher',
          totalScore: 0),
    ],
  ),
  Category(
    'Prendas Tejidas a Punto',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          text:
              '¿Cuántos años lleva usted o su organización en el rubro de la artesanía textil?',
          options: [
            Option('Menos de 1 año', 1, 'normal'),
            Option('1 - 3 años', 2, 'normal'),
            Option('3 - 5 años', 3, 'normal'),
            Option('Más de 5 años', 4, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 4),
      Question(
          text: '¿Qué tipo de productos artesanales produce?',
          options: [
            Option('Prendas', 1, 'normal'),
            Option('Accesorios', 1, 'normal'),
            Option('DecoHome', 1, 'normal'),
            Option('Todas las anteriores', 3, 'todas'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'launcher',
          totalScore: 3),
    ],
  ),
  Category(
    'Prendas',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          text: '¿Qué tipo de prendas elabora?',
          options: [
            Option('Chompas', 1, 'normal'),
            Option('Ponchos', 1, 'normal'),
            Option('Gorras', 1, 'normal'),
            Option('Chalinas', 1, 'normal'),
            Option('Todas las anteriores', 3, 'todas'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
    ],
  ),
  Category(
    'Accesorios',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          text: '¿Qué tipo de accesorios elabora?',
          options: [
            Option('Vinchas', 1, 'normal'),
            Option('Guantes', 1, 'normal'),
            Option('Mitones', 1, 'normal'),
            Option('Todas las anteriores', 3, 'todas'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
    ],
  ),
  Category(
    'DecoHome',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          text: '¿Qué tipo de productos de DecoHome elabora?',
          options: [
            Option('Cojines', 1, 'normal'),
            Option('Caminos de mesa', 1, 'normal'),
            Option('Adornos para el hogar', 1, 'normal'),
            Option('Tapetes', 1, 'normal'),
            Option('Otros (Especifique)', 1, 'otro'),
            Option('Todas las anteriores', 3, 'todas'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué técnica(s) de producción de tejido maneja?',
          options: [
            Option('Crochet', 1, 'normal'),
            Option('Palitos de tejer', 1, 'normal'),
            Option('Máquina de tejido rectilíneo', 2, 'normal'),
            Option(
                'Máquina de tejido rectilineo industrial (Shima)', 3, 'normal'),
            Option('4 Estacas', 1, 'normal'),
            Option('Telar', 1, 'normal'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
        text: '¿Con qué herramientas cuenta para el proceso de producción?',
        options: [
          Option('Palito y/o crochet', 1, 'normal'),
          Option('Máquina de tejer', 1, 'normal'),
          Option('Remalladora de plato', 2, 'normal'),
          Option('Moldes', 2, 'normal'),
          Option('Todas las anteriores', 3, 'todas'),
        ],
        typeWidget: 'multiple',
        isVisible: true,
        behavior: 'normal',
        totalScore: 3,
      ),
      Question(
        text:
            '¿Realiza el uso de la tabla de medidas para el desarrollo de sus productos textiles?',
        options: [
          Option('Si', 1, 'normal'),
          Option('No', 0, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 1,
      ),
      Question(
        text:
            '¿Realiza el uso de la ficha técnica para el desarrollo de sus productos textiles?',
        options: [
          Option('Si', 1, 'normal'),
          Option('No', 0, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 1,
      ),
      Question(
        text:
            '¿Cuál es el nivel de conocimiento que tiene de la ficha tecnica para elaborar sus productos textiles?',
        options: [
          Option('Solo interpreta la ficha técnica', 1, 'normal'),
          Option('Interpreta y elabora una ficha técnica', 2, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 2,
      ),
      Question(
        text:
            '¿Realiza el patronaje para el desarrollo de sus productos textiles?',
        options: [
          Option('Si', 1, 'normal'),
          Option('No', 0, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 1,
      ),
      Question(
        text:
            '¿Posee un registro o un archivo de las fichas tecnicas de sus productos textiles desarrollados?',
        options: [
          Option('Si', 1, 'normal'),
          Option('No', 0, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 1,
      ),
      Question(
        text:
            '¿A qué estilo de diseño pertenece los productos textiles que desarrolla?',
        options: [
          Option('Autóctono / tradicional', 0, 'normal'),
          Option('Contemporáneo', 0, 'normal'),
          Option('Vanguardista', 0, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 0,
      ),
      Question(
        text: '¿De qué manera desarrolla el diseño de sus productos textiles?',
        options: [
          Option('Empírica influenciado por el entorno en el que vive', 1,
              'normal'),
          Option('Si recibio una capacitación', 2, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 2,
      ),
      Question(
        text:
            '¿Qué tipo de estudio utiliza para el desarrollo de sus productos textiles?',
        options: [
          Option('Estudio de mercado', 2, 'normal'),
          Option('Revision de fuentes de tendencia', 3, 'normal'),
          Option('Replica de otros productos de la zona', 1, 'normal'),
        ],
        typeWidget: 'multiple',
        isVisible: true,
        behavior: 'normal',
        totalScore: 3,
      ),
      Question(
        text:
            '¿Qué tan importante considera a la incorporación de Moda y nuevas tendencias en la elaboración de sus productos textiles?',
        options: [
          Option('1: Nada importante', 0, 'normal'),
          Option('2: Poco importante', 1, 'normal'),
          Option('3: Muy importante', 2, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 2,
      ),
      Question(
        text:
            '¿Qué procesos de acabado de las prendas textiles realiza a nivel producción?',
        options: [
          Option('Lavado del hilado antes del desarrollo el producto', 1,
              'normal'),
          Option('Desarrollo de una muestra antes de iniciar el tejido', 2,
              'normal'),
          Option('Vaporiza de las prendas al finalizar su elaboración', 2,
              'normal'),
          Option('Ocultado de hilados al finalizar el armado de su producto', 2,
              'normal'),
          Option('Todas las anteriores', 3, 'todas'),
        ],
        typeWidget: 'multiple',
        isVisible: true,
        behavior: 'normal',
        totalScore: 3,
      ),
      Question(
        text:
            '¿Qué Máquina de tejer Galga utiliza para elaborar su productos textiles?',
        options: [
          Option('Máquina de tejer Galga 3', 0, 'normal'),
          Option('Máquina de tejer Galga 6', 0, 'normal'),
          Option('Máquina de tejer Galga 8', 0, 'normal'),
          Option('Ninguna de las anteriores', 0, 'ninguno'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 0,
      ),
      Question(
        text: '¿Qué tipo de Maquina de tejer utiliza?',
        options: [
          Option('Silver', 0, 'normal'),
          Option('Brother', 0, 'normal'),
          Option('Otro (Especifique)', 0, 'otro'),
          Option('Ninguna de las anteriores', 0, 'ninguno'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 0,
      ),
      Question(
        text:
            '¿Cuál es el nivel de conocimiento que tiene de la operatividad de la máquina de tejer?',
        options: [
          Option('Básico', 1, 'normal'),
          Option('Intermedio', 2, 'normal'),
          Option('Avanzado', 3, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 3,
      ),
      Question(
        text: '¿Qué tipo de máquina remalladora utiliza?',
        options: [
          Option('Singer', 0, 'normal'),
          Option('Longxing', 0, 'normal'),
          Option('Otro (Especifique)', 0, 'otro'),
          Option('Ninguna de las anteriores', 0, 'ninguno'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 0,
      ),
      Question(
        text: '¿Realiza la interpretación de Fichas técnicas?',
        options: [
          Option('Si', 1, 'normal'),
          Option('No', 0, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 1,
      ),
      Question(
        text:
            '¿Con qué frecuencia realiza la interpretación de las fichas técnicas?',
        options: [
          Option('Siempre', 2, 'normal'),
          Option('A veces', 1, 'normal'),
          Option('Nunca', 0, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: false,
        behavior: 'hidden',
        totalScore: 2,
      ),
      Question(
        text: 'Utiliza la tabla de tallas y medidas',
        options: [
          Option('Si', 1, 'normal'),
          Option('No', 0, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 1,
      ),
      Question(
        text: 'Sobre la utilización de la tabla de tallas y medidas',
        options: [
          Option('Conozco pero no la utilizo', 0, 'normal'),
          Option('La utilice una vez', 1, 'normal'),
          Option('A veces la utilizo', 2, 'normal'),
          Option('Lo utilizo cuando tengo pedidos', 2, 'normal'),
          Option('Siempre la utilizo', 3, 'normal'),
        ],
        typeWidget: 'unique',
        isVisible: false,
        behavior: 'hidden',
        totalScore: 3,
      ),
      Question(
        text:
            'En la determinación de puntos y carreras. ¿Qué pasos desarrolla?',
        options: [
          Option('Muestra de tensión', 1, 'normal'),
          Option('Muestra de orientación', 1, 'normal'),
          Option('Fórmula de conversión', 1, 'normal'),
          Option('Desarrollo de hojas de trabajo', 1, 'normal'),
          Option('Todas las anteriores', 2, 'todas'),
          Option('Ninguna de las anteriores', 0, 'ninguno'),
        ],
        typeWidget: 'multiple',
        isVisible: true,
        behavior: 'normal',
        totalScore: 2,
      ),
      Question(
        text:
            '¿Qué técnicas de tejido utiliza para el desarrollo de sus productos textiles?',
        options: [
          Option('Jersey', 1, 'normal'),
          Option('Jarquard', 1, 'normal'),
          Option('Retenido', 1, 'normal'),
          Option('Deslizado', 1, 'normal'),
          Option('Calado', 1, 'normal'),
          Option('Intarsia', 1, 'normal'),
          Option('Ninguna de las anteriores', 0, 'ninguno'),
        ],
        typeWidget: 'multiple',
        isVisible: true,
        behavior: 'normal',
        totalScore: 3,
      ),
      Question(
        text: '¿Qué tipo(s) de control de calidad lleva a cabo?',
        options: [
          Option('Control de calidad en los materiales', 1, 'normal'),
          Option('Control de calidad en el proceso de tejido de las prendas', 1,
              'normal'),
          Option('Control de calidad al final de los acabados', 1, 'normal'),
        ],
        typeWidget: 'multiple',
        isVisible: true,
        behavior: 'normal',
        totalScore: 3,
      ),
      Question(
        text:
            'Qué tipo de acabado realiza para la unión de los paneles tejidos',
        options: [
          Option('Costura', 1, 'normal'),
          Option('Remallado', 1, 'normal'),
          Option('Costura y Remallado', 3, 'normal'),
          Option('Ninguna de las anteriores', 0, 'ninguno'),
        ],
        typeWidget: 'unique',
        isVisible: true,
        behavior: 'normal',
        totalScore: 3,
      ),
    ],
  ),
  Category(
    'Peletería',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          text:
              '¿Cuántos años de experiencia tiene en la técnica de peletería?',
          options: [
            Option('Menos de 1 año', 1, 'normal'),
            Option('Entre 1 y 3 años', 2, 'normal'),
            Option('Más de 3 años', 3, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Qué tipo de piel se utiliza comúnmente en la peletería de camélidos en Perú?',
          options: [
            Option('Alpaca', 1, 'normal'),
            Option('Ovino', 1, 'normal'),
            Option('Llama', 1, 'normal'),
            Option('Todas las anteriores', 2, 'todas'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Qué instrumento o maquina utiliza para eliminar los excesos de piel?',
          options: [
            Option('Cuchillo', 1, 'normal'),
            Option('Lata', 1, 'normal'),
            Option('Máquina', 2, 'normal'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿De qué manera realiza el proceso de conservado de la piel o cuero?',
          options: [
            Option('Con sal', 0, 'normal'),
            Option('Al secado', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text:
              '¿Qué productos desarrollan utilizando la técnica de peletería?',
          options: [
            Option('Chalinas y bufandas', 1, 'normal'),
            Option('Tapices y alfombras', 1, 'normal'),
            Option('Bolsos y carteras', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
    ],
  ),
  Category(
    'Tejido Plano en Telar',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          text: '¿Cuántos años de experiencia tiene trabajando con el telar?',
          options: [
            Option('Menos de 1 año', 1, 'normal'),
            Option('Entre 1 y 3 años', 2, 'normal'),
            Option('Más de 3 años', 3, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué tipo de telar utiliza?',
          options: [
            Option('Telar de cintura', 0, 'normal'),
            Option('Telar de pedal', 0, 'normal'),
            Option('Telar vertical', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text: '¿Conoce acerca del proceso torcido de hilos?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Aplica el proceso torcido de hilos para realizar los tejidos a telar?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿Cuál es el proceso inicial en la técnica de telar?',
          options: [
            Option('Diseño', 0, 'normal'),
            Option('Teñido', 0, 'normal'),
            Option('Selección de materiales', 0, 'normal'),
            Option('Armado del telar', 1, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Cómo se llama la herramienta utilizada para compactar y ajustar los hilos en el telar?',
          options: [
            Option('Peine', 1, 'normal'),
            Option('Heddle', 0, 'normal'),
            Option('Urdidor', 0, 'normal'),
            Option('Plegadera', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Qué es el proceso de urdido en el telar?',
          options: [
            Option('Teñido de los hilos', 0, 'normal'),
            Option('Preparación y colocación de los hilos en el telar', 1,
                'normal'),
            Option('Armado final del tejido', 0, 'normal'),
            Option('Ninguna de las anteriores', 0, 'ninguno'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
    ],
  ),
  Category(
    'Gestión de Acabados Textiles',
    'Dimension Interna',
    'Gestión de Acabados Textiles',
    [
      Question(
          text:
              '¿Tiene conocimiento sobre los procesos de acabados textiles? (Lavado suavizado, siliconado, vaporizado)',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Qué tipo de procesos de acabados de la prenda, conoce?',
          options: [
            Option('Lavado', 1, 'normal'),
            Option('Suavizado ', 1, 'normal'),
            Option('Secado', 1, 'normal'),
            Option('Vaporizado', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text:
              'Si conoce el tema de lavado de la prenda, ¿Qué insumos utiliza?',
          options: [
            Option('Detergente de ropa', 0, 'normal'),
            Option('Shampoo', 0, 'normal'),
            Option('Jabon', 0, 'normal'),
            Option('Detergente para lavar fibra', 0, 'normal'),
            Option('Otros (Especifique)', 0, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text: 'Si conoce el tema de suavizado, ¿Qué insumos utiliza?',
          options: [
            Option('Suavizante comercial (Por ejemplo Suavitel)', 1, 'normal'),
            Option('Helphasoft', 2, 'normal'),
            Option('Otro (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text: '¿Qué tipo de secado realiza?',
          options: [
            Option('Secado expuesto al sol', 0, 'normal'),
            Option('Secado en sombra', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text: '¿De que manera vaporiza la prenda?',
          options: [
            Option('Plancha vaporizadora', 0, 'normal'),
            Option('Otro (Especifique)', 0, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text: '¿Realizas algún tipo de teñido textil?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Qué tipo de teñido realiza?',
          options: [
            Option('Teñido industrial', 0, 'normal'),
            Option('Teñido artesanal (Plantas y químicos)', 0, 'normal'),
            Option('Teñidos natural (Uso de plantas, flores y raíces)', 0,
                'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hiddenLauncher',
          totalScore: 0),
    ],
  ),
  Category(
    'Teñido industrial',
    'Dimension Interna',
    'Gestión de Acabados Textiles',
    [
      Question(
          text:
              '¿Hace cuánto tiempo se dedica a realizar el teñido industrial?',
          options: [
            Option('1 - 3 años', 1, 'normal'),
            Option('4 - 7 años', 2, 'normal'),
            Option('Mas de 7 años', 3, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué insumos utiliza para realizar el teñido?',
          options: [
            Option('Helphasoft', 1, 'normal'),
            Option('Igualantes', 1, 'normal'),
            Option('Sal textil', 1, 'normal'),
            Option('ácidos', 1, 'normal'),
            Option('Colorantes', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué dificultades presenta al momento de realizar el teñido?',
          options: [
            Option('Color no uniforme', 0, 'normal'),
            Option('Contrastes bajos', 0, 'normal'),
            Option('Color no deseado', 0, 'normal'),
            Option('Sangrado excesivo', 0, 'normal'),
            Option('Otro (Especifique)', 0, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
    ],
  ),
  Category(
    'Teñido artesanal (Plantas y químicos)',
    'Dimension Interna',
    'Gestión de Acabados Textiles',
    [
      Question(
          text: '¿Hace cuánto tiempo se dedica a realizar el teñido artesanal?',
          options: [
            Option('1 - 3 años', 1, 'normal'),
            Option('4 - 7 años', 2, 'normal'),
            Option('Mas de 7 años', 3, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué insumos y plantas utiliza para el teñido?',
          options: [
            Option('ácido cítrico', 1, 'normal'),
            Option('Cochinilla ', 1, 'normal'),
            Option('Alumbre', 1, 'normal'),
            Option('Soda caucica', 1, 'normal'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué dificultades presenta al momento de realizar el teñido?',
          options: [
            Option('Color no uniforme', 0, 'normal'),
            Option('Contrastes bajos', 0, 'normal'),
            Option('Color no deseado', 0, 'normal'),
            Option('Sangrado excesivo', 0, 'normal'),
            Option('Otros (Especifique)', 0, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
    ],
  ),
  Category(
    'Teñidos natural (Uso de plantas, flores y raíces)',
    'Dimension Interna',
    'Gestión de Acabados Textiles',
    [
      Question(
          text: '¿Hace cuánto tiempo se dedica a realizar el teñido natural?',
          options: [
            Option('1 - 3 años', 1, 'normal'),
            Option('4 - 7 años', 2, 'normal'),
            Option('Mas de 7 años', 3, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué plantas utiliza para realizar el teñido?',
          options: [
            Option('-', 0, 'edit'),
          ],
          typeWidget: 'edit',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text: '¿Qué tipo de mordientes utiliza?',
          options: [
            Option('Orina', 1, 'normal'),
            Option('Limon', 1, 'normal'),
            Option('Ceniza', 1, 'normal'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué dificultades presenta al momento de realizar el teñido?',
          options: [
            Option('Color no uniforme', 0, 'normal'),
            Option('Contrastes bajos', 0, 'normal'),
            Option('Color no deseado', 0, 'normal'),
            Option('Sangrado excesivo', 0, 'normal'),
            Option('Otro (Especifique)', 0, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text: '¿Qué tipo de teñido le gustaría aprender?',
          options: [
            Option('Teñido industrial', 0, 'normal'),
            Option('Teñido artesanal (Plantas y químicos)', 0, 'normal'),
            Option('Teñidos natural', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text:
              '¿Qué controles de calidad conoce en la  fase de hilado de alpaca? (Marque más de una laternativa?',
          options: [
            Option('Finura o diametro de la fibra', 2, 'normal'),
            Option('Medulación', 2, 'normal'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Qué controles de calidad de la fibra de alpaca conoce? (Marque más de una laternativa?',
          options: [
            Option('Torsión', 1, 'normal'),
            Option('Solidez al frote en húmedo', 1, 'normal'),
            Option('Solidez al frote en seco', 1, 'normal'),
            Option('Solidez al lavado', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
    ],
  ),
  Category(
    'Gestión de la Comercialización',
    'Dimension Interna',
    'Gestión de la Comercialización',
    [
      Question(
          text: '¿Su empresa cuenta con un modelo de negocio definido?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Su propuesta de valor esta enfocada en?',
          options: [
            Option('El producto', 1, 'normal'),
            Option('El proceso productivo', 1, 'normal'),
            Option('En la comeracialización', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué tipo de modelo comercial maneja su empresa?',
          options: [
            Option('B2B (Empresa a Empresa)', 1, 'normal'),
            Option('B2C (Empresa a Consumidor)', 1, 'normal'),
            Option('B2G (Empresa a Gobierno)', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Realiza el uso de alguna herramienta para gestionar las finanzas de su negocio? (registro de gastos e ingresos)',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Qué herramientas o recursos utilizas para gestionar las finanzas de su negocio?',
          options: [
            Option('Software de contabilidad o aplicaciones financieras', 3,
                'normal'),
            Option('Registros manuales en papel o un cuaderno', 1, 'normal'),
            Option('Registro en una plantilla de Excel', 2, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text:
              '¿Cómo calcula los costos de producción de sus productos textiles?',
          options: [
            Option(
                'Registro detallado de todos los gastos de materiales y mano de obra',
                3,
                'normal'),
            Option('Estimación basada en los costos promedio del mercado', 1,
                'normal'),
            Option(
                'No tengo un método establecido para calcular los costos de producción',
                0,
                'normal'),
            Option('Otro (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Qué estrategia(s) utiliza para fijar los precios de sus productos textiles?',
          options: [
            Option('Basado en el costo de la materia prima', 1, 'normal'),
            Option(
                'Basado en los costos de producción más un margen de ganancia deseado',
                3,
                'normal'),
            Option('Según el precio de mercado de productos similares', 2,
                'normal'),
            Option('Basado en la percepción de valor por parte del cliente', 1,
                'normal'),
            Option('No se cómo fijar precios adecuados', 0, 'ninguno'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Realizas el cálculo del margen de ganancia en la venta de sus productos textiles?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Cómo calculas el margen de ganancia en la venta de sus productos textiles?',
          options: [
            Option('Restando el costo de producción al precio de venta', 1,
                'normal'),
            Option(
                'Estableciendo un porcentaje fijo sobre el costo de producción',
                3,
                'normal'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text:
              '¿Conoce cuantos productos debería vender al mes para cubrir tus costos y tener un margen de ganancia?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Qué componentes consideras al calcular el punto de equilibrio de venta?',
          options: [
            Option('Costos fijos', 1, 'normal'),
            Option('Costos variables', 1, 'normal'),
            Option('Precio de venta', 1, 'normal'),
            Option('Todas las anteriores', 3, 'todas'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text:
              '¿Cómo utilizas la información del punto de equilibrio de venta en la gestión de su negocio?',
          options: [
            Option('Para establecer metas de ventas realistas', 0, 'normal'),
            Option('Para evaluar la viablidad de lanzar nuevos productos', 0,
                'normal'),
            Option('Para identificar areas de mejora', 0, 'normal'),
            Option('No estoy seguro(a)', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 0),
      Question(
          text: '¿Cuál es su nivel de ventas mensual?',
          options: [
            Option('No estoy seguro(a)', 0, 'normal'),
            Option('S/0 - S/1 000', 1, 'normal'),
            Option('S/1 001 - S/5 000', 2, 'normal'),
            Option('S/5 001 - S/8 000', 3, 'normal'),
            Option('S/8 001 - S/10 000', 4, 'normal'),
            Option('Más de S/20 000', 5, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 5),
      Question(
          text: '¿Qué cantidad de productos textiles elabora al mes?',
          options: [
            Option('1 - 10 unidades', 1, 'normal'),
            Option('11 - 50 unidades', 2, 'normal'),
            Option('50 - 100 unidades', 3, 'normal'),
            Option('Más de 100 unidades', 4, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 4),
      Question(
          text: '¿Qué cantidad de productos textiles vende al mes?',
          options: [
            Option('1 - 10 unidades', 1, 'normal'),
            Option('11 - 50 unidades', 2, 'normal'),
            Option('50 - 100 unidades', 3, 'normal'),
            Option('Más de 100 unidades', 4, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 4),
      Question(
          text:
              '¿Qué canales utiliza actualmente para promocionar y vender sus productos textiles?',
          options: [
            Option('Presencial (ferias, y tiendas físicas)', 0, 'normal'),
            Option('Digital (Redes sociales, market place, ecommerce)', 1,
                'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Qué canales presenciales utiliza actualmente para promocionar y vender sus productos textiles?',
          options: [
            Option('Venta directa en ferias locales', 1, 'normal'),
            Option('Venta directa en ferias regionales', 1, 'normal'),
            Option('Venta directa en ferias nacionales', 2, 'normal'),
            Option('Venta en tiendas especializadas individual', 3, 'normal'),
            Option('Venta en tiendas departamentales', 2, 'normal'),
            Option('Otros (especificar)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 4),
      Question(
          text:
              '¿Qué canales digitales utiliza actualmente para promocionar y vender sus productos textiles?',
          options: [
            Option('Venta en Redes sociales', 1, 'normal'),
            Option('Venta en un MarketPlace', 2, 'normal'),
            Option('Venta por un E-commerce', 2, 'normal'),
            Option('Venta en Redes de negocio', 2, 'normal'),
            Option('Otros (especificar)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text:
              '¿Quién(es) son los consumidores principales de sus productos textiles?',
          options: [
            Option('Comprador final', 2, 'normal'),
            Option('Comprador intermediario', 1, 'normal'),
            Option('Comprador final e intermediario', 2, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text: '¿Su empresa cuenta con una Marca?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: 'Su Marca se encuentran registrado en INDECOPI',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿En qué año registro su marca?',
          options: [
            Option('-', 0, 'edit'),
          ],
          typeWidget: 'edit',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 0),
      Question(
          text:
              '¿Qué estrategias utiliza para promover sus productos textiles?',
          options: [
            Option('Redes sociales (Facebook, Instagram, etc.)', 3, 'normal'),
            Option('Ferias y eventos locales', 1, 'normal'),
            Option('Tienda física propia', 2, 'normal'),
            Option('Ninguna de las anteriores', 0, 'ninguno'),
            Option('Otros (especificar)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Cómo gestiona la relación  con sus clientes habituales?',
          options: [
            Option(
                'Mantengo una comunicación regular a través de boletines informativos o correos electrónicos',
                1,
                'normal'),
            Option('Ofrezco descuentos especiales y promociones exclusivas', 1,
                'normal'),
            Option(
                'Utilizo programas de fidelización de clientes', 1, 'normal'),
            Option(
                'No tengo estrategias específicas para gestionar la relación con los clientes',
                0,
                'ninguno'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Conoce qué es un plan de Marketing?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Cuenta con un Plan de Marketing?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿Que tipo de plan de marketing utiliza?',
          options: [
            Option('Tradicional', 1, 'normal'),
            Option('Digital', 2, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Qué tipo de herramienta de Marketing utiliza? (Selección múltiple)',
          options: [
            Option('CRM', 2, 'normal'),
            Option('Gestor de contenido', 2, 'normal'),
            Option('Inteligencia Artificial', 2, 'normal'),
            Option('Mailing o correos electrónicos', 2, 'normal'),
            Option('Administrador de anuncios', 2, 'normal'),
            Option('Ninguna de las anteriores', 0, 'ninguno'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué formatos de Marketing digital utiliza?',
          options: [
            Option('Redes sociales (Facebook)', 1, 'normal'),
            Option('Plataformas virtuales (tiendas virtuales, marketplaces)', 2,
                'normal'),
            Option(
                'Marketing de contenidos (videos, fotografia de productos, blogs, etc)',
                3,
                'normal'),
            Option('Marketing con influencers', 3, 'normal'),
            Option('Paginas web', 2, 'normal'),
            Option('Ninguna de las anteriores', 0, 'ninguno'),
            Option('Otros (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Qué tipo de publicidad utiliza?',
          options: [
            Option('Online (Digital)', 2, 'normal'),
            Option('Tradicional (Períodicos, la radio, TV)', 1, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text: '¿Cuál es la frecuencia de publicación online?',
          options: [
            Option('Diario', 3, 'normal'),
            Option('Semanal', 2, 'normal'),
            Option('Mensual', 1, 'normal'),
            Option('No realiza', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Cuál es el Alcance de ventas (mercados) tiene su negocio?',
          options: [
            Option('Local', 1, 'normal'),
            Option('Nacional', 2, 'normal'),
            Option('Internacional', 3, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: 'Utiliza medios o plataformas de pago',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Cuáles son las plataforma de pago que utiliza?',
          options: [
            Option('Billeteras virtuales', 1, 'normal'),
            Option('Pasarela de pagos', 1, 'normal'),
            Option('Otro (Especifique)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text: '¿Qué tipo de Billeteras virtuales utiliza?',
          options: [
            Option('Yape', 1, 'normal'),
            Option('Plin', 1, 'normal'),
            Option('Wayki', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Cuenta con Pasarela de Pagos? ',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Qué tipo de pasarela de pago utiliza?',
          options: [
            Option('Paypal', 1, 'normal'),
            Option('Mercado pago', 1, 'normal'),
            Option('Culqi', 1, 'normal'),
            Option('Izypay', 1, 'normal'),
            Option('Niubiz', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text: '¿Cuenta con una tienda virtual (tienda virtual de ventas)?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
    ],
  ),
  Category(
    'Gestión de Finanzas',
    'Dimension Interna',
    'Gestión de Finanzas',
    [
      Question(
          text: '¿Alguna vez accedió a un crédito financiero?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿De que tipo de institución financiera accedio al crédito?',
          options: [
            Option('Caja Municipal', 0, 'normal'),
            Option('Caja Rural', 0, 'normal'),
            Option('Cooperativa', 0, 'normal'),
            Option('Banco', 0, 'normal'),
            Option('Otro (Especifique)', 0, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 0),
      Question(
          text: '¿Conoce que es un Fondo Concursable No Reembolsable?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Alguna vez accedio/ ganó un Fondo concursable No Reembolsable?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿Separa el ingreso de su hogar y el de su negocio?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Elabora un presupuesto mensual de su hogar?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿Elabora un presupuesto mensual de su negocio?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              'De sus ingresos mensuales de su hogar ¿Separa un monto específico para ahorrar?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              'De sus ingresos mensuales de su negocio ¿Separa un monto específico para ahorrar? ',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
    ],
  ),
  Category(
    'Gestión de la Tributación',
    'Dimension Interna',
    'Gestión de la Tributación',
    [
      Question(
          text: '¿Conoce que es un “Tributo”?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Qué entiende por Tributo?',
          options: [
            Option(
                'Un descuento en los precios de los insumos para los emprendedores textiles',
                0,
                'normal'),
            Option(
                'Un impuesto que deben pagar las unidades productivas a la autoridad tributaria.',
                1,
                'normal'),
            Option(
                'Un subsidio otorgado por el gobierno para fomentar la producción textil.',
                0,
                'normal'),
            Option(
                'Un incentivo fiscal para las asociaciones de artesanos en la industria textil.',
                0,
                'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text:
              '¿Conoce cuál es la entidad encargada de fiscalizar y controlar el cumplimiento de las obligaciones tributarias de las unidades productivas en Perú?',
          options: [
            Option(
                'SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)',
                1,
                'normal'),
            Option(
                'INDECOPI (Instituto Nacional de Defensa de la Competencia y de la Protección de la Propiedad Intelectual)',
                0,
                'normal'),
            Option('MINCETUR (Ministerio de Comercio Exterior y Turismo)', 0,
                'normal'),
            Option('MINAGRI (Ministerio de Agricultura y Riego)', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Cónoce que tipo de impuestos pagan las empresas en Perú?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Cuáles son los impuestos que pagan las empresas en Perú?',
          options: [
            Option(
                'Impuesto a la renta y el Impuesto General a las Ventas (IGV).',
                1,
                'normal'),
            Option('Impuesto predial y municipalidad.', 0, 'normal'),
            Option('Impuesto a la herencia y donaciones.', 0, 'normal'),
            Option('Ninguno, las empresas textiles están exentas de impuestos.',
                0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text: '¿Cónoce que tipo de impuestos pagan las empresas en Perú?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Qué es el Impuesto a la Renta y cuál es su función?',
          options: [
            Option('Es un impuesto extra que se paga a la municipalidad.', 0,
                'normal'),
            Option('Es un impuesto sobre las ganancias que genera un negocio.',
                1, 'normal'),
            Option(
                'Es un tributo que se paga por tener un local.', 0, 'normal'),
            Option('Es un impuesto opcional para las empresas.', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text:
              '¿Qué se entiende por "comprobante de pago" en el ámbito tributario?',
          options: [
            Option('Un documento que respalda una transacción comercial.', 1,
                'normal'),
            Option('Un formulario para declarar los impuestos.', 0, 'normal'),
            Option('Un recibo de sueldo para los empleados.', 0, 'normal'),
            Option('No tiene relación con los impuestos.', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Cuáles son los comprobantes de pago que existen?',
          options: [
            Option(
                'Factura, boleta de venta, Recibo por honorarios y Guía de Remisión.',
                1,
                'normal'),
            Option('Recibo por honorarios, Tickets de máquinas', 0, 'normal'),
            Option('Boleta de venta, Proforma de venta', 0, 'normal'),
            Option(
                'Factura, boleta de venta, Guía de remisión y Proforma de venta',
                0,
                'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Qué es un régimen tributario?',
          options: [
            Option('Un sistema para pagar impuestos en otras monedas.', 0,
                'normal'),
            Option(
                'Un conjunto de normas para el pago de impuestos según la actividad económica.',
                1,
                'normal'),
            Option('Un servicio público gratuito.', 0, 'normal'),
            Option('Un tipo de seguro para empresas.', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Conoce cuántos regímenes tributarios existen en Perú?',
          options: [
            Option('2', 0, 'normal'),
            Option('3', 0, 'normal'),
            Option('4', 1, 'normal'),
            Option('5', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Conoce cuál de los siguientes regímenes tributarios está dirigido principalmente a las micro y pequeñas empresas en Perú?',
          options: [
            Option('Régimen General', 0, 'normal'),
            Option('Régimen MYPE Tributario', 0, 'normal'),
            Option('Régimen Especial del Impuesto a la Renta', 0, 'normal'),
            Option('Nuevo Régimen Único Simplificado', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text:
              '¿Conoce qué impuestos deben pagar todas las empresas en Perú, independientemente del régimen tributario?',
          options: [
            Option(
                'Impuesto a la Renta y Contribución al Seguro Social de Salud (ESSALUD).',
                1,
                'normal'),
            Option(
                'Impuesto General a las Ventas (IGV) y Contribución al Seguro Social de Salud (ESSALUD).',
                0,
                'normal'),
            Option(
                'Impuesto a los Activos Financieros (IAF) y Contribución al Seguro Social de Salud (ESSALUD).',
                0,
                'normal'),
            Option('Ninguna de las anteriores', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
    ],
  ),
  Category(
    'Educación',
    'Dimension Externa',
    'Educación',
    [
      Question(
          text: '¿Cuál es tu nivel educativo alcanzado?',
          options: [
            Option('Sin educación', 0, 'normal'),
            Option('Educación primaria incompleta', 1, 'normal'),
            Option('Educación primaria completa', 2, 'normal'),
            Option('Educación secundaria incompleta', 3, 'normal'),
            Option('Educación secundaria completa', 4, 'normal'),
            Option('Educación técnica o superior', 5, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 5),
      Question(
          text: '¿Existe infraestructura educativa en tu comunidad?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
    ],
  ),
  Category(
    'Transporte',
    'Dimension Externa',
    'Transporte',
    [
      Question(
          text:
              '¿Qué tipo de carretera es más común en la ruta hacia la comunidad de la unidad productiva de camélidos?',
          options: [
            Option('Asfaltada', 3, 'normal'),
            Option('De tierra', 2, 'normal'),
            Option('Pavimentada', 1, 'normal'),
            Option('Otro (especificar)', 1, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Cuánto tiempo en promedio tardan los trabajadores en llegar desde la ciudad más cercana a la comunidad?',
          options: [
            Option('Menos de 30 minutos', 4, 'normal'),
            Option('Entre 30 minutos y 1 hora', 3, 'normal'),
            Option('Entre 1 y 2 horas', 2, 'normal'),
            Option('Más de 2 horas', 1, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 4),
      Question(
          text:
              '¿Qué importancia tiene la ubicación geográfica de la unidad productiva en relación con los principales mercados de destino?',
          options: [
            Option(
                'Impacta directamente en los tiempos de entrega y costos de transporte',
                0,
                'normal'),
            Option('No tiene relevancia para la competitividad', 0, 'normal'),
            Option('Aumenta los costos de producción', 0, 'normal'),
            Option('Facilita la competencia con otras empresas', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text:
              '¿Qué impacto tiene el estado de las carreteras en el transporte de productos textiles de la unidad productiva?',
          options: [
            Option(
                'Puede causar retrasos y daños en la mercancía', 0, 'normal'),
            Option('No afecta la competitividad', 0, 'normal'),
            Option('Reduce los costos de transporte', 0, 'normal'),
            Option('Mejora la eficiencia logística', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
    ],
  ),
  Category(
    'Telecomunicaciones',
    'Dimension Externa',
    'Telecomunicaciones',
    [
      Question(
          text:
              '¿Qué tipo de cobertura de red de telecomunicaciones tiene disponible en su comunidad/ lugar de residencia?',
          options: [
            Option('Cobertura 4G/5G', 3, 'normal'),
            Option('Cobertura 3G', 2, 'normal'),
            Option('Cobertura 2G', 1, 'normal'),
            Option('Sin cobertura de red', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Qué tipo de acceso a internet es más comúnmente utilizado en su comunoidad/  local de residencia?',
          options: [
            Option('Internet de banda ancha fija', 1, 'normal'),
            Option('Internet móvil (3G/4G)', 1, 'normal'),
            Option('Internet satelital', 1, 'normal'),
            Option('No se cuenta con acceso a internet', 0, 'ninguno'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Cómo utiliza los dispositivos electrónicos en su día a día y la actividad económica que realiza?',
          options: [
            Option('Para comunicarse con clientes y proveedores', 2, 'normal'),
            Option('Para acceder a información y realizar tareas en línea', 2,
                'normal'),
            Option(
                'No utilizan dispositivos electrónicos para el desarrollo de su  actividad económica.',
                0,
                'ninguno'),
            Option('Solo para fines personales', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
    ],
  ),
  Category(
    'Salud',
    'Dimension Externa',
    'Salud',
    [
      Question(
          text:
              '¿Existe una infraestructura de salud en tu comunidad que brinde atención médica?',
          options: [
            Option('Sí, contamos con centros de salud cercanos y accesibles.',
                2, 'normal'),
            Option('Sí, pero la infraestructura de salud es limitada.', 1,
                'normal'),
            Option(
                'No, debemos desplazarnos a otras localidades para recibir atención médica.',
                0,
                'normal'),
            Option('Otro (especificar)', 1, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Cuál es la frecuencia que reciben atención médica preventiva?',
          options: [
            Option('Regularmente, al menos una vez al año.', 3, 'normal'),
            Option(
                'Ocasionalmente, dependiendo de la disponibilidad de servicios de salud.',
                2,
                'normal'),
            Option(
                'Raramente, debido a la falta de acceso a servicios de salud.',
                1,
                'normal'),
            Option('No reciben atención médica preventiva.', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Se encuentra afiliado al Seguro Integral de Salud (SIS)?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text: '¿Realiza uso de su Seguro Integral de Salud (SIS)?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 1),
      Question(
          text:
              '¿Con qué frecuencia hace uso de su Seguro Integral de Salud (SIS)?',
          options: [
            Option('Mensual', 4, 'normal'),
            Option('4 veces al año', 3, 'normal'),
            Option('2 veces al año', 2, 'normal'),
            Option('1 vez al año', 1, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 4),
    ],
  ),
  Category(
    'Agua y Saneamiento',
    'Dimension Externa',
    'Agua y Saneamiento',
    [
      Question(
          text: '¿Tienes acceso a agua potable en su hogar/comunidad?',
          options: [
            Option('a) Sí, siempre tengo acceso a agua potable.', 2, 'normal'),
            Option('b) A veces, el acceso es limitado o intermitente.', 1,
                'normal'),
            Option('c) No, no tengo acceso a agua potable de forma regular.', 0,
                'normal'),
            Option('d) Otro (especificar)', 1, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Cómo calificarías la calidad del agua que utilizas para tus actividades diarias?',
          options: [
            Option('a) Buena, el agua es segura y apta para el consumo.', 2,
                'normal'),
            Option(
                'b) Regular, a veces presenta problemas de turbidez o sabor.',
                1,
                'normal'),
            Option(
                'c) Mala, el agua es contaminada y no se puede consumir directamente.',
                0,
                'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Dispones de instalaciones adecuadas de saneamiento, como baños o letrinas, en tu comunidad o lugar de trabajo?',
          options: [
            Option(
                'a) Sí, contamos con instalaciones de saneamiento adecuadas.',
                2,
                'normal'),
            Option('b) Algunas personas tienen acceso, pero no todos.', 1,
                'normal'),
            Option('c) No, la mayoría carece de instalaciones de saneamiento.',
                0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Tiene su hogar y/o comunidad acceso a instalaciones adecuadas de saneamiento, como baños y sistemas de alcantarillado?',
          options: [
            Option(
                'a) Sí, contamos con baños y sistemas de alcantarillado adecuados.',
                2,
                'normal'),
            Option(
                'b) Tenemos baños, pero el sistema de alcantarillado es deficiente.',
                1,
                'normal'),
            Option('c) No tenemos baños ni sistema de alcantarillado adecuado.',
                0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
    ],
  ),
  Category(
    'G. Ambiental Emprendedor',
    'Dimension Externa',
    'Gestión Ambiental',
    [
      Question(
          text:
              '¿Qué entiende usted por gestión ambiental en el contexto de su trabajo como artesano/a?',
          options: [
            Option(
                'Actividades destinados a minimizar el impacto negativo de las actividades humanas en el medio ambiente y promover el uso sostenible de los recursos naturales.',
                2,
                'normal'),
            Option('Cuidar los recursos naturales como el agua y los bosques.',
                1, 'normal'),
            Option('No estoy seguro/a de lo que significa', 0, 'normal'),
            Option('Otro (especificar)', 1, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Qué prácticas realiza su hogar o con su actividad económica para cuidar el medio ambiente?',
          options: [
            Option('Separamos los residuos sólidos para su reciclaje.', 1,
                'normal'),
            Option('Reutilizamos materiales en la fabricación de productos.', 1,
                'normal'),
            Option('Reducimos el consumo de agua y energía.', 1, 'normal'),
            Option('Ninguna de las anteriores', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Su comunidad o lugar de residencia cuenta con un sistema de recolección de residuos sólidos?',
          options: [
            Option('a) Sí, contamos con un servicio regular de recolección.', 2,
                'normal'),
            Option('b) A veces, el servicio de recolección es irregular.', 1,
                'normal'),
            Option('c) No, no tenemos servicio de recolección de residuos.', 0,
                'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Qué acciones específicas toma para reducir el impacto ambiental en su proceso de producción textil?',
          options: [
            Option('Uso de tintes naturales y orgánicos', 1, 'normal'),
            Option('Reciclaje de materiales y residuos', 1, 'normal'),
            Option('Reducción de consumo de agua y energía eléctrica', 1,
                'normal'),
            Option('No realizo ninguna acción', 0, 'ninguno'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              'En tu proceso de producción textil, ¿Qué técnicas ancestrales utilizas para reducir el impacto ambiental?',
          options: [
            Option('Pastoreo rotativo para preservar la vegetación natural', 1,
                'normal'),
            Option('Teñido natural con plantas y minerales locales/ de la zona',
                1, 'normal'),
            Option('Uso de técnicas de tejido tradicional (Away, telar)', 1,
                'normal'),
            Option('No utilizo ninguna técnica ancestral', 0, 'ninguno'),
            Option('Otro (Especifique)', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
    ],
  ),
  Category(
    'G. Ambiental Asociacion/Cooperativa',
    'Dimension Externa',
    'Gestión Ambiental',
    [
      Question(
          text:
              '¿Qué entiende por gestión ambiental en el contexto de su trabajo como artesano/a dentro de su Asociación o cooperativa?',
          options: [
            Option(
                'Actividades destinados a minimizar el impacto negativo de las actividades humanas en el medio ambiente y promover el uso sostenible de los recursos naturales.',
                2,
                'normal'),
            Option('Cuidar los recursos naturales como el agua y los bosques.',
                1, 'normal'),
            Option('No estoy seguro/a de lo que significa', 0, 'normal'),
            Option('Otra respuesta (especificar).', 1, 'otro'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              'En tu empresa utilizas estrategias de sensibilización para sus clientes acerca de la importancia de la sostenibilidad ambiental?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 1, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Qué prácticas realiza su asociación para cuidar el medio ambiente?',
          options: [
            Option('Separamos los residuos sólidos para su reciclaje.', 1,
                'normal'),
            Option('Reutilizamos materiales en la fabricación de productos.', 1,
                'normal'),
            Option('Reducimos el consumo de agua y energía.', 1, 'normal'),
            Option('Ninguna de las anteriores', 0, 'ninguno'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text:
              '¿Su Asociación u Cooperativa cuenta con un sistema de recolección de residuos sólidos?',
          options: [
            Option('a) Sí, contamos con un servicio regular de recolección.', 2,
                'normal'),
            Option('b) A veces, el servicio de recolección es irregular.', 1,
                'normal'),
            Option('c) No, no tenemos servicio de recolección de residuos.', 0,
                'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              '¿Qué acciones específicas se toman en su Asociación y/o Cooperativa para reducir el impacto ambiental en su proceso de producción textil?',
          options: [
            Option('Uso de tintes naturales y orgánicos', 1, 'normal'),
            Option('Reciclaje de materiales y residuos', 1, 'normal'),
            Option('Reducción de consumo de agua y energía eléctrica', 1,
                'normal'),
            Option('No realizo ninguna acción', 0, 'ninguno'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              'En su proceso de producción textil, ¿Qué técnicas ancestrales utilizan para reducir el impacto ambiental?',
          options: [
            Option('Re uso de mermas', 1, 'normal'),
            Option('Teñido natural con plantas y minerales locales de la zona',
                1, 'normal'),
            Option('Uso de técnicas de tejido tradicional (Away, telar)', 1,
                'normal'),
            Option('Otros (especificar)', 1, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Qué estrategias aplica para sensibilizar a tu comunidad y clientes sobre la importancia de la gestión ambiental en la producción textil?',
          options: [
            Option(
                'Organización de talleres y eventos educativos sobre prácticas sostenibles',
                1,
                'normal'),
            Option(
                'Creación de campañas de sensibilización en redes sociales y medios locales',
                1,
                'normal'),
            Option(
                'Inclusión de información sobre la sostenibilidad en el etiquetado y marketing de sus productos textiles',
                1,
                'normal'),
            Option('Ninguna estrategia', 0, 'ninguno'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
    ],
  ),
  Category(
    'G. Ambiental Empresa',
    'Dimension Externa',
    'Gestión Ambiental',
    [
      Question(
          text:
              '¿Qué entiende usted por gestión ambiental en el contexto de su trabajo como artesano/a?',
          options: [
            Option(
                'Actividades destinados a minimizar el impacto negativo de las actividades humanas en el medio ambiente y promover el uso sostenible de los recursos naturales.',
                2,
                'normal'),
            Option('Cuidar los recursos naturales como el agua y los bosques.',
                1, 'normal'),
            Option('No estoy seguro/a de lo que significa', 0, 'normal'),
            Option('Otra respuesta (especificar).', 1, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 2),
      Question(
          text:
              'En tu empresa utilizas estrategias de sensibilización para sus clientes acerca de la importancia de la sostenibilidad ambiental?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 1, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Qué estrategías utiliza para sensibilizar a sus clientes sobre la importancia de la sostenibilidad ambiental en la industria textil?',
          options: [
            Option(
                'Etiquetado y marketing que resalten las práxticas sostenibles de la empresa',
                1,
                'normal'),
            Option(
                'Organización de eventos educativos y charlas sobre el impacto ambiental de la industria textil',
                1,
                'normal'),
            Option('Ofreciendo productos sostenibles', 1, 'normal'),
            Option('Ninguna de las anteriores', 0, 'ninguno'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 3),
      Question(
          text:
              '¿Qué desafios enfrentan en la implementación de prácticas ambientales en sus negocios?',
          options: [
            Option(
                'Costos elevados asociados con la adopción de tecnologías sostenibles',
                0,
                'normal'),
            Option('Escasez de recursos y acceso limitado a financiamiento', 0,
                'normal'),
            Option(
                'Falta de capacitación y conocimiento sobre  practicas sostenibles',
                0,
                'normal'),
            Option('Otros (especificar)', 0, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text:
              '¿Qué medidas concretas ha implementado su Asociación/Cooperativa para reducir su impacto ambiental?',
          options: [
            Option('Uso de materiales reciclables en nuestros productos.', 1,
                'normal'),
            Option(
                'Reducción del consumo de agua y energía en procesos productivos.',
                1,
                'normal'),
            Option(
                'Implementación de tecnologías limpias para reducir emisiones',
                1,
                'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Qué desafíos enfrenta su empresa en términos de gestión ambiental y cuidado del medio ambiente?',
          options: [
            Option(
                'Resistencia al cambio debido a la arraigada tradición cultural',
                0,
                'normal'),
            Option('Falta de capacitación y conciencia ambiental', 0, 'normal'),
            Option(
                'Dificultades para acceder a tecnologías limpias y sostenibles.',
                0,
                'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
    ],
  ),
  Category(
    'Tecnologia e Innovación',
    'Dimension Externa',
    'Tecnologia e Innovación',
    [
      Question(
          text:
              '¿Qué tipo de dispositivos electrónicos posee actualmente para su trabajo como artesano/a de camélidos?',
          options: [
            Option('No poseo dispositivos electrónicos.', 0, 'ninguno'),
            Option('Celular básico (analógico).', 1, 'normal'),
            Option('Celular inteligente (smartphone).', 2, 'normal'),
            Option('Tablet u otro dispositivo electrónico.', 2, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text: '¿Para qué utiliza principalmente su teléfono móvil?',
          options: [
            Option('Para comunicarse con clientes y proveedores.', 2, 'normal'),
            Option('Para buscar información sobre técnicas de tejido y diseño.',
                2, 'normal'),
            Option('Para promocionar y vender sus productos en redes sociales.',
                2, 'normal'),
            Option('Lo utilizo con fines personales ', 1, 'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Qué tipo de tecnología utilizas en la producción de sus productos  textiles?',
          options: [
            Option('Maquinaria tradicional (Telar, away, palitos, etc.)', 0,
                'normal'),
            Option(
                'Maquinaria semi industrial (Telar automático, máquinas de tejer, etc.)',
                0,
                'normal'),
            Option('Máquina industrial (Máquinas de tejer industriales)', 0,
                'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
      Question(
          text:
              '¿Cómo utiliza la tecnología en el proceso de producción de textiles?',
          options: [
            Option('No utiliza tecnología en el proceso de producción.', 0,
                'ninguno'),
            Option('Utiliza el celular para comunicaciones y pedidos.', 1,
                'normal'),
            Option('Utiliza tabletas para diseño y gestión de inventario.', 2,
                'normal'),
            Option(
                'Utiliza herramientas tecnológicas avanzadas en todo el proceso.',
                3,
                'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Realiza el uso de algún tipo de tecnologías de diseño, sistemas de gestión de inventarios o aplicativo móvil?',
          options: [
            Option('Si', 1, 'normal'),
            Option('No', 0, 'normal'),
          ],
          typeWidget: 'unique',
          isVisible: true,
          behavior: 'normal',
          totalScore: 1),
      Question(
          text:
              '¿Qué tipo de tecnologías utiliza su empresa en la cadena de valor textil de camélidos?',
          options: [
            Option('a) Tecnologías de diseño y modelado 3D.', 2, 'normal'),
            Option(
                'b) Sistemas de gestión de inventarios y ventas.', 2, 'normal'),
            Option(
                'c) Aplicaciones móviles para seguimiento de procesos productivos.',
                2,
                'normal'),
          ],
          typeWidget: 'multiple',
          isVisible: false,
          behavior: 'hidden',
          totalScore: 2),
      Question(
          text:
              '¿Has implementado alguna innovación en tu negocio de prendas de alpaca en los últimos 2 años?',
          options: [
            Option('Sí, en el proceso de producción', 1, 'normal'),
            Option('Sí, en el diseño de prendas', 1, 'normal'),
            Option('Sí, en la comercialización y marketing', 1, 'normal'),
            Option('No he implementado ninguna innovación', 0, 'ninguno'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 3),
      Question(
          text:
              '¿Cuáles consideras que son los principales obstaculos para implementar tecnología e innovación en tu negocio?',
          options: [
            Option('Falta de acceso a financiamiento para adquirir tecnologías',
                0, 'normal'),
            Option(
                'Falta de conocimientos sobre nuevas tecnologías', 0, 'normal'),
            Option('Resistencia al cambio', 0, 'normal'),
            Option('Costo elevado de implementación', 0, 'normal'),
            Option('Otros (especificar)', 0, 'otro'),
          ],
          typeWidget: 'multiple',
          isVisible: true,
          behavior: 'normal',
          totalScore: 0),
    ],
  ),
];

Map<String, Category> getCategories() {
  Map<String, Category> categoriesMap = {};

  for (var category in categories_data) {
    categoriesMap[category.name] = category;
  }
  return categoriesMap;
}
