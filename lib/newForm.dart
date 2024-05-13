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
  final Queue<Category> categories;
  final String id;
  final String name;
  const NextForm(
      {super.key,
      required this.categories,
      required this.id,
      required this.name});

  @override
  State<NextForm> createState() => _NextFormState();
}

class _NextFormState extends State<NextForm> {
  Map<int, Map<String, dynamic>> answers = {};
  Map<int, TextEditingController> textEditingControllerMap = {};
  late final Category category;
  @override
  void initState() {
    super.initState();
    print('antes/');
    widget.categories.forEach((elemento) {
      print(elemento.name);
    });
    category = widget.categories.removeFirst();
    for (var i = 0; i < category.questions.length; i++) {
      bool ok = false;
      for (var option in category.questions[i].options) {
        if (option.text == 'Otro (Especifique)') ok = true;
      }
      if (ok || category.questions[i].typeWidget == 2) {
        textEditingControllerMap[i] = TextEditingController();
      }
    }
    print('despues');
    widget.categories.forEach((elemento) {
      print(elemento.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(                
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(166, 134, 13, 108),
          automaticallyImplyLeading: false,
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
        body: Column(
          children: [
            (category.name != category.variable)?Center(
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ):Center(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: category.questions.length,
                  itemBuilder: (context, index) {
                    final question = category.questions[index];
                    switch (question.typeWidget) {
                      case 0:
                        return Visibility(
                            visible: question.isVisible,
                            child: buildRadioListTile(question, index));
                      case 1:
                        return Visibility(
                            visible: question.isVisible,
                            child: buildCheckboxListTile(question, index));
                      case 2:
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (allQuestionsAnswered()) {
              print('comenzand');
              for (var i = 0; i < category.questions.length; i++) {
                if (category.questions[i].behavior != 2) continue;
                for (Category category in categories_data) {
                  print(answers[i]?['response']);
                  final options;
                  if (answers[i]?['response'] is String) {
                    options = [answers[i]?['response']];
                  } else {
                    options = answers[i]?['response'];
                  }
                  print(options);
                  for (final option in options) {
                    if (option == category.name &&
                        (category.name == 'Prendas Tejidas a Punto' ||
                            category.name == 'Peletería' ||
                            category.name == 'Tejido plano en Telar' ||
                            category.name == 'Prendas' ||
                            category.name == 'Accesorios' ||
                            category.name == 'DecoHome' ||
                            category.name == 'Teñido industrial' ||
                            category.name ==
                                'Teñido artesanal (Plantas y químicos)' ||
                            category.name ==
                                'Teñidos natural (Uso de plantas, flores y raíces)')) {
                      setState(() {
                        widget.categories.addFirst(category);
                      });
                    }
                  }
                }
              }
              print('teminooooooooooooooooo');
              print('elementos antes de pasar');
              widget.categories.forEach((elemento) {
                print(elemento.name);
              });
              await saveDataToSupabase();
              if (widget.categories.length != 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextForm(
                        categories: widget.categories,
                        id: widget.id,
                        name: widget.name),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Results(id: widget.id, name: widget.name),
                  ),
                );
              }
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
          child: const Icon(Icons.navigate_next),
        ),
      ),
    );
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
      if (category.questions[i].isVisible == false) continue;
      if (answers[i] == null ||
          answers[i]?['response'] == null ||
          answers[i]?['response'].isEmpty) {
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
              return RadioListTile(
                title: Text(option.text),
                value: option.text,
                groupValue: answers[index]?['response'],
                onChanged: (value) {
                  setState(() {
                    //answers[index] = value;
                    answers[index] = {
                      'dimension': category.dimension,
                      'variable': category.variable,
                      'category': category.name,
                      'question': question.text,
                      'response': value,
                      'score': option.score,
                      'maxScore': question.totalScore,
                    };
                    if (value == 'Si') {
                      if (index < category.questions.length - 1 &&
                          category.questions[index + 1].isVisible == false &&
                          category.questions[index + 1].behavior == 1) {
                        category.questions[index + 1].isVisible = true;
                      }
                    } else if (value == 'No') {
                      if (index < category.questions.length - 1 &&
                          category.questions[index + 1].isVisible == true &&
                          category.questions[index + 1].behavior == 1) {
                        category.questions[index + 1].isVisible = false;
                      }
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildCheckboxListTile(Question question, int index) {
    // Define un controlador para el campo de texto personalizado
    TextEditingController customInputController = TextEditingController();
    String content = textEditingControllerMap[index] != null
        ? textEditingControllerMap[index]!.text
        : '';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.text),
          Column(
            children: question.options.asMap().entries.map((entry) {
              final int optionIndex = entry.key;
              final Option option = entry.value;
              if (option.text == 'Otro (Especifique)') {
                // Si la opción es "Otro", mostrar un TextFormField para ingresar un valor personalizado
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      children: [
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(option.text),
                          value: answers[index]?['response']
                                  ?.contains(option.text) ??
                              false,
                          onChanged: (value) {
                            setState(() {
                              List<String> selectedOptions =
                                  answers[index]?['response']?.cast<String>() ??
                                      [];
                              if (value != null) {
                                if (value) {
                                  selectedOptions.add(option.text);
                                } else {
                                  selectedOptions.remove(option.text);
                                }
                                print('demas elementos pero con otro');
                                print(selectedOptions);
                                int totalScore = selectedOptions
                                    .map((selectedOption) {
                                  var option = question.options.firstWhere(
                                      (opt) => opt.text == selectedOption,
                                      orElse: () => Option('', 0));
                                  return option.score;
                                }).fold(
                                        0,
                                        (previousValue, score) =>
                                            previousValue + score);

                                answers[index] = {
                                  'dimension': category.dimension,
                                  'variable': category.variable,
                                  'category': category.name,
                                  'question': question.text,
                                  'response': selectedOptions,
                                  'score': min(totalScore, question.totalScore),
                                  'maxScore': question.totalScore,
                                  // Puedes calcular el puntaje aquí según las opciones seleccionadas
                                };
                              }
                            });
                          },
                        ),
                        if (answers[index]?['response']
                                ?.contains(option.text) ??
                            false)
                          Padding(
                            padding: const EdgeInsets.only(left: 42.0),
                            child: TextFormField(
                              controller: textEditingControllerMap[index],
                              onChanged: (value) {
                                setState(() {
                                  // Actualizar la respuesta con el valor personalizado ingresado
                                  List<String> selectedOptions = answers[index]
                                              ?['response']
                                          ?.cast<String>() ??
                                      [];
                                  if (value != null) {
                                    if (selectedOptions.contains(content)) {
                                      selectedOptions.remove(content);
                                    }
                                    content = 'Otro (Especifique): ${value}';
                                    selectedOptions.add(content);
                                  }
                                  print('se ingreso algo');
                                  print(selectedOptions);
                                  int totalScore = selectedOptions
                                      .map((selectedOption) {
                                    var option = question.options.firstWhere(
                                        (opt) => opt.text == selectedOption,
                                        orElse: () => Option('', 0));
                                    return option.score;
                                  }).fold(
                                          0,
                                          (previousValue, score) =>
                                              previousValue + score);

                                  answers[index] = {
                                    'dimension': category.dimension,
                                    'variable': category.variable,
                                    'category': category.name,
                                    'question': question.text,
                                    'response': selectedOptions,
                                    'score':
                                        min(totalScore, question.totalScore),
                                        'maxScore': question.totalScore,
                                    // Puedes calcular el puntaje aquí según las opciones seleccionadas
                                  };
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese otro valor',
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                );
              } else {
                // Otras opciones que no son "Otro"
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(option.text),
                  value: answers[index]?['response']?.contains(option.text) ??
                      false,
                  onChanged: (value) {
                    setState(() {
                      List<String> selectedOptions =
                          answers[index]?['response']?.cast<String>() ?? [];
                      if (value != null) {
                        if (value) {
                          selectedOptions.add(option.text);
                        } else {
                          selectedOptions.remove(option.text);
                        }
                        print("si no hay otros::");
                        print(selectedOptions);
                        int totalScore = selectedOptions.map((selectedOption) {
                          var option = question.options.firstWhere(
                              (opt) => opt.text == selectedOption,
                              orElse: () => Option('', 0));
                          return option.score;
                        }).fold(
                            0, (previousValue, score) => previousValue + score);

                        answers[index] = {
                          'dimension': category.dimension,
                          'variable': category.variable,
                          'category': category.name,
                          'question': question.text,
                          'response': selectedOptions,
                          'score': min(totalScore, question.totalScore),
                          'maxScore': question.totalScore,
                          // Puedes calcular el puntaje aquí según las opciones seleccionadas
                        };
                      }
                    });
                  },
                );
              }
            }).toList(),
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
                };
              });
            },
          ),
        ],
      ),
    );
  }
}
