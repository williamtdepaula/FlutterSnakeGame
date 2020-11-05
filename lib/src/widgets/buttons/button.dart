import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  Button({
    this.onPressed,
    this.backgroundColor = Colors.green,
    this.textColor = Colors.white,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: this.backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          this.text,
          style: TextStyle(
            color: this.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
