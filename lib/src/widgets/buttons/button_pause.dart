import 'package:flutter/material.dart';
import 'package:snake_game/src/widgets/buttons/button.dart';

class ButtonPause extends StatelessWidget {
  final Function onPressed;
  final bool paused;

  ButtonPause({
    this.onPressed,
    this.paused = false,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      text: !paused ? "Pausar" : "Voltar",
      onPressed: this.onPressed,
      backgroundColor: !paused ? Colors.red : Colors.green,
      textColor: Colors.white,
    );
  }
}
