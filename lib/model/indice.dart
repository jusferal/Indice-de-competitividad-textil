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
            Option('Prendas Tejidas a Punto', 0),
            Option('Peletería', 0),
            Option('Tejido Plano en Telar', 0),
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
            Option('Otro (Especifique)', 1),
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
            Option('Otro (Especifique)', 1),
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
            Option('Otro (Especifique)', 1),
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
            Option('Otro (Especifique)', 1),
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
            Option('Otro (Especifique)', 1),
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
          Option('Otro (Especifique)', 0),
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
          Option('Otro (Especifique)', 0),
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
  Category(
    'Peletería',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          '¿Cuántos años de experiencia tiene en la técnica de peletería?',
          [
            Option('Menos de 1 año', 1),
            Option('Entre 1 y 3 años', 2),
            Option('Más de 3 años', 3),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Qué tipo de piel se utiliza comúnmente en la peletería de camélidos en Perú?',
          [
            Option('Alpaca', 1),
            Option('Ovino', 1),
            Option('Llama', 1),
            Option('Todas las anteriores', 2),
          ],
          1,
          true,
          0,
          2),
      Question(
          '¿Qué instrumento o maquina utiliza para eliminar los excesos de piel?',
          [
            Option('Cuchillo', 1),
            Option('Lata', 1),
            Option('Máquina', 2),
            Option('Otro (Especifique)', 1),
          ],
          0,
          true,
          0,
          2),
      Question(
          '¿De qué manera realiza el proceso de conservado de la piel o cuero?',
          [
            Option('Con sal', 0),
            Option('Al secado', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Qué productos desarrollan utilizando la técnica de peletería?',
          [
            Option('Chalinas y bufandas', 0),
            Option('Tapices y alfombras', 0),
            Option('Bolsos y carteras', 0),
          ],
          0,
          true,
          0,
          0),
    ],
  ),
  Category(
    'Tejido Plano en Telar',
    'Dimension Interna',
    'Gestión de Diseño y Desarrollo de Productos',
    [
      Question(
          '¿Cuántos años de experiencia tiene trabajando con el telar?',
          [
            Option('Menos de 1 año', 1),
            Option('Entre 1 y 3 años', 2),
            Option('Más de 3 años', 3),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Qué tipo de telar utiliza?',
          [
            Option('Telar de cintura', 0),
            Option('Telar de pedal', 0),
            Option('Telar vertical', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Conoce acerca del proceso torcido de hilos?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Aplica el proceso torcido de hilos para realizar los tejidos a telar?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          false,
          1,
          1),
      Question(
          '¿Cuál es el proceso inicial en la técnica de telar?',
          [
            Option('Diseño', 0),
            Option('Teñido', 0),
            Option('Selección de materiales', 0),
            Option('Armado del telar', 1),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Cómo se llama la herramienta utilizada para compactar y ajustar los hilos en el telar?',
          [
            Option('Peine', 1),
            Option('Heddle', 0),
            Option('Urdidor', 0),
            Option('Plegadera', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué es el proceso de urdido en el telar?',
          [
            Option('Teñido de los hilos', 1),
            Option('Preparación y colocación de los hilos en el telar', 0),
            Option('Armado final del tejido', 0),
            Option('Ninguna de las anteriores', 0),
          ],
          0,
          true,
          0,
          1),
    ],
  ),
  Category(
    'Gestión de Acabados Textiles',
    'Dimension Interna',
    'Gestión de Acabados Textiles',
    [
      Question(
          '¿Tiene conocimiento sobre los procesos de acabados textiles? (Lavado suavizado, siliconado, vaporizado)',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué tipo de procesos de acabados de la prenda, conoce?',
          [
            Option('Lavado', 1),
            Option('Suavizado ', 1),
            Option('Secado', 1),
            Option('Vaporizado', 1),
          ],
          1,
          false,
          1,
          3),
      Question(
          'Si conoce el tema de lavado de la prenda, ¿Qué insumos utiliza?',
          [
            Option('Detergente de ropa', 0),
            Option('Shampoo', 0),
            Option('Jabon', 0),
            Option('Detergente para lavar fibra', 0),
            Option('Otro (Especifique)', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          'Si conoce el tema de suavizado, ¿Qué insumos utiliza?',
          [
            Option('Suavizante comercial (Por ejemplo Suavitel)', 1),
            Option('Helphasoft', 2),
            Option('Otro (Especifique)', 1),
          ],
          0,
          false,
          1,
          1),
      Question(
          '¿Qué tipo de secado realiza?',
          [
            Option('Secado expuesto al sol', 0),
            Option('Secado en sombra', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿De que manera vaporiza la prenda?',
          [
            Option('Plancha vaporizadora', 0),
            Option('Otro (Especifique)', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Realizas algún tipo de teñido textil?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué tipo de teñido realiza?',
          [
            Option('Teñido industrial', 0),
            Option('Teñido artesanal (Plantas y químicos)', 0),
            Option('Teñidos natural (Uso de plantas, flores y raíces)', 0),
          ],
          1,
          true,
          2,
          0),
    ],
  ),
  Category(
    'Teñido industrial',
    'Dimension Interna',
    'Gestión de Acabados Textiles',
    [
      Question(
          '¿Hace cuánto tiempo se dedica a realizar el teñido industrial?',
          [
            Option('1 - 3 años', 1),
            Option('4 - 7 años', 2),
            Option('Mas de 7 años', 3),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Qué tipo de procesos de acabados de la prenda, conoce?',
          [
            Option('Lavado', 1),
            Option('Suavizado ', 1),
            Option('Secado', 1),
            Option('Vaporizado', 1),
          ],
          1,
          false,
          1,
          3),
      Question(
          '¿Qué insumos utiliza para realizar el teñido?',
          [
            Option('Helphasoft', 1),
            Option('Igualantes', 1),
            Option('Sal textil', 1),
            Option('ácidos', 1),
            Option('Colorantes', 1),
          ],
          1,
          true,
          0,
          3),
      Question(
          '¿Qué dificultades presenta al momento de realizar el teñido?',
          [
            Option('Color no uniforme', 0),
            Option('Contrastes bajos', 0),
            Option('Color no deseado', 0),
            Option('Sangrado excesivo', 0),
            Option('Otro (Especifique)', 0),
          ],
          0,
          true,
          0,
          0),
    ],
  ),
  Category(
    'Teñido artesanal (Plantas y químicos)',
    'Dimension Interna',
    'Gestión de Acabados Textiles',
    [
      Question(
          '¿Hace cuánto tiempo se dedica a realizar el teñido artesanal?',
          [
            Option('1 - 3 años', 1),
            Option('4 - 7 años', 2),
            Option('Mas de 7 años', 3),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Qué insumos y plantas utiliza para el teñido?',
          [
            Option('ácido cítrico', 1),
            Option('Cochinilla ', 1),
            Option('Alumbre', 1),
            Option('Soda caucica', 1),
            Option('Otro (Especifique)', 1),
          ],
          1,
          false,
          1,
          3),
      Question(
          '¿Qué dificultades presenta al momento de realizar el teñido?',
          [
            Option('Color no uniforme', 0),
            Option('Contrastes bajos', 0),
            Option('Color no deseado', 0),
            Option('Sangrado excesivo', 0),
            Option('Otro (Especifique)', 0),
          ],
          1,
          true,
          0,
          3),
    ],
  ),
  Category(
    'Teñidos natural (Uso de plantas, flores y raíces)',
    'Dimension Interna',
    'Gestión de Acabados Textiles',
    [
      Question(
          '¿Hace cuánto tiempo se dedica a realizar el teñido natural?',
          [
            Option('1 - 3 años', 1),
            Option('4 - 7 años', 2),
            Option('Mas de 7 años', 3),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Qué plantas utiliza para realizar el teñido?',
          [
            Option('-', 0),
          ],
          2,
          true,
          0,
          0),
      Question(
          '¿Qué tipo de mordientes utiliza?',
          [
            Option('Orina', 1),
            Option('Limon', 1),
            Option('Ceniza', 1),
            Option('Otro (Especifique)', 1),
          ],
          1,
          true,
          0,
          3),
      Question(
          '¿Qué dificultades presenta al momento de realizar el teñido?',
          [
            Option('Color no uniforme', 0),
            Option('Contrastes bajos', 0),
            Option('Color no deseado', 0),
            Option('Sangrado excesivo', 0),
            Option('Otro (Especifique)', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Qué tipo de teñido le gustaría aprender?',
          [
            Option('Teñido industrial', 0),
            Option('Teñido artesanal (Plantas y químicos)', 0),
            Option('Color no deseado', 0),
            Option('Teñidos natural', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Qué controles de calidad conoce en la  fase de hilado de alpaca? (Marque más de una laternativa?',
          [
            Option('Finura o diametro de la fibra', 2),
            Option('Medulación', 2),
            Option('Otro (Especifique)', 1),
          ],
          1,
          true,
          0,
          3),
      Question(
          '¿Qué controles de calidad de la fibra de alpaca conoce? (Marque más de una laternativa?',
          [
            Option('Torsión', 1),
            Option('Solidez al frote en húmedo', 1),
            Option('Solidez al frote en seco', 1),
            Option('Solidez al lavado', 1),
          ],
          1,
          true,
          0,
          3),
    ],
  ),
  Category(
    'Gestión de la Comercialización',
    'Dimension Interna',
    'Gestión de la Comercialización',
    [
      Question(
          '¿Su empresa cuenta con un modelo de negocio definido?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Su propuesta de valor esta enfocada en?',
          [
            Option('El producto', 0),
            Option('El proceso productivo', 0),
            Option('En la comeracialización', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Qué tipo de modelo comercial maneja su empresa?',
          [
            Option('B2B (Empresa a Empresa)', 0),
            Option('B2C (Empresa a Consumidor)', 0),
            Option('B2G (Empresa a Gobierno)', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Realiza el uso de alguna herramienta para gestionar las finanzas de su negocio? (registro de gastos e ingresos)',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué herramientas o recursos utilizas para gestionar las finanzas de su negocio?',
          [
            Option('Software de contabilidad o aplicaciones financieras', 3),
            Option('Registros manuales en papel o un cuaderno', 2),
            Option('Registro en una plantilla de Excel', 2),
            Option('En un cuaderno', 1),
          ],
          0,
          false,
          1,
          3),
      Question(
          '¿Cómo calcula los costos de producción de sus productos textiles?',
          [
            Option(
                'Registro detallado de todos los gastos de materiales y mano de obra',
                2),
            Option('Estimación basada en los costos promedio del mercado', 1),
            Option(
                'No tengo un método establecido para calcular los costos de producción',
                0),
            Option('Otro (Especifique)', 1),
          ],
          1,
          true,
          0,
          3),
      Question(
          '¿Qué estrategia(s) utiliza para fijar los precios de sus productos textiles?',
          [
            Option('Basado en el costo de la materia prima', 1),
            Option(
                'Basado en los costos de producción más un margen de ganancia deseado',
                3),
            Option('Según el precio de mercado de productos similares', 2),
            Option('Basado en la percepción de valor por parte del cliente', 1),
            Option('No se cómo fijar precios adecuados', 0),
            Option('Otro (Especifique)', 1),
          ],
          1,
          true,
          0,
          3),
      Question(
          '¿Realizas el cálculo del margen de ganancia en la venta de sus productos textiles?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Cómo calculas el margen de ganancia en la venta de sus productos textiles?',
          [
            Option('Restando el costo de producción al precio de venta', 1),
            Option(
                'Estableciendo un porcentaje fijo sobre el costo de producción',
                3),
            Option('Otro (Especifique)', 1),
          ],
          1,
          true,
          0,
          3),
      Question(
          '¿Conoce cuantos productos debería vender al mes para cubrir tus costos y tener un margen de ganancia?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Qué componentes consideras al calcular el punto de equilibrio de venta?',
          [
            Option('Costos fijos', 1),
            Option('Costos variables', 1),
            Option('Precio de venta', 1),
            Option('Todas las anteriores', 3),
          ],
          1,
          false,
          1,
          3),
      Question(
          '¿Cómo utilizas la información del punto de equilibrio de venta en la gestión de su negocio?',
          [
            Option('Para establecer metas de ventas realistas', 0),
            Option('Para evaluar la viablidad de lanzar nuevos productos', 0),
            Option('Para identificar areas de mejora', 0),
            Option('No estoy seguro(a)', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Cuál es su nivel de ventas mensual?',
          [
            Option('No estoy seguro(a)', 0),
            Option('S/0 - S/1 000', 1),
            Option('S/1 001 - S/5 000', 2),
            Option('S/5 001 - S/8 000', 3),
            Option('S/8 001 - S/10 000', 4),
            Option('Más de S/20 000', 5),
          ],
          0,
          true,
          0,
          5),
      Question(
          '¿Qué cantidad de productos textiles elabora al mes?',
          [
            Option('1 - 10 unidades', 1),
            Option('11 - 50 unidades', 2),
            Option('50 - 100 unidades', 3),
            Option('Más de 100 unidades', 3),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Qué cantidad de productos textiles vende al mes?',
          [
            Option('1 - 10 unidades', 1),
            Option('11 - 50 unidades', 2),
            Option('50 - 100 unidades', 3),
            Option('Más de 100 unidades', 4),
          ],
          0,
          true,
          0,
          4),
      Question(
          '¿Qué canales utiliza actualmente para promocionar y vender sus productos textiles?',
          [
            Option('Presencial (tiendas físicas)', 0),
            Option('Digital (Redes sociales, market place, ecommerce)', 1),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué canales utiliza actualmente para promocionar y vender sus productos textiles?',
          [
            Option('Venta directa en ferias locales', 1),
            Option('Venta directa en ferias regionales', 1),
            Option('Venta directa en ferias nacionales', 2),
            Option('Venta en tiendas especializadas individual', 3),
            Option('Venta en tiendas departamentales', 2),
            Option('Otros (especificar)', 1),
          ],
          1,
          false,
          1,
          3),
      Question(
          '¿Qué canales digitales utiliza actualmente para promocionar y vender sus productos textiles?',
          [
            Option('Venta en Redes sociales', 1),
            Option('Venta en un MarketPlace', 2),
            Option('Venta por un E-commerce', 3),
            Option('Venta en Redes de negocio', 2),
            Option('Otros (especificar)', 1),
          ],
          1,
          false,
          1,
          3),
      Question(
          '¿Quién(es) son los consumidores principales de sus productos textiles?',
          [
            Option('Comprador final', 2),
            Option('Comprador intermediario', 1),
          ],
          0,
          true,
          0,
          2),
      Question(
          '¿Cuál es el enfoque principal para la distribución y venta de sus productos textiles?',
          [
            Option('Venta directa al consumidor', 0),
            Option('Venta a intermediarios o mayoristas', 0),
            Option('Venta a través de tiendas locales', 0),
            Option('Venta a traves de plataformas de comercio electrónico', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Su empresa cuenta con una Marca?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          'Su Marca se encuentran registrado en INDECOPI',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          false,
          1,
          1),
      Question(
          '¿En qué año registro su marca?',
          [
            Option('-', 0),
          ],
          2,
          false,
          1,
          0),
      Question(
          '¿Qué estrategias utiliza para promover sus productos textiles?',
          [
            Option('Redes sociales (Facebook, Instagram, etc.)', 3),
            Option('Ferias y eventos locales', 1),
            Option('Tienda física propia', 2),
            Option('Otros (especificar)', 1),
            Option('Ninguna', 0),
          ],
          2,
          false,
          1,
          0),
    ],
  ),
  Category(
    'Gestión de Finanzas',
    'Dimension Interna',
    'Gestión de Finanzas',
    [
      Question(
          '¿Alguna vez accedio a un crédito financiero?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿De que tipo de institución financiera accedio al crédito?',
          [
            Option('Caja Municipal', 0),
            Option('Caja Rural', 0),
            Option('Cooperativa', 0),
            Option('Banco', 0),
            Option('Otro (Especifique)', 0),
          ],
          1,
          true,
          0,
          0),
    ],
  ),
  Category(
    'Gestión de la Tributación',
    'Dimension Interna',
    'Gestión de la Tributación',
    [
      Question(
          '¿Conoce que es un “Tributo”?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué entiende por Tributo?',
          [
            Option(
                'a) Un descuento en los precios de los insumos para los emprendedores textiles',
                0),
            Option(
                'b) Un impuesto que deben pagar las unidades productivas a la autoridad tributaria.',
                1),
            Option(
                'c) Un subsidio otorgado por el gobierno para fomentar la producción textil.',
                0),
            Option(
                'd) Un incentivo fiscal para las asociaciones de artesanos en la industria textil.',
                0),
          ],
          0,
          false,
          1,
          1),
      Question(
          '¿Conoce cuál es la entidad encargada de fiscalizar y controlar el cumplimiento de las obligaciones tributarias de las unidades productivas en Perú?',
          [
            Option(
                'a) SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)',
                1),
            Option(
                'b) INDECOPI (Instituto Nacional de Defensa de la Competencia y de la Protección de la Propiedad Intelectual)',
                0),
            Option(
                'c) MINCETUR (Ministerio de Comercio Exterior y Turismo)', 0),
            Option('d) MINAGRI (Ministerio de Agricultura y Riego)', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Cónoce que tipo de impuestos pagan las empresas en Perú?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Cuáles son los impuestos que pagan las empresas en Perú?',
          [
            Option(
                'a) Impuesto a la renta y el Impuesto General a las Ventas (IGV).',
                1),
            Option('b) Impuesto predial y municipalidad.', 0),
            Option('c) Impuesto a la herencia y donaciones.', 0),
            Option(
                'd) Ninguno, las empresas textiles están exentas de impuestos.',
                0),
          ],
          0,
          false,
          1,
          1),
      Question(
          '¿Cónoce que tipo de impuestos pagan las empresas en Perú?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué es el Impuesto a la Renta y cuál es su función?',
          [
            Option(
                'a) Es un impuesto extra que se paga a la municipalidad.', 0),
            Option(
                'b) Es un impuesto sobre las ganancias que genera un negocio.',
                1),
            Option('c) Es un tributo que se paga por tener un local.', 0),
            Option('d) Es un impuesto opcional para las empresas.', 0),
          ],
          0,
          false,
          1,
          1),
      Question(
          '¿Qué se entiende por "comprobante de pago" en el ámbito tributario?',
          [
            Option(
                'a) Un documento que respalda una transacción comercial.', 1),
            Option('b) Un formulario para declarar los impuestos.', 0),
            Option('c) Un recibo de sueldo para los empleados.', 0),
            Option('d) No tiene relación con los impuestos.', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Cuáles son los comprobantes de pago que existen?',
          [
            Option(
                'a) Factura, boleta de venta, Recibo por honorarios y Guía de Remisión.',
                1),
            Option('b) Recibo por honorarios, Tickets de máquinas', 0),
            Option('c) Boleta de venta, Proforma de venta', 0),
            Option(
                'd) Factura, boleta de venta, Guía de remisión y Proforma de venta',
                0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué es un régimen tributario?',
          [
            Option('a) Un sistema para pagar impuestos en otras monedas.', 0),
            Option(
                'b) Un conjunto de normas para el pago de impuestos según la actividad económica.',
                1),
            Option('c) Un servicio público gratuito.', 0),
            Option('d) Un tipo de seguro para empresas.', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Conoce cuántos regímenes tributarios existen en Perú?',
          [
            Option('a) 2', 0),
            Option('b) 3', 0),
            Option('c) 4', 1),
            Option('d) 5', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Conoce cuál de los siguientes regímenes tributarios está dirigido principalmente a las micro y pequeñas empresas en Perú?',
          [
            Option('a) Régimen General', 0),
            Option('b) Régimen MYPE Tributario', 0),
            Option('c) Régimen Especial del Impuesto a la Renta', 0),
            Option('d) Nuevo Régimen Único Simplificado', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Conoce qué impuestos deben pagar todas las empresas en Perú, independientemente del régimen tributario?',
          [
            Option(
                'a) Impuesto a la Renta y Contribución al Seguro Social de Salud (ESSALUD).',
                1),
            Option(
                'b) Impuesto General a las Ventas (IGV) y Contribución al Seguro Social de Salud (ESSALUD).',
                0),
            Option(
                'c) Impuesto a los Activos Financieros (IAF) y Contribución al Seguro Social de Salud (ESSALUD).',
                0),
            Option('d) Ninguna de las anteriores.', 0),
          ],
          0,
          true,
          0,
          1),
    ],
  ),
  Category(
    'Educación',
    'Dimension Externa',
    'Educación',
    [
      Question(
          '¿Cuál es tu nivel educativo alcanzado?',
          [
            Option('a) Sin educación', 0),
            Option('b) Educación primaria incompleta', 1),
            Option('c) Educación primaria completa', 2),
            Option('d) Educación secundaria incompleta', 3),
            Option('e) Educación secundaria completa', 4),
            Option('f) Educación técnica o superior', 5),
          ],
          0,
          true,
          0,
          5),
      Question(
          '¿Existe infraestructura educativa en tu comunidad?',
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
    'Transporte',
    'Dimension Externa',
    'Transporte',
    [
      Question(
          '¿Qué tipo de carretera es más común en la ruta hacia la comunidad de la unidad productiva de camélidos?',
          [
            Option('a) Asfaltada', 0),
            Option('b) De tierra', 0),
            Option('c) Pavimentada', 0),
            Option('d) Otro (especificar)', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Cuánto tiempo en promedio tardan los trabajadores en llegar desde la ciudad más cercana a la comunidad?',
          [
            Option('a) Menos de 30 minutos', 4),
            Option('b) Entre 30 minutos y 1 hora', 3),
            Option('c) Entre 1 y 2 horas', 2),
            Option('d) Más de 2 horas', 1),
          ],
          0,
          true,
          0,
          4),
      Question(
          '¿Qué importancia tiene la ubicación geográfica de la unidad productiva en relación con los principales mercados de destino?',
          [
            Option(
                'a) Impacta directamente en los tiempos de entrega y costos de transporte',
                0),
            Option('b) No tiene relevancia para la competitividad', 0),
            Option('c) Aumenta los costos de producción', 0),
            Option('d) Facilita la competencia con otras empresas', 0),
          ],
          0,
          true,
          0,
          0),
      Question(
          '¿Qué impacto tiene el estado de las carreteras en el transporte de productos textiles de la unidad productiva?',
          [
            Option('a) Puede causar retrasos y daños en la mercancía', 1),
            Option('b) No afecta la competitividad', 0),
            Option('c) Reduce los costos de transporte', 0),
            Option('d) Mejora la eficiencia logística', 0),
          ],
          0,
          true,
          0,
          1),
    ],
  ),
  Category(
    'Telecomunicaciones',
    'Dimension Externa',
    'Telecomunicaciones',
    [
      Question(
          '¿Qué tipo de cobertura de red de telecomunicaciones tiene disponible en su comunidad/ lugar de residencia?',
          [
            Option('a) Cobertura 4G/5G', 3),
            Option('b) Cobertura 3G', 2),
            Option('c) Cobertura 2G', 1),
            Option('d) Sin cobertura de red', 0),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Qué tipo de acceso a internet es más comúnmente utilizado en su comunoidad/  local de residencia?',
          [
            Option('a) Internet de banda ancha fija', 2),
            Option('b) Internet móvil (3G/4G)', 2),
            Option('c) Internet satelital', 1),
            Option('d) No se cuenta con acceso a internet', 0),
          ],
          1,
          true,
          0,
          3),
      Question(
          '¿Cómo utiliza los dispositivos electrónicos en su día a día y la actividad económica que realiza?',
          [
            Option('a) Para comunicarse con clientes y proveedores', 2),
            Option(
                'b) Para acceder a información y realizar tareas en línea', 2),
            Option(
                'c) No utilizan dispositivos electrónicos para el desarrollo de su  actividad económica.',
                0),
            Option('d) Solo para fines personales', 1),
          ],
          1,
          true,
          0,
          3),
    ],
  ),
  Category(
    'Salud',
    'Dimension Externa',
    'Salud',
    [
      Question(
          '¿Existe una infraestructura de salud en tu comunidad que brinde atención médica?',
          [
            Option(
                'a) Sí, contamos con centros de salud cercanos y accesibles.',
                2),
            Option('b) Sí, pero la infraestructura de salud es limitada.', 1),
            Option(
                'c) No, debemos desplazarnos a otras localidades para recibir atención médica.',
                0),
            Option('d) Otro (especificar)', 1),
          ],
          0,
          true,
          0,
          2),
      Question(
          '¿Cuál es la frecuencia que reciben atención médica preventiva?',
          [
            Option('a) Regularmente, al menos una vez al año.', 3),
            Option(
                'b) Ocasionalmente, dependiendo de la disponibilidad de servicios de salud.',
                2),
            Option(
                'c) Raramente, debido a la falta de acceso a servicios de salud.',
                1),
            Option('d) No reciben atención médica preventiva.', 0),
          ],
          0,
          true,
          0,
          3),
      Question(
          '¿Se encuentra afiliado al Seguro Integral de Salud (SIS)?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Realiza uso de su Seguro Integral de Salud (SIS)?',
          [
            Option('Si', 1),
            Option('No', 0),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Con qué frecuencia hace uso de su Seguro Integral de Salud (SIS)?',
          [
            Option('Mensual', 4),
            Option('4 veces al año', 3),
            Option('2 veces al año', 2),
            Option('1 vez al año', 1),
          ],
          0,
          true,
          0,
          4),
    ],
  ),
  Category(
    'Agua y Saneamiento',
    'Dimension Externa',
    'Agua y Saneamiento',
    [
      Question(
          '¿Tienes acceso a agua potable en su hogar/comunidad?',
          [
            Option('a) Sí, siempre tengo acceso a agua potable.', 2),
            Option('b) A veces, el acceso es limitado o intermitente.', 1),
            Option(
                'c) No, no tengo acceso a agua potable de forma regular.', 0),
            Option('d) Otro (especificar)', 1),
          ],
          0,
          true,
          0,
          2),
      Question(
          '¿Cómo calificarías la calidad del agua que utilizas para tus actividades diarias?',
          [
            Option('a) Buena, el agua es segura y apta para el consumo.', 2),
            Option(
                'b) Regular, a veces presenta problemas de turbidez o sabor.',
                1),
            Option(
                'c) Mala, el agua es contaminada y no se puede consumir directamente.',
                0),
          ],
          0,
          true,
          0,
          2),
      Question(
          '¿Dispones de instalaciones adecuadas de saneamiento, como baños o letrinas, en tu comunidad o lugar de trabajo?',
          [
            Option(
                'a) Sí, contamos con instalaciones de saneamiento adecuadas.',
                2),
            Option('b) Algunas personas tienen acceso, pero no todos.', 1),
            Option(
                'c) No, la mayoría carece de instalaciones de saneamiento.', 0),
          ],
          0,
          true,
          0,
          2),
      Question(
          '¿Tiene su hogar y/o comunidad acceso a instalaciones adecuadas de saneamiento, como baños y sistemas de alcantarillado?',
          [
            Option(
                'a) Sí, contamos con baños y sistemas de alcantarillado adecuados.',
                2),
            Option(
                'b) Tenemos baños, pero el sistema de alcantarillado es deficiente.',
                1),
            Option('c) No tenemos baños ni sistema de alcantarillado adecuado.',
                0),
          ],
          0,
          true,
          0,
          2),
    ],
  ),
  Category(
    'G. Ambiental Emprendedor',
    'Dimension Externa',
    'Gestión Ambiental',
    [
      Question(
          '¿Qué entiende usted por gestión ambiental en el contexto de su trabajo como artesano/a?',
          [
            Option(
                'Actividades destinados a minimizar el impacto negativo de las actividades humanas en el medio ambiente y promover el uso sostenible de los recursos naturales.',
                2),
            Option(
                'Cuidar los recursos naturales como el agua y los bosques.', 1),
            Option('No estoy seguro/a de lo que significa', 0),
            Option('Otra respuesta (especificar).', 1),
          ],
          0,
          true,
          0,
          2),
      Question(
          '¿Qué prácticas realiza su hogar o con su actividad económica para cuidar el medio ambiente?',
          [
            Option('a) Separamos los residuos sólidos para su reciclaje.', 1),
            Option('b) Reutilizamos materiales en la fabricación de productos.',
                1),
            Option('c) Reducimos el consumo de agua y energía.', 1),
            Option('d) Ninguna de las anteriores.', 0),
          ],
          0,
          true,
          0,
          2),
      Question(
          '¿Su comunidad o lugar de residencia cuenta con un sistema de recolección de residuos sólidos?',
          [
            Option(
                'a) Sí, contamos con un servicio regular de recolección.', 2),
            Option('b) A veces, el servicio de recolección es irregular.', 1),
            Option('c) No, no tenemos servicio de recolección de residuos.', 0),
          ],
          0,
          true,
          0,
          2),
      Question(
          '¿Qué acciones específicas toma para reducir el impacto ambiental en su proceso de producción textil?',
          [
            Option('Uso de tintes naturales y orgánicos', 1),
            Option('Reciclaje de materiales y residuos', 1),
            Option('Reducción de consumo de agua y energía eléctrica', 1),
            Option('No realizo ninguna acción', 0),
          ],
          1,
          true,
          0,
          2),
          Question(
          'En tu proceso de producción textil, ¿Qué técnicas ancestrales utilizas para reducir el impacto ambiental?',
          [
            Option('Pastoreo rotativo para preservar la vegetación natural', 1),
            Option('Teñido natural con plantas y minerales locales/ de la zona', 1),
            Option('Uso de técnicas de tejido tradicional (Away, telar)', 1),
            Option('Otros (especificar)', 1),
            Option('No utilizo ninguna técnica ancestral', 0),
          ],
          1,
          true,
          0,
          2),
    ],
  ),
  Category(
    'G. Ambiental Asociacion/Cooperativa',
    'Dimension Externa',
    'Gestión Ambiental',
    [
      Question(
          '¿Qué entiende por gestión ambiental en el contexto de su trabajo como artesano/a dentro de su Asociación o cooperativa?',
          [
            Option(
                'Actividades destinados a minimizar el impacto negativo de las actividades humanas en el medio ambiente y promover el uso sostenible de los recursos naturales.',
                2),
            Option(
                'Cuidar los recursos naturales como el agua y los bosques.', 1),
            Option('No estoy seguro/a de lo que significa', 0),
            Option('Otra respuesta (especificar).', 1),
          ],
          1,
          true,
          0,
          2),
      Question(
          'En tu empresa utilizas estrategias de sensibilización para sus clientes acerca de la importancia de la sostenibilidad ambiental?',
          [
            Option('Si', 1),
            Option('No',
                1),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué prácticas realiza su asociación para cuidar el medio ambiente?',
          [
            Option(
                'a) Separamos los residuos sólidos para su reciclaje.', 1),
            Option('b) Reutilizamos materiales en la fabricación de productos.', 1),
            Option('c) Reducimos el consumo de agua y energía.', 1),
            Option('d) Ninguna de las anteriores.', 0),
          ],
          0,
          false,
          1,
          2),
      Question(
          '¿Su Asociación u Cooperativa cuenta con un sistema de recolección de residuos sólidos?',
          [
            Option('a) Sí, contamos con un servicio regular de recolección.', 0),
            Option('b) A veces, el servicio de recolección es irregular.', 0),
            Option('c) No, no tenemos servicio de recolección de residuos.', 0),
            Option('No realizo ninguna acción', 0),
          ],
          0,
          true,
          0,
          0),
          Question(
          '¿Qué acciones específicas se toman en su Asociación y/o Cooperativa para reducir el impacto ambiental en su proceso de producción textil?',
          [
            Option('Uso de tintes naturales y orgánicos', 0),
            Option('Reciclaje de materiales y residuos', 0),
            Option('Reducción de consumo de agua y energía eléctrica', 0),
            Option('No realizo ninguna acción', 0),
          ],
          1,
          true,
          0,
          0),
          Question(
          'En su proceso de producción textil, ¿Qué técnicas ancestrales utilizan para reducir el impacto ambiental?',
          [
            Option('Re uso de mermas', 0),
            Option('Teñido natural con plantas y minerales locales de la zona', 0),
            Option('Uso de técnicas de tejido tradicional (Away, telar)', 0),
            Option('Otros (especificar)', 0),
          ],
          1,
          true,
          0,
          0),
           Question(
          '¿Qué estrategias aplica para sensibilizar a tu comunidad y clientes sobre la importancia de la gestión ambiental en la producción textil?',
          [
            Option('Organización de talleres y eventos educativos sobre prácticas sostenibles', 0),
            Option('Creación de campañas de sensibilización en redes sociales y medios locales', 0),
            Option('Inclusión de información sobre la sostenibilidad en el etiquetado y marketing de sus productos textiles', 0),
            Option('Ninguna estrategia', 0),
          ],
          0,
          true,
          0,
          0),
    ],
  ),
  Category(
    'G. Ambiental Empresa',
    'Dimension Externa',
    'Gestión Ambiental',
    [
      Question(
          '¿Qué entiende usted por gestión ambiental en el contexto de su trabajo como artesano/a?',
          [
            Option(
                'Actividades destinados a minimizar el impacto negativo de las actividades humanas en el medio ambiente y promover el uso sostenible de los recursos naturales.',
                2),
            Option(
                'Cuidar los recursos naturales como el agua y los bosques.', 1),
            Option('No estoy seguro/a de lo que significa', 0),
            Option('Otra respuesta (especificar).', 1),
          ],
          1,
          true,
          0,
          2),
      Question(
          'En tu empresa utilizas estrategias de sensibilización para sus clientes acerca de la importancia de la sostenibilidad ambiental?',
          [
            Option('Si', 1),
            Option('No',
                1),
          ],
          0,
          true,
          0,
          1),
      Question(
          '¿Qué prácticas realiza su asociación para cuidar el medio ambiente?',
          [
            Option(
                'a) Separamos los residuos sólidos para su reciclaje.', 1),
            Option('b) Reutilizamos materiales en la fabricación de productos.', 1),
            Option('c) Reducimos el consumo de agua y energía.', 1),
            Option('d) Ninguna de las anteriores.', 0),
          ],
          0,
          false,
          1,
          2),
      Question(
          '¿Su Asociación u Cooperativa cuenta con un sistema de recolección de residuos sólidos?',
          [
            Option('a) Sí, contamos con un servicio regular de recolección.', 0),
            Option('b) A veces, el servicio de recolección es irregular.', 0),
            Option('c) No, no tenemos servicio de recolección de residuos.', 0),
            Option('No realizo ninguna acción', 0),
          ],
          0,
          true,
          0,
          0),
          Question(
          '¿Qué acciones específicas se toman en su Asociación y/o Cooperativa para reducir el impacto ambiental en su proceso de producción textil?',
          [
            Option('Uso de tintes naturales y orgánicos', 0),
            Option('Reciclaje de materiales y residuos', 0),
            Option('Reducción de consumo de agua y energía eléctrica', 0),
            Option('No realizo ninguna acción', 0),
          ],
          1,
          true,
          0,
          0),
          Question(
          'En su proceso de producción textil, ¿Qué técnicas ancestrales utilizan para reducir el impacto ambiental?',
          [
            Option('Re uso de mermas', 0),
            Option('Teñido natural con plantas y minerales locales de la zona', 0),
            Option('Uso de técnicas de tejido tradicional (Away, telar)', 0),
            Option('Otros (especificar)', 0),
          ],
          1,
          true,
          0,
          0),
           Question(
          '¿Qué estrategias aplica para sensibilizar a tu comunidad y clientes sobre la importancia de la gestión ambiental en la producción textil?',
          [
            Option('Organización de talleres y eventos educativos sobre prácticas sostenibles', 0),
            Option('Creación de campañas de sensibilización en redes sociales y medios locales', 0),
            Option('Inclusión de información sobre la sostenibilidad en el etiquetado y marketing de sus productos textiles', 0),
            Option('Ninguna estrategia', 0),
          ],
          0,
          true,
          0,
          0),
    ],
  ),
];
