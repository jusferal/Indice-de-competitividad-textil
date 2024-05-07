import 'package:flutter/material.dart';
import 'package:ict/model/indice.dart';
import 'package:ict/results.dart';
import 'package:ict/widgets/CustomCheckboxListTile.dart';
import 'package:ict/widgets/CustomInputFormField.dart';
import 'package:ict/widgets/customRadioListTile.dart';
import 'dart:collection';

class NextForm extends StatefulWidget {
  final Queue<Category> categories;
  const NextForm({super.key, required this.categories});

  @override
  State<NextForm> createState() => _NextFormState();
}

class _NextFormState extends State<NextForm> {
  Map<int, dynamic> answers = {};
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
          title: Text(
            '${category.name}',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
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
                  return SizedBox();
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('respuestas: $answers');
            print('longitud de las categorias: widget.categories.length');
            if (widget.categories.length != 0)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NextForm(categories: widget.categories),
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
          },
          child: Icon(Icons.navigate_next),
        ),
      ),
    );
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
                groupValue: answers[index],
                onChanged: (value) {
                  setState(() {
                    answers[index] = value;
                    if (value == 'Si') {
                      if (index < category.questions.length - 1 &&
                          category.questions[index + 1].isVisible == false) {
                        category.questions[index + 1].isVisible = true;
                      }
                    } else if (value == 'No') {
                      if (index < category.questions.length - 1 &&
                          category.questions[index + 1].isVisible == true) {
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
                value: answers[index]?.contains(option.text) ?? false,
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      List<String> selectedOptions =
                          answers[index]?.cast<String>() ?? [];
                      if (value) {
                        selectedOptions.add(option.text);
                      } else {
                        selectedOptions.remove(option.text);
                      }
                      answers[index] = selectedOptions;
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
            controller: textEditingController,
            onChanged: (value) {
              setState(() {
                answers[index] = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
