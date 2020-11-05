import 'dart:async';

class TimerGame {
  Timer _timerMoveSnake;
  Timer _timerCreatePoint;
  int _intervalMoveSnake = 300;

  Function onTimerCreatePoint;
  Function onTimerSnakeMove;

  TimerGame({
    this.onTimerCreatePoint,
    this.onTimerSnakeMove,
  });

  void initTimers() {
    this._initTimerMoveSnake();
    this._initTimerCreatPoint();
  }

  void _initTimerMoveSnake() {
    this._timerMoveSnake = Timer.periodic(
      Duration(milliseconds: _intervalMoveSnake),
      (_) => onTimerSnakeMove(),
    );
  }

  void _initTimerCreatPoint() {
    this._timerCreatePoint = Timer.periodic(
      Duration(seconds: 15),
      (_) => onTimerCreatePoint(),
    );
  }

  void _restartTimerSnake() {
    this._timerMoveSnake.cancel();
    this._initTimerMoveSnake();
  }

  void decreaseTimerMoveSnake() {
    if (this._intervalMoveSnake >= 100) {
      this._intervalMoveSnake = this._intervalMoveSnake - 10;
      this._restartTimerSnake();
    }
  }

  void restartTimers() {
    this.stopTimers();
    this.initTimers();
  }

  void stopTimers() {
    this._timerCreatePoint.cancel();
    this._timerMoveSnake.cancel();
  }
}
