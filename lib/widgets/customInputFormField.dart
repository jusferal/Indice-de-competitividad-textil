import 'package:flutter/material.dart';

class CustomInputFormField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  const CustomInputFormField({super.key, required this.labelText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      onChanged: onChanged,
    );
  }
    
  
}