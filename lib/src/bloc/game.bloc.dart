import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake_game/src/models/game.dart';
import 'package:snake_game/src/models/pixels.dart';
import 'package:snake_game/src/models/points.dart';
import 'package:snake_game/src/models/snake.dart';
import 'package:snake_game/src/models/timerGame.dart';
import 'package:snake_game/src/utils/simple_stream.dart';
import 'package:snake_game/src/widgets/modals/modal_end_game.dart';

class GameBloc extends SimpleStream {
  Pixels pixels;
  Snake snake;
  Points points;
  TimerGame _timerGame;
  BuildContext context;

  bool gameIsPlaying;

  void initGame(BuildContext context) {
    this.context = context;

    this.gameIsPlaying = true;

    this.startGame();
    this._sendToViewAppStatus();
  }

  void _configGame() {
    this.pixels = new Pixels(totalPixels: 740, totalColumns: 20);
    this.snake = new Snake(
      position: 1,
      initialSize: 3,
      direction: SnakeDirection.right,
      colorHead: Color(0xFFE0E0E0),
      colorBody: Colors.white,
    );
    this.points = new Points(color: Colors.green);
  }

  void startGame() {
    this._configGame();

    _timerGame = new TimerGame(
      onTimerCreatePoint: () =>
          points.generatePoints(pixels.totalPixels, Random().nextInt(5)),
      onTimerSnakeMove: () => _onSnakeMove(),
    );

    _timerGame.initTimers();
  }

  void pauseGame() {
    this.gameIsPlaying = false;

    this._timerGame.stopTimers();

    this._sendToViewAppStatus();
  }

  void unPauseGame() {
    this._timerGame.restartTimers();
  }

  void onEndGame() {
    showModalEndGame(
      context,
      totalPoints: this.snake.totalPoints,
      onPressToRestart: this.restartGame,
    );

    this._timerGame.stopTimers();
    points.clear();

    snake.die();

    this._sendToViewAppStatus();
  }

  void restartGame() {
    this._timerGame.stopTimers();
    this.startGame();
  }

  void onHorizontalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    if (dragUpdateDetails.delta.dx > 0)
      onDragToRight();
    else
      onDragToLeft();
  }

  void onVerticalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    if (dragUpdateDetails.delta.dy > 0)
      onDragToBottom();
    else
      onDragToTop();
  }

  void onDragToLeft() {
    if (snake.direction != SnakeDirection.right)
      snake.direction = SnakeDirection.left;
  }

  void onDragToBottom() {
    if (snake.direction != SnakeDirection.top)
      snake.direction = SnakeDirection.bottom;
  }

  void onDragToTop() {
    if (snake.direction != SnakeDirection.bottom)
      snake.direction = SnakeDirection.top;
  }

  void onDragToRight() {
    if (snake.direction != SnakeDirection.left)
      snake.direction = SnakeDirection.right;
  }

  void _onSnakeMove() {
    snake.position = this._getNextPosition();

    //Verifica se o jogador não bateu no próprio corpo
    if (!snake.isBody(snake.position)) {
      //Verifica se está passando por um ponto
      if (points.isPoint(snake.position)) {
        snake.addBody();
        points.removePoint(snake.position);
        this._timerGame.decreaseTimerMoveSnake();
      }

      snake.moveBody();

      add(Game(points: this.points, snake: this.snake));
    } else {
      this.onEndGame();
    }
  }

  int _getNextPosition() {
    if (snake.direction == SnakeDirection.right) {
      return pixels.getNextPixel(
        snake.position,
        PixelsNextPosition.nextRightPosition,
      );
    }

    if (snake.direction == SnakeDirection.left) {
      return pixels.getNextPixel(
        snake.position,
        PixelsNextPosition.nextLeftPosition,
      );
    }

    if (snake.direction == SnakeDirection.top) {
      return pixels.getNextPixel(
        snake.position,
        PixelsNextPosition.nextTopPosition,
      );
    }

    if (snake.direction == SnakeDirection.bottom) {
      return pixels.getNextPixel(
        snake.position,
        PixelsNextPosition.nextBottomPosition,
      );
    }

    return 0;
  }

  void _sendToViewAppStatus() {
    add(Game(
      snake: this.snake,
      points: this.points,
      gamePlaying: this.gameIsPlaying,
    ));
  }
}
