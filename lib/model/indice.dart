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
  final int behavior;
  final int totalScore;
  Question(this.text, this.options, this.typeWidget, this.isVisible,
      this.behavior, this.totalScore);
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
          0,
          1),
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
          1,
          9),
      Question(
          '¿La asociación cuenta con el Registro Único del Contribuyente (RUC)?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Cuál es la situación actual del RUC de la asociación?',
          [
            Option('Activo y Habido', 1),
            Option('Suspendido y Habido', 3),
          ],
          0,
          false,
          1,
          3),
      Question(
          '¿La asociación cuenta con Estatuto actualizado?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿La junta directiva de la asociación se encuentra activa y registrada en SUNARP?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿A parte de la junta directiva ¿La asociación cuenta con un organigrama (área de finanzas, ventas, marketing, producción y otros)?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Conoce cuál es el CIIU de la Asociación?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Cuál es el CIIU principal de la Asociación?',
          [
            Option('', 3),
          ],
          2,
          false,
          1,
          3),
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
          0,
          9),
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
          0,
          1),
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
          0,
          9),
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
          0,
          9),
      Question(
          '¿Cuenta con un organigrama de gestión?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
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
          0,
          true,
          0,
          9),
      Question(
          '¿Cuál es el número de trabajadores con el que cuenta?',
          [
            Option('1 - 10 trabajadores', 1),
            Option('11 - 50 trabajadores', 3),
            Option('51 - 250 trabajadores', 6),
            Option('Más de 250 trabajadores', 9),
          ],
          0,
          true,
          0,
          9),
      Question(
          '¿Cuenta con un organigrama de gestión?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿A qué régimen societario pertenece su empresa?',
          [
            Option(
                'Empresa Individual de Responsabilidad Limitada (E.I.R.L)', 0),
            Option('Sociedad Anónima Abierta (S.A.A)', 0),
            Option('Sociedad Anónima Cerrada (S.A.C)', 0),
            Option('Sociedad Anónima (S.A)', 0),
          ],
          0,
          false,
          1,
          0),
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
          0,
          1),
      Question(
          'Tipo de Régimen Único del contribuyente (RUC) que posee',
          [
            Option('Persona natural con negocio', 3),
            Option('Persona natural sin negocio', 1),
          ],
          0,
          false,
          1,
          3),
      Question(
          '¿Alguna vez realizó el Análisis FODA de su organización?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Su organización cuenta con un propósito (Misión)?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          'Si la respuesta es "Sí". Mencione su Misión',
          [
            Option('-', 3),
          ],
          2,
          false,
          1,
          3),
      Question(
          '¿Su organización cuenta con una proyección a futuro (Visión)?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          'Si la respuesta es "Sí". Mencione su Visión',
          [
            Option('-', 3),
          ],
          2,
          false,
          1,
          3),
      Question(
          '¿La organización cuenta con valores clave?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          'Si la respuesta es "Sí". Mencione sus valores clave',
          [
            Option('-', 3),
          ],
          2,
          false,
          1,
          3),
      Question(
          '¿La organización cuenta con objetivos estratégicos?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          'Si la respuesta es "Sí". Mencione sus objetivos estratégicos',
          [
            Option('-', 3),
          ],
          2,
          false,
          1,
          3),
    ],
  ),
  Category(
    'Criador de Alpacas',
    'Dimension Interna',
    'Gestión Productiva Primaria',
    [
      Question(
          '¿Qué raza de alpaca posee?',
          [
            Option('Suri', 1),
            Option('Huacaya', 1),
            Option('Suri y Huacaya', 3),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Cuál es la cantidad de alpacas que posee?',
          [
            Option('1 - 50 alpacas (Pequeño criador)', 1),
            Option('51 - 150 alpacas (Mediano)', 3),
            Option('Más de 150 (Grande)', 6),
          ],
          0,
          true,
          0,
          6),
      Question(
          '¿Qué tipo de esquila realiza?',
          [
            Option('Manual', 1),
            Option('Mecánica', 1),
            Option('Manual y mecánica', 3),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Qué tipo de herramienta utiliza para realizar la esquila de la alpaca?',
          [
            Option('Cuchillo', 1),
            Option('Tijera', 3),
            Option('Esquiladora mecánica', 9),
          ],
          1,
          true,
          0,
          9),
      Question(
          '¿Cuántas veces al año realiza la esquila de la alpaca?',
          [
            Option('1 vez al año', 1),
            Option('2 veces al año', 3),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Realiza la esquila aplicando las normas tecnicas peruanas de buenas practicas de esquila?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Realiza la venta de fibra de alpaca?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          false,
          1,
          1),
      Question(
          '¿De qué manera realiza la venta de la fibra de alpaca?',
          [
            Option('Fibra en brosa', 1),
            Option('Fibra categorizada', 3),
            Option('Fibra clasificada', 6),
            Option('Todas las anteriores', 9),
          ],
          1,
          true,
          2,
          9),
    ],
  ),
  Category(
    'Fibra en brosa',
    'Dimension Interna',
    'Gestión Productiva Primaria',
    [
      Question(
          '¿Qué cantidad de fibra en brosa vende?',
          [
            Option('1 - 30 libras', 1),
            Option('31 - 60 libras', 3),
            Option('Más de 60 libras', 6),
          ],
          0,
          true,
          0,
          6),
      Question(
          '¿Cuál es el precio de venta de la fibra en brosa?',
          [
            Option('S/ 5 - S/ 10', 1),
            Option('S/ 11 - S/ 15', 3),
            Option('S/ 16 - S/ 20', 6),
          ],
          0,
          true,
          0,
          6),
      Question(
          '¿A quién vende la fibra en brosa?',
          [
            Option('Acopiador minorista (compadre)', 1),
            Option('Acopiador mayorista', 1),
            Option('En ferias', 3),
            Option('A una empresa', 3),
          ],
          1,
          true,
          0,
          6),
    ],
  ),
  Category(
    'Fibra categorizada',
    'Dimension Interna',
    'Gestión Productiva Primaria',
    [
      Question(
          '¿Conoce la categorizacion de fibra de alpaca?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Aplica la norma técnica peruana de categorización de fibra de alpaca?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          false,
          1,
          1),
      Question(
          '¿Qué cantidad de fibra categorizada vende?',
          [
            Option('1 - 30 libras', 1),
            Option('31 - 60 libras', 3),
            Option('Más de 60 libras', 6),
          ],
          0,
          true,
          0,
          6),
      Question(
          '¿Cuál es el precio de venta de la fibra en brosa?',
          [
            Option('S/ 5 - S/ 10', 1),
            Option('S/ 11 - S/ 15', 3),
            Option('S/ 16 - S/ 20', 6),
            Option('Más de S/ 20', 9),
          ],
          0,
          true,
          0,
          9),
      Question(
          '¿A quién vende la fibra categorizada?',
          [
            Option('Acopiador minorista', 1),
            Option('Acopiador mayorista', 3),
            Option('En ferias', 6),
            Option('A una empresa', 9),
          ],
          1,
          true,
          0,
          6),
    ],
  ),
  Category(
    'Artesano / Productor de productos textiles',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          '¿Que tipo de artesanías elabora?',
          [
            Option('Prendas tejidas a punto', 0),
            Option('Peletería', 0),
            Option('Tejido plano en Telar', 0),
          ],
          0,
          true,
          2,
          0),
    ],
  ),
  Category(
    'Prendas Tejidas a Punto',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          '¿Cuántos años lleva usted o su organización en el rubro de la artesanía textil?',
          [
            Option('Menos de 1 año', 1),
            Option('1 - 3 años', 3),
            Option('3 - 5 años', 6),
            Option('Más de 5 años', 9),
          ],
          0,
          true,
          0,
          9),
      Question(
          '¿Qué tipo de productos artesanales produce?',
          [
            Option('Prendas', 1),
            Option('Accesorios', 1),
            Option('DecoHome', 1),
            Option('Todas las anteriores', 3),
            Option('Otros', 1),
          ],
          1,
          true,
          2,
          3),
    ],
  ),
  Category(
    'Prendas',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          '¿Qué tipo de prendas elabora?',
          [
            Option('Chompas', 1),
            Option('Ponchos', 1),
            Option('Gorras', 1),
            Option('Chalinas', 1),
            Option('Todas las anteriores', 3),
            Option('Otros', 1),
          ],
          1,
          true,
          0,
          3),
    ],
  ),
  Category(
    'Accesorios',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          '¿Qué tipo de accesorios elabora?',
          [
            Option('Vinchas', 1),
            Option('Guantes', 1),
            Option('Mitones', 1),
            Option('Otros', 1),
            Option('Todas las anteriores', 3),
          ],
          1,
          true,
          0,
          3),
    ],
  ),
  Category(
    'DecoHome',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          '¿Qué tipo de productos de DecoHome elabora?',
          [
            Option('Cojines', 1),
            Option('Caminos de mesa', 1),
            Option('Adornos para el hogar', 1),
            Option('Tapetes', 1),
            Option('Otros:', 1),
            Option('Todas las anteriores', 3),
          ],
          1,
          true,
          0,
          3),
      Question(
          '¿Qué técnica(s) de producción de tejido maneja?',
          [
            Option('Crochet', 1),
            Option('Palitos de tejer', 1),
            Option('Máquina de tejido rectilíneo', 3),
            Option('Máquina de tejido rectilineo industrial (Shima)', 3),
            Option('4 Estacas', 1),
            Option('Telar', 1),
            Option('Otros: …………………….', 1),
          ],
          1,
          true,
          0,
          3),
      Question(
        '¿Con qué herramientas cuenta para el proceso de producción?',
        [
          Option('Palito y/o crochet', 1),
          Option('Máquina de tejer', 1),
          Option('Remalladora de plato', 3),
          Option('Moldes', 3),
          Option('Todas las anteriores', 6),
        ],
        1,
        true,
        0,
        6,
      ),
      Question(
        '¿Realiza el uso de la tabla de medidas para el desarrollo de sus productos textiles?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
        0,
        1,
      ),
      Question(
        '¿Realiza el uso de la ficha técnica para el desarrollo de sus productos textiles?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
        0,
        1,
      ),
      Question(
        '¿Cuál es el nivel de conocimiento que tiene de la ficha tecnica para elaborar sus productos textiles?',
        [
          Option('Solo interpreta la ficha técnica', 1),
          Option('Interpreta y elabora una ficha técnica', 3),
        ],
        0,
        true,
        0,
        3,
      ),
      Question(
        '¿Realiza el patronaje para el desarrollo de sus productos textiles?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
        0,
        1,
      ),
      Question(
        '¿Posee un registro o un archivo de las fichas tecnicas de sus productos textiles desarrollados?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
        0,
        1,
      ),
      Question(
        '¿A qué estilo de diseño pertenece los productos textiles que desarrolla?',
        [
          Option('Autóctono / tradicional', 0),
          Option('Contemporáneo', 0),
          Option('Vanguardista', 0),
        ],
        0,
        true,
        0,
        0,
      ),
      Question(
        '¿De qué manera desarrolla el diseño de sus productos textiles?',
        [
          Option('Empírica influenciado por el entorno en el que vive', 1),
          Option('Si recibio una capacitación', 3),
        ],
        0,
        true,
        0,
        3,
      ),
      Question(
        '¿Qué tipo de estudio utiliza para el desarrollo de sus productos textiles?',
        [
          Option('Estudio de mercado', 3),
          Option('Revision de fuentes de tendencia', 6),
          Option('Replica de otros productos de la zona', 1),
        ],
        1,
        true,
        0,
        6,
      ),
      Question(
        '¿Qué tan importante considera a la incorporación de Moda y nuevas tendencias en la elaboración de sus productos textiles?',
        [
          Option('1: Nada importante', 0),
          Option('2: Poco importante', 3),
          Option('3: Muy importante', 6),
        ],
        0,
        true,
        0,
        6,
      ),
      Question(
        '¿Qué procesos de acabado de las prendas textiles realiza a nivel producción?',
        [
          Option('Lavado del hilado antes del desarrollo el producto', 1),
          Option('Desarrollo de una muestra antes de iniciar el tejido', 3),
          Option('Vaporiza de las prendas al finalizar su elaboración', 6),
          Option(
              'Ocultado de hilados al finalizar el armado de su producto', 9),
          Option('Todas las anteriores', 9),
        ],
        1,
        true,
        0,
        9,
      ),
      Question(
        '¿Qué Máquina de tejer Galga utiliza para elaborar su productos textiles?',
        [
          Option('Máquina de tejer Galga 3', 0),
          Option('Máquina de tejer Galga 6', 0),
          Option('Máquina de tejer Galga 8', 0),
          Option('Ninguna', 0),
        ],
        0,
        true,
        0,
        0,
      ),
      Question(
        '¿Qué tipo de Maquina de tejer utiliza?',
        [
          Option('Silver', 0),
          Option('Brother', 0),
          Option('Ninguna', 0),
          Option('Otros', 0),
        ],
        0,
        true,
        0,
        0,
      ),
      Question(
        '¿Cuál es el nivel de conocimiento que tiene de la operatividad de la máquina de tejer?',
        [
          Option('Básico', 1),
          Option('Intermedio', 3),
          Option('Avanzado', 6),
        ],
        0,
        true,
        0,
        6,
      ),
      Question(
        '¿Qué tipo de máquina remalladora utiliza?',
        [
          Option('Singer', 0),
          Option('Longxing', 0),
          Option('Ninguna', 0),
          Option('Otros', 0),
        ],
        0,
        true,
        0,
        0,
      ),
      Question(
        '¿Realiza la interpretación de Fichas técnicas?',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
        0,
        1,
      ),
      Question(
        '¿Con qué frecuencia realiza la interpretación de las fichas técnicas?',
        [
          Option('Siempre', 6),
          Option('A veces', 3),
          Option('Nunca', 0),
        ],
        0,
        false,
        1,
        6,
      ),
      Question(
        'Utiliza la tabla de tallas y medidas',
        [
          Option('Si', 1),
          Option('No', 0),
        ],
        0,
        true,
        0,
        1,
      ),
      Question(
        'Sobre la utilización de la tabla de tallas y medidas',
        [
          Option('Conozco pero no la utilizo', 0),
          Option('La utilice una vez', 1),
          Option('A veces la utilizo', 3),
          Option('Lo utilizo cuando tengo pedidos', 3),
          Option('Siempre la utilizo', 6),
        ],
        0,
        false,
        1,
        6,
      ),
      Question(
        'En la determinación de puntos y carreras. ¿Qué pasos desarrolla?',
        [
          Option('Muestra de tensión', 3),
          Option('Muestra de orientación', 3),
          Option('Fórmula de conversión', 3),
          Option('Desarrollo de hojas de trabajo', 3),
          Option('Ninguna', 0),
          Option('Todas las anteriores', 6),
        ],
        1,
        true,
        0,
        6,
      ),
      Question(
        '¿Qué técnicas de tejido utiliza para el desarrollo de sus productos textiles?',
        [
          Option('Jersey', 1),
          Option('Jarquard', 1),
          Option('Retenido', 1),
          Option('Deslizado', 1),
          Option('Calado', 1),
          Option('Intarsia', 1),
          Option('Ninguna', 0),
        ],
        1,
        true,
        0,
        6,
      ),
      Question(
        '¿Qué tipo(s) de control de calidad lleva a cabo?',
        [
          Option('Control de calidad en los materiales', 3),
          Option(
              'Control de calidad en el proceso de tejido de las prendas', 3),
          Option('Control de calidad al final de los acabados', 3),
        ],
        1,
        true,
        0,
        3,
      ),
      Question(
        'Qué tipo de acabado realiza para la unión de los paneles tejidos',
        [
          Option('Costura', 1),
          Option('Remallado', 1),
          Option('Ninguna', 0),
          Option('Costura y Remallado', 3),
        ],
        0,
        true,
        0,
        3,
      ),
    ],
  ),
];
