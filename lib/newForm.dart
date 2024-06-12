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
  const NextForm(
      {super.key,
      required this.categories,
      required this.id,
      required this.name,
      required this.code,
      required this.globalAnswers,
      required this.indexCategories,
      required this.used});

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
    print('antes/');
    widget.categories.forEach((elemento) {
      print(elemento.name);
    });
    if (widget.categories.isNotEmpty) {
      category = widget.categories[widget.indexCategories];
    } else {
      Navigator.pop(context); // No hay más categorías, regresar
    }
    for (var i = 0; i < category.questions.length; i++) {
      bool isOtherOption = category.questions[i].options
          .any((option) => option.text == 'Otro (Especifique)');

      if (isOtherOption || category.questions[i].typeWidget == 2) {
        textEditingControllerMap[i] = TextEditingController();
      }
    }
    print(widget.indexCategories);
    print('despues');
    widget.categories.forEach((elemento) {
      print(elemento.name);
    });
    print(widget.used);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 122, 51, 129),
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
        body: Form(
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (allQuestionsAnswered()) {
              print('comenzand');

              int newCode = 0;
              for (var i = 0; i < category.questions.length; i++) {
                if (category.questions[i].behavior != 2 &&
                    category.questions[i].behavior != 3) continue;
                if (!answers.containsKey(i)) continue;
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
                            category.name == 'Tejido Plano en Telar' ||
                            category.name == 'Prendas' ||
                            category.name == 'Accesorios' ||
                            category.name == 'DecoHome' ||
                            category.name == 'Teñido industrial' ||
                            category.name ==
                                'Teñido artesanal (Plantas y químicos)' ||
                            category.name ==
                                'Teñidos natural (Uso de plantas, flores y raíces)')) {
                      if (category.name == 'Prendas Tejidas a Punto')
                        newCode = 1;
                      if (category.name == 'Peletería') newCode = 2;
                      if (category.name == 'Tejido Plano en Telar') newCode = 3;
                      setState(() {
                        Item val = new Item(
                            name: category.name,
                            prevIndex: widget.indexCategories);
                        Set<String> values = {};
                        widget.used.forEach((element) {
                          if (element.prevIndex == widget.indexCategories) {
                            values.add(element.name);
                            widget.used.remove(element);
                          }
                        });
                        if (!widget.used.contains(val)) {
                          widget.categories
                              .insert(widget.indexCategories + 1, category);
                          widget.used.add(val);
                        }
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
              saveAnswers();
              print(
                  'lens: ${widget.indexCategories} ${widget.categories.length}');
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
                    ),
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

  Future<void> saveAnswers() async {
    for (var entry in answers.entries) {
      widget.globalAnswers[entry.key] = entry.value;
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
              return RadioListTile(
                title: Text(option.text),
                value: option.text,
                groupValue: answers[index]?['response']?.split(':')[0] ?? '',
                onChanged: (value) {
                  setState(() {
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
                          (category.questions[index + 1].behavior == 1 ||
                              category.questions[index + 1].behavior == 3)) {
                        category.questions[index + 1].isVisible = true;
                        if (question.text ==
                            '¿Conoce cuantos productos debería vender al mes para cubrir tus costos y tener un margen de ganancia?') {
                          category.questions[index + 2].isVisible = true;
                        }
                      }
                    } else if (value == 'No') {
                      if (index < category.questions.length - 1 &&
                          category.questions[index + 1].isVisible == true &&
                          (category.questions[index + 1].behavior == 1 ||
                              category.questions[index + 1].behavior == 3)) {
                        category.questions[index + 1].isVisible = false;
                        if (question.text ==
                            '¿Conoce cuantos productos debería vender al mes para cubrir tus costos y tener un margen de ganancia?') {
                          category.questions[index + 2].isVisible = false;
                        }
                      }
                    }
                    if (value == 'Presencial (tiendas físicas)') {
                      category.questions[index + 1].isVisible = true;
                      category.questions[index + 2].isVisible = false;
                    } else if (value ==
                        'Digital (Redes sociales, market place, ecommerce)') {
                      category.questions[index + 1].isVisible = false;
                      category.questions[index + 2].isVisible = true;
                    }

                    if (value == 'Otro (Especifique)') {
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
              );
            }).toList(),
          ),
          if (answers[index]?['response']?.split(':')[0] ==
              'Otro (Especifique)')
            Padding(
              padding: const EdgeInsets.only(left: 42.0),
              child: TextFormField(
                controller: textEditingControllerMap[index],
                decoration: InputDecoration(
                  hintText: 'Especifique aquí',
                ),
                onChanged: (value) {
                  print("eeeeeeeeeeeeee");
                  setState(() {
                    answers[index]?['response'] = 'Otro (Especifique): $value';
                  });
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget buildCheckboxListTile(Question question, int index) {
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
                        if (option.text == 'Ninguna de las anteriores') {
                          selectedOptions.clear();
                          selectedOptions.add(option.text);
                        } else if (option.text == 'Todas las anteriores') {
                          selectedOptions.clear();
                          selectedOptions.addAll(question.options
                              .where((o) =>
                                  o.text != 'Ninguna de las anteriores' &&
                                  o.text != 'Otro (Especifique)')
                              .map((o) => o.text));
                        } else {
                          selectedOptions.add(option.text);
                          if (selectedOptions
                              .contains('Ninguna de las anteriores')) {
                            selectedOptions.remove('Ninguna de las anteriores');
                          }
                        }
                      } else {
                        selectedOptions.remove(option.text);
                        if (option.text == 'Todas las anteriores') {
                          selectedOptions.clear();
                        }
                      }

                      if (selectedOptions.contains('Todas las anteriores') &&
                          selectedOptions.length <
                              question.options.length - 1) {
                        selectedOptions.remove('Todas las anteriores');
                      }

                      if (selectedOptions
                              .contains('Ninguna de las anteriores') &&
                          selectedOptions.length > 1) {
                        selectedOptions.removeWhere((element) =>
                            element != 'Ninguna de las anteriores');
                      }

                      int totalScore = selectedOptions
                          .map((selectedOption) => question.options
                              .firstWhere((opt) => opt.text == selectedOption,
                                  orElse: () => Option('', 0))
                              .score)
                          .fold(0,
                              (previousValue, score) => previousValue + score);

                      answers[index] = {
                        'dimension': category.dimension,
                        'variable': category.variable,
                        'category': category.name,
                        'question': question.text,
                        'response':
                            selectedOptions.isNotEmpty ? selectedOptions : '',
                        'score': min(totalScore, question.totalScore),
                        'maxScore': question.totalScore,
                      };

                      if (selectedOptions.contains('Otros (Especifique)') &&
                          !textEditingControllerMap.containsKey(index)) {
                        textEditingControllerMap[index] =
                            TextEditingController();
                      } else if (!selectedOptions
                          .contains('Otros (Especifique)')) {
                        textEditingControllerMap[index]?.dispose();
                        textEditingControllerMap.remove(index);
                      }
                    }
                  });
                },
              );
            }).toList(),
          ),
          if ((answers[index]?['response'] is List &&
                  (answers[index]?['response'] as List)
                      .contains('Otros (Especifique)')) ||
              (answers[index]?['response'] is String &&
                  (answers[index]?['response'] as String)
                      .startsWith('Otros (Especifique)')))
            Padding(
              padding: const EdgeInsets.only(left: 42.0),
              child: TextFormField(
                controller: textEditingControllerMap[index],
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      List<String> currentResponses =
                          (answers[index]?['response'] is List)
                              ? List<String>.from(answers[index]?['response'])
                              : [];
                      currentResponses.add('Otros (Especifique): $value');

                      answers[index] = {
                        'dimension': category.dimension,
                        'variable': category.variable,
                        'category': category.name,
                        'question': question.text,
                        'response': currentResponses,
                        'score': question.options
                            .firstWhere(
                                (opt) => opt.text == 'Otros (Especifique)',
                                orElse: () => Option('', 0))
                            .score,
                        'maxScore': question.totalScore,
                      };
                    } else {
                      answers[index]?['response'] = answers[index]?['response']
                              is List
                          ? (answers[index]?['response'] as List)
                              .where((response) =>
                                  !response.startsWith('Otros (Especifique):'))
                              .toList()
                          : '';
                    }
                  });
                },
                decoration: InputDecoration(hintText: 'Ingrese otro valor'),
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
