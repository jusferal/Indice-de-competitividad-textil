import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ict/model/indice.dart';
import 'package:ict/results.dart';
import 'package:ict/widgets/CustomCheckboxListTile.dart';
import 'package:ict/widgets/CustomInputFormField.dart';
import 'package:ict/widgets/customRadioListTile.dart';
import 'dart:collection';

import 'package:supabase_flutter/supabase_flutter.dart';

class NextForm extends StatefulWidget {
  final List<Category> categories;
  final String id;
  final String name;
  final int code;
  final Map<int, Map<String, dynamic>> globalAnswers;
  final int indexCategories;
  final Set<Item> used;
  final String document;
  final List<String> activity;
  final String organization;
  const NextForm(
      {super.key,
      required this.categories,
      required this.id,
      required this.name,
      required this.code,
      required this.globalAnswers,
      required this.indexCategories,
      required this.used,
      required this.document,
      required this.activity,
      required this.organization});

  @override
  State<NextForm> createState() => _NextFormState();
}

class _NextFormState extends State<NextForm> {
  Map<int, Map<String, dynamic>> answers = {};
  Map<int, TextEditingController> textEditingControllerMap = {};
  late Category category;
  @override
  void initState() {
    super.initState();
    print('respuestas');
    widget.globalAnswers.forEach((index, answer) {
      print(answer);
    });
    if (widget.categories.isNotEmpty) {
      category = widget.categories[widget.indexCategories];
    } else {
      Navigator.pop(context); // No hay más categorías, regresar
    }
    for (var i = 0; i < category.questions.length; i++) {
      bool isOtherOption = category.questions[i].options
          .any((option) => option.typeOption == 'otro');

      if (isOtherOption || category.questions[i].typeWidget == 'edit') {
        textEditingControllerMap[i] = TextEditingController();
      }
    }
    print(widget.indexCategories);
    print('despues');
    widget.categories.forEach((elemento) {
      print(elemento.name);
    });
    widget.used.forEach((elemento) {
      print(elemento.name);
    });
  }

  bool isLoading = false;
  Future<void> gettingNewxtCategories() async {
    setState(() {
      isLoading = true; // Inicia la carga
    });
    try {
      if (allQuestionsAnswered()) {
        Map<String, Category> categoriesMap = getCategories();
        int newCode = 0;
        for (var i = 0; i < category.questions.length; i++) {
          if (category.questions[i].behavior != 'launcher' &&
              category.questions[i].behavior != 'hiddenLauncher') continue;
          if (!answers.containsKey(i)) continue;
          final options;
          if (answers[i]?['response'] is String) {
            options = [answers[i]?['response']];
          } else {
            options = answers[i]?['response'];
          }
          List<String> val = [
            'Prendas Tejidas a Punto',
            'Peletería',
            'Tejido Plano en Telar',
            'Prendas',
            'Accesorios',
            'DecoHome',
            'Teñido industrial',
            'Teñido artesanal (Plantas y químicos)',
            'Teñidos natural (Uso de plantas, flores y raíces)',
          ];
          for (final option in options) {
            if (!categoriesMap.containsKey(option)) continue;
            for (final v in val) {
              if (option != v || !categoriesMap.containsKey(v)) continue;
              if (option == 'Prendas Tejidas a Punto') newCode = 1;
              if (option == 'Peletería') newCode = 2;
              if (option == 'Tejido Plano en Telar') newCode = 3;
              setState(() {
                Item val =
                    new Item(name: option, prevIndex: widget.indexCategories);
                Set<String> values = {};
                widget.used.forEach((element) {
                  if (element.prevIndex == widget.indexCategories) {
                    values.add(element.name);
                  }
                });
                if (!widget.used.contains(val)) {
                  widget.categories.insert(
                      widget.indexCategories + 1, categoriesMap[option]!);
                  widget.used.add(val);
                }
              });
            }
          }
        }
        await saveDataToSupabase();
        await saveAnswers();
        if (widget.indexCategories + 1 < widget.categories.length) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NextForm(
                categories: widget.categories,
                id: widget.id,
                name: widget.name,
                code: newCode != 0 ? newCode : widget.code,
                globalAnswers: widget.globalAnswers,
                indexCategories: widget.indexCategories + 1,
                used: widget.used,
                document: widget.document,
                activity: widget.activity,
                organization: widget.organization,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => new Results(
                id: widget.id,
                name: widget.name,
                code: newCode != 0 ? newCode : widget.code,
                answeres: widget.globalAnswers,
                document: widget.document,
                activity: widget.activity,
                organization: widget.organization,
              ),
            ),
          );
        }
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Ocurrió un error: $e'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false; // Finaliza la carga
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 122, 51, 129),
          automaticallyImplyLeading: true,
          title: Center(
            child: Text(
              category.variable,
              style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        body: Stack(
          children: [
            Form(
              child: Column(
                children: [
                  if (category.name != category.variable)
                    Center(
                      child: Text(
                        category.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                        itemCount: category.questions.length,
                        itemBuilder: (context, index) {
                          final question = category.questions[index];
                          switch (question.typeWidget) {
                            case 'unique':
                              return Visibility(
                                  visible: question.isVisible,
                                  child: buildRadioListTile(question, index));
                            case 'multiple':
                              return Visibility(
                                  visible: question.isVisible,
                                  child:
                                      buildCheckboxListTile(question, index));
                            case 'edit':
                              return Visibility(
                                  visible: question.isVisible,
                                  child: buildTextFormField(question, index));
                            default:
                              return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          label: const Text(
                            'Anterior',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(166, 134, 13, 108),
                            elevation: 3,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            if (allQuestionsAnswered()) {
                              await gettingNewxtCategories();
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'Por favor, responda todas las preguntas antes de continuar.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          icon: const Icon(Icons.arrow_forward,
                              color: Colors.white),
                          label: const Text(
                            'Siguiente',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(166, 134, 13, 108),
                            elevation: 3,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isLoading)
              Container(
                color: Colors.black45,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
        
      ),
    );
  }

  Future<void> saveAnswers() async {
    for (var entry in answers.entries) {
      widget.globalAnswers[entry.value['idQuestion']] = entry.value;
    }
  }

  String _formatTwoDigits(int num) {
    return num.toString().padLeft(2, '0');
  }

  Future<void> saveDataToSupabase() async {
    final client = Supabase.instance.client;

    DateTime now = DateTime.now();
    String fechaFormateada =
        "${now.year}-${_formatTwoDigits(now.month)}-${_formatTwoDigits(now.day)}";
    for (final answer in answers.values) {
      answer['user'] = widget.id;
      answer['nameUser'] = widget.name;
      answer['date'] = fechaFormateada;
      await client.from('Respuestas').insert(answer);
    }
  }

  bool allQuestionsAnswered() {
    for (int i = 0; i < category.questions.length; i++) {
      if (category.questions[i].isVisible &&
          (answers[i] == null ||
              answers[i]?['response'] == null ||
              answers[i]?['response'].isEmpty)) {
        return false;
      }
    }
    return true;
  }

  Widget buildRadioListTile(Question question, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.text),
          Column(
            children: question.options.map((option) {
              return Column(
                children: [
                  RadioListTile(
                    title: Text(option.text),
                    value: option.text,
                    groupValue:
                        answers[index]?['response']?.split(':')[0] ?? '',
                    onChanged: (value) {
                      setState(() {
                        answers[index] = {
                          'dimension': category.dimension,
                          'variable': category.variable,
                          'category': category.name,
                          'question': question.text,
                          'response': value,
                          'score': min(option.score, question.totalScore),
                          'maxScore': question.totalScore,
                          'idQuestion': question.id
                        };
                        if (value == 'Si') {
                          if (index < category.questions.length - 1 &&
                              category.questions[index + 1].isVisible ==
                                  false &&
                              (category.questions[index + 1].behavior ==
                                      'hidden' ||
                                  category.questions[index + 1].behavior ==
                                      'hiddenLauncher')) {
                            category.questions[index + 1].isVisible = true;
                            if (question.text ==
                                '¿Conoce cuantos productos debería vender al mes para cubrir tus costos y tener un margen de ganancia?') {
                              category.questions[index + 2].isVisible = true;
                            }
                          }
                        } else if (value == 'No') {
                          if (index < category.questions.length - 1 &&
                              category.questions[index + 1].isVisible == true &&
                              (category.questions[index + 1].behavior ==
                                      'hidden' ||
                                  category.questions[index + 1].behavior ==
                                      'hiddenLauncher')) {
                            category.questions[index + 1].isVisible = false;
                            if (question.text ==
                                '¿Conoce cuantos productos debería vender al mes para cubrir tus costos y tener un margen de ganancia?') {
                              category.questions[index + 2].isVisible = false;
                            }
                          }
                        }
                        if (value == 'Presencial (ferias, y tiendas físicas)') {
                          category.questions[index + 1].isVisible = true;
                          category.questions[index + 2].isVisible = false;
                        } else if (value ==
                            'Digital (Redes sociales, market place, ecommerce)') {
                          category.questions[index + 1].isVisible = false;
                          category.questions[index + 2].isVisible = true;
                        }

                        if (option.typeOption == 'otro') {
                          if (!textEditingControllerMap.containsKey(index)) {
                            textEditingControllerMap[index] =
                                TextEditingController();
                          }
                          print(
                              'contenido del textform actual: ${textEditingControllerMap[index]} en $index');
                        } else {
                          textEditingControllerMap[index]?.dispose();
                          textEditingControllerMap.remove(index);
                          //textEditingControllerMap[index]?.clear();
                        }
                      });
                    },
                  ),
                  if (option.typeOption == 'otro' &&
                      answers[index]?['response']?.split(':')[0] == option.text)
                    Padding(
                      padding: const EdgeInsets.only(left: 42.0),
                      child: TextFormField(
                        controller: textEditingControllerMap[index],
                        decoration: const InputDecoration(
                          hintText: 'Especifique aquí',
                        ),
                        onChanged: (value) {
                          setState(() {
                            answers[index]?['response'] =
                                '${option.text}: $value';
                          });
                        },
                      ),
                    ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildCheckboxListTile(Question question, int index) {
    // Inicializa el controlador solo si no está presente para este índice
    if (!textEditingControllerMap.containsKey(index)) {
      textEditingControllerMap[index] = TextEditingController();
    }

    // Verificar si hay un valor existente para la opción "otro" y actualizar el controlador una sola vez
    if (answers[index]?['response'] is List) {
      var otherOption = question.options.firstWhere(
        (o) => o.typeOption == 'otro',
        orElse: () => Option('', 0, ''), // Retorna un objeto Option vacío
      );

      if (otherOption.text.isNotEmpty &&
          textEditingControllerMap[index]!.text.isEmpty) {
        // Buscar el valor existente para la opción "otro"
        var existingOtherValue = (answers[index]?['response'] as List)
            .firstWhere((response) => response.startsWith(otherOption.text),
                orElse: () =>
                    ''); // Retorna una cadena vacía si no hay coincidencia

        // Solo establecer el texto del controlador si existe un valor relevante
        if (existingOtherValue.isNotEmpty) {
          textEditingControllerMap[index]!.text =
              existingOtherValue.split(': ').skip(1).join(': ');
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.text),
          Column(
            children: question.options.map((option) {
              bool isSelected = false;
              if (answers[index]?['response'] is List) {
                isSelected =
                    (answers[index]?['response'] as List).contains(option.text);
              } else if (answers[index]?['response'] is String) {
                isSelected = answers[index]?['response'] == option.text;
              }

              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(option.text),
                value: isSelected,
                onChanged: (value) {
                  // Evitar llamar a setState directamente aquí para evitar la reconstrucción durante la construcción
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      List<String> selectedOptions;

                      if (answers[index]?['response'] is List) {
                        selectedOptions =
                            List<String>.from(answers[index]?['response']);
                      } else if (answers[index]?['response'] is String) {
                        selectedOptions = [answers[index]?['response']];
                      } else {
                        selectedOptions = [];
                      }

                      if (value != null) {
                        if (value) {
                          switch (option.typeOption) {
                            case 'ninguno':
                              // Selecciona "Ninguna de las anteriores" y deselecciona las demás
                              selectedOptions.clear();
                              selectedOptions.add(option.text);
                              break;
                            case 'todas':
                              // Selecciona todas las opciones, excepto "Ninguna de las anteriores" y "Otro (Especifique)"
                              selectedOptions.clear();
                              selectedOptions.addAll(question.options
                                  .where((o) =>
                                      o.typeOption != 'ninguno' &&
                                      o.typeOption != 'otro')
                                  .map((o) => o.text));
                              break;
                            case 'otro':
                              // Marca la opción "Otro (Especifique)"
                              if (!selectedOptions.contains(option.text)) {
                                selectedOptions.add(option.text);
                              }
                              break;
                            default:
                              // Selecciona la opción normal
                              selectedOptions.add(option.text);
                              // Deselecciona cualquier opción de tipo 'ninguno' si está seleccionada
                              selectedOptions.removeWhere((opt) => question
                                  .options
                                  .where((o) => o.typeOption == 'ninguno')
                                  .map((o) => o.text)
                                  .contains(opt));
                              break;
                          }
                        } else {
                          selectedOptions.remove(option.text);
                          if (option.typeOption == 'todas') {
                            // Deselecciona todas las opciones
                            selectedOptions.clear();
                          }
                        }

                        // Asegura que la opción "Todas las anteriores" sea coherente
                        if (selectedOptions.contains('Todas las anteriores') &&
                            selectedOptions.length < question.options.length) {
                          selectedOptions.remove('Todas las anteriores');
                        }

                        // Asegura que la opción "Ninguna de las anteriores" sea coherente
                        if (question.options
                                .where((o) => o.typeOption == 'ninguno')
                                .map((o) => o.text)
                                .any(selectedOptions.contains) &&
                            selectedOptions.length > 1) {
                          selectedOptions
                              .removeWhere((element) => element != option.text);
                        }

                        // Actualiza la lista de respuestas
                        answers[index] = {
                          'dimension': category.dimension,
                          'variable': category.variable,
                          'category': category.name,
                          'question': question.text,
                          'response':
                              selectedOptions.isNotEmpty ? selectedOptions : '',
                          'score': min(
                              selectedOptions
                                  .map((selectedOption) => question.options
                                      .firstWhere(
                                          (opt) => opt.text == selectedOption,
                                          orElse: () => Option('', 0, ''))
                                      .score)
                                  .fold(
                                      0,
                                      (previousValue, score) =>
                                          previousValue + score),
                              question.totalScore),
                          'maxScore': question.totalScore,
                          'idQuestion': question.id
                        };

                        // Si se selecciona la opción "otro", limpia el campo si no tiene valor relevante
                        if (option.typeOption == 'otro' &&
                            textEditingControllerMap[index]!.text.isEmpty) {
                          textEditingControllerMap[index]!.clear();
                        }
                      }
                    });
                  });
                },
              );
            }).toList(),
          ),
          // Verificar si se debe mostrar el campo de texto para la opción "otro"
          if ((answers[index]?['response'] is List &&
                  (answers[index]?['response'] as List).any((response) =>
                      question.options
                          .where((o) => o.typeOption == 'otro')
                          .map((o) => o.text)
                          .contains(response))) ||
              (answers[index]?['response'] is String &&
                  question.options
                      .where((o) => o.typeOption == 'otro')
                      .map((o) => o.text)
                      .any((text) => (answers[index]?['response'] as String)
                          .startsWith(text))))
            Padding(
              padding: const EdgeInsets.only(left: 42.0),
              child: TextFormField(
                controller: textEditingControllerMap[index],
                // No llamar a setState en cada cambio de texto
                onChanged: (value) {
                  // Aquí no hacemos nada con setState para evitar la reconstrucción constante
                },
                onEditingComplete: () {
                  // Actualizar el estado global solo cuando el usuario ha terminado de editar
                  setState(() {
                    List<String> currentResponses =
                        (answers[index]?['response'] is List)
                            ? List<String>.from(answers[index]?['response'])
                            : [];

                    // Eliminar entradas existentes para la opción "otro" antes de añadir la nueva
                    currentResponses.removeWhere((response) => question.options
                        .where((o) => o.typeOption == 'otro')
                        .map((o) => o.text)
                        .any(
                            (text) => response.startsWith(text.split(':')[0])));

                    // Usar el valor actual del controlador en lugar de `value`
                    String currentText = textEditingControllerMap[index]!.text;

                    // Añadir el nuevo valor especificado si no está vacío
                    if (currentText.isNotEmpty) {
                      String otherText = question.options
                          .firstWhere((o) => o.typeOption == 'otro')
                          .text;
                      currentResponses.add('$otherText: $currentText');
                    }

                    answers[index] = {
                      'dimension': category.dimension,
                      'variable': category.variable,
                      'category': category.name,
                      'question': question.text,
                      'response': currentResponses,
                      'score': min(
                          question.options
                              .firstWhere((opt) => opt.typeOption == 'otro',
                                  orElse: () => Option('', 0, ''))
                              .score,
                          question.totalScore),
                      'maxScore': question.totalScore,
                      'idQuestion': question.id
                    };
                  });
                },
                decoration:
                    const InputDecoration(hintText: 'Ingrese otro valor'),
              ),
            ),
        ],
      ),
    );
  }

  int calculateScore(Question question, List<String> selectedOptions) {
    // Implementa la lógica para calcular el puntaje según las opciones seleccionadas
    int score = 0;
    for (String selectedOption in selectedOptions) {
      Option option = question.options
          .firstWhere((option) => option.text == selectedOption);
      score += option.score;
    }
    return score;
  }

  Widget buildTextFormField(Question question, int index) {
    TextEditingController textEditingController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.text),
          TextFormField(
            controller: textEditingControllerMap[index],
            onChanged: (value) {
              setState(() {
                answers[index] = {
                  'dimension': category.dimension,
                  'variable': category.variable,
                  'category': category.name,
                  'question': question.text,
                  'response': value,
                  'score': question.options[0].score,
                  'maxScore': question.totalScore,
                  'idQuestion': question.id
                };
              });
            },
          ),
        ],
      ),
    );
  }
}

class Item {
  String name;
  int prevIndex;
  Item({required this.name, required this.prevIndex});
}
