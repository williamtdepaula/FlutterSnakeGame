import 'package:flutter/material.dart';
import 'package:snake_game/src/models/points.dart';
import 'package:snake_game/src/models/snake.dart';

class PixelArea extends StatelessWidget {
  final Snake snake;
  final Points points;
  final int position;

  PixelArea({
    this.snake,
    this.points,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: points.isPoint(position)
            ? points.color
            : snake.isHead(position)
                ? snake.colorHead
                : snake.isBody(position)
                    ? snake.colorBody
                    : Color(0xFF212121),
      ),
    );
  }
}
