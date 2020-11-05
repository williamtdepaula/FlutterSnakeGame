import 'package:flutter/material.dart';

enum SnakeDirection {
  left,
  right,
  bottom,
  top,
}

class Snake {
  int position;
  SnakeDirection direction;
  Color colorBody;
  Color colorHead;
  int initialSize;
  List<int> body = [];

  Snake({
    this.position,
    this.direction = SnakeDirection.bottom,
    this.colorBody = Colors.white,
    this.colorHead = Colors.grey,
    this.initialSize = 1,
  }) {
    //Evita que o tamanho inicial da snake seja maior do que o espaço que ela tem para iniciar
    if ((position + 1) < this.initialSize) position = this.initialSize;
    this.addBody(size: this.initialSize); //Adiciona a cabeça ao corpo
  }

  int get totalPoints => this.body.length > this.initialSize ? this.body.length - this.initialSize : 0;

  void die() {
    this.body.clear();
  }

  void addBody({int size = 1}) {
    for (int i = 0; i < size; i++) {
      this.body.add(position - i);
    }
  }

  void moveBody() {
    if (this.body.length > 0) {
      List<int> newList = [];

      this.body.asMap().forEach((int index, int position) {
        if (index == 0) {
          newList.add(this.position);
        } else {
          newList.add(this.body[index - 1]);
        }
      });

      this.body = newList;
    }
  }

  bool isBody(int index, {String teste = ''}) {
    return this.body.indexOf(index) != -1;
  }

  bool isHead(int index) {
    return this.body.length > 0 ? index == this.body[0] : false;
  }

  int positionOfBody(int index) {
    return this.body.indexOf(index);
  }
}
