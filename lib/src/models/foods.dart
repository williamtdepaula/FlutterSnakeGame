import 'dart:math';

import 'package:flutter/material.dart';

class Foods {
  List<int> _indexOfFoods = [];
  Color color;

  Foods({this.color = Colors.white});

  get getIndexOfFoods => this._indexOfFoods;

  void clear() {
    _indexOfFoods.clear();
  }

  void generateFoods(int totalOfIndex, int maxPoints) {
    if (this._indexOfFoods.length == 0) {
      Random random = new Random();

      while (_indexOfFoods.length < maxPoints) {
        int randomValue = 1 + random.nextInt(totalOfIndex - 1);

        if (this._indexOfFoods.indexOf(randomValue) == -1)
          this._indexOfFoods.add(1 + random.nextInt(totalOfIndex - 1));
      }
    }
  }

  bool isFood(int index) {
    return this._indexOfFoods.indexOf(index) != -1;
  }

  void removeFood(int indexPoint) {
    this._indexOfFoods.remove(indexPoint);
  }
}
