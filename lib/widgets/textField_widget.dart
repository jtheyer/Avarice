import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: labelText, border: OutlineInputBorder()),
      ),
    );
  }
}