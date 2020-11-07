import 'package:flutter/material.dart';
import 'package:snake_game/src/models/foods.dart';
import 'package:snake_game/src/models/snake.dart';

class PixelArea extends StatelessWidget {
  final Snake snake;
  final Foods foods;
  final int position;

  PixelArea({
    this.snake,
    this.foods,
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
        color: snake.isHead(position)
            ? snake.colorHead
            : snake.isBody(position)
                ? snake.colorBody
                : foods.isFood(position)
                    ? foods.color
                    : Color(0xFF212121),
      ),
    );
  }
}
