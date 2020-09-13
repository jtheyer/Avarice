import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  CustomTextField({this.labelText, this.onChanged});

  final String labelText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onChanged: onChanged,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: labelText, border: OutlineInputBorder()),
      ),
    );
  }
}