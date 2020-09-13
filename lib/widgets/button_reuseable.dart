import 'package:flutter/material.dart';

class ReuseableButton extends StatelessWidget {
  // const ReuseableButton({
  //   Key key,
  // }) : super(key: key);
  ReuseableButton({this.color, this.label, this.onPressed});

  final Color color;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      color: color == null ? Colors.blueGrey : color,
    );
  }
}