import 'package:flutter/material.dart';
import 'package:ict/model/indice.dart';

class CustomRadioListTile extends StatefulWidget {
  final Question question;
  final ValueChanged<String?> onChanged;
  final String? groupValue;

  const CustomRadioListTile({
    required this.question,
    required this.onChanged,
    required this.groupValue,
    super.key,
  });

  @override
  _CustomRadioListTileState createState() => _CustomRadioListTileState();
}

class _CustomRadioListTileState extends State<CustomRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.question.text),
        Column(
          children: widget.question.options.map((option) {
            return RadioListTile(
              title: Text(option.text),
              value: option.text,
              groupValue: widget.groupValue,
              onChanged: (value) {
                widget.onChanged(value as String?);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
