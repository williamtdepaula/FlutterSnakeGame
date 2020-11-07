import 'package:snake_game/src/models/foods.dart';
import 'package:snake_game/src/models/snake.dart';

class GameStatus {
  Snake snake;
  Foods foods;
  bool gamePlaying;

  GameStatus({
    this.foods,
    this.snake,
    this.gamePlaying = true,
  });
}
