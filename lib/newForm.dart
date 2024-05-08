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
  const NextForm({super.key, required this.categories});

  @override
  State<NextForm> createState() => _NextFormState();
}

class _NextFormState extends State<NextForm> {
  Map<int, Map<String, dynamic>> answers = {};
  late final Category category;
  @override
  void initState() {
    super.initState();
    category = widget.categories.removeLast();
    print('imprimiendo valores de la cola');
    widget.categories.forEach((element) {
      print(element.name);
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
              '${category.name}',
              style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        body: Padding(
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (allQuestionsAnswered()) {
              print('respuestas: $answers');
              print('longitud de las categorias: widget.categories.length');
              await saveDataToSupabase();
              if (widget.categories.length != 0)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NextForm(categories: widget.categories),
                  ),
                );
              else
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(),
                  ),
                );
              //int totalScore = calculateScore();
              print('Total Score: $answers');
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

  Future<void> saveDataToSupabase() async {
    final client = Supabase.instance.client;

    // Iterar sobre las respuestas y guardarlas en Supabase
    for (final answer in answers.values) {
      print(answer);
      final response = await client.from('Respuestas').insert(answer);
    }
  }

  bool allQuestionsAnswered() {
    for (int i = 0; i < category.questions.length; i++) {
      print('${i} ${category.questions[i].isVisible} ${answers[i]?['response']}');
      if (category.questions[i].isVisible == false) continue;
      if (answers[i] == null || answers[i]?['response'] == null || answers[i]?['response'].isEmpty) {
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
                    };
                    if (value == 'Si') {
                      if (index < category.questions.length - 1 &&
                          category.questions[index + 1].isVisible == false && category.questions[index + 1].behavior == 1) {
                        category.questions[index + 1].isVisible = true;
                      }
                    } else if (value == 'No') {
                      if (index < category.questions.length - 1 &&
                          category.questions[index + 1].isVisible == true && category.questions[index + 1].behavior == 1) {
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.text),
          Column(
            children: question.options.map((option) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(option.text),
                value:
                    answers[index]?['response']?.contains(option.text) ?? false,
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
                      int totalScore = selectedOptions
                          .map((selectedOption) => question.options
                              .firstWhere((opt) => opt.text == selectedOption)
                              .score)
                          .fold(0,
                              (previousValue, score) => previousValue + score);
                      answers[index] = {
                        'dimension': category.dimension,
                        'variable': category.variable,
                        'category': category.name,
                        'question': question.text,
                        'response': selectedOptions,
                        'score': totalScore,
                      };
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

  Widget buildTextFormField(Question question, int index) {
    TextEditingController textEditingController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.text),
          TextFormField(
            // controller: textEditingController,
            onChanged: (value) {
              setState(() {
                answers[index] = {
                  'dimension': category.dimension,
                  'variable': category.variable,
                  'category': category.name,
                  'question': question.text,
                  'response': value,
                  'score': question.options[0].score,
                };
              });
            },
          ),
        ],
      ),
    );
  }
}
