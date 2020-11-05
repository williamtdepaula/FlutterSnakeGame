import 'package:snake_game/src/models/points.dart';
import 'package:snake_game/src/models/snake.dart';

class Game {
  Snake snake;
  Points points;
  bool gamePlaying;

  Game({
    this.points,
    this.snake,
    this.gamePlaying = true,
  });
}
