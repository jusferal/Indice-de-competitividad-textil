import 'package:flutter/material.dart';
import 'package:ict/model/indice.dart';

class CustomCheckboxListTile extends StatefulWidget {
  final Question question;
  final ValueChanged<List<String>> onChanged;
  final List<String> selectedValues;
   const CustomCheckboxListTile ({
    super.key, // Agrega el key como positional parameter
    required this.question,
    required this.onChanged,
    required this.selectedValues,
  }); // Usa el key en el constructor super


  @override
  State<CustomCheckboxListTile> createState() => _CustomCheckboxListTileState();
}

class _CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 100,height: 100,color: Colors.blue,),
        Text(widget.question.text),
        Column(
          children: widget.question.options.map((option) {
            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(option.text),
              value: widget.selectedValues.contains(option.text),
              onChanged: (value) {
                setState(() {
                  if (value != null && value) {
                    widget.selectedValues.add(option.text);
                  } else {
                    widget.selectedValues.remove(option.text);
                  }
                  widget.onChanged(widget.selectedValues);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}