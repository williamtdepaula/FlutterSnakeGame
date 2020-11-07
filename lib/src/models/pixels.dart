import 'package:flutter/material.dart';

enum PixelsNextPosition {
  nextLeftPosition,
  nextRightPosition,
  nextTopPosition,
  nextBottomPosition,
}

class Pixels {
  BuildContext context;
  int totalPixels = 500;
  int totalColumns = 20;
  int _totalOfRows = 0;
  List<int> totalItemsByRow = [];

  Pixels({
    @required this.context,
    this.totalPixels,
    this.totalColumns,
  }) {
    this._calcTotalOfRows();
    this._generateListTotalItemsByRow();
  }

  void _generateListTotalItemsByRow() {
    totalItemsByRow = List.generate(
      int.parse((this._totalOfRows).toString()),
      (index) => (index + 1) * this.totalColumns - 1,
    );
  }

  void _calcTotalOfRows() {
    this._totalOfRows = (this.totalPixels / this.totalColumns).round();
  }

  //Retorna a posição do pixel
  int getPixelRow(int position) {
    //Gera um array de o valores máximos da quantidade de pixels que possui uma linha

    int row = 0;

    //Verifica qual é a linha
    this.totalItemsByRow.asMap().forEach((index, totalItemsInRow) {
      if (index == 0) {
        if (position <= totalItemsInRow) row = index;
      } else if (position <= totalItemsInRow &&
          position > this.totalItemsByRow[index - 1]) row = index;
    });

    return row;
  }

  int getNextPixel(int currentPosition, PixelsNextPosition nextPosition) {
    int indexRowOfCurrentPosition = this.getPixelRow(currentPosition);

    //************************ ESTÁ INDO PARA CIMA ******************************/
    if (nextPosition == PixelsNextPosition.nextTopPosition) {
      //Está na primeira linha
      if (indexRowOfCurrentPosition == 0) {
        return currentPosition + (this.totalPixels - this.totalColumns);
      }

      return currentPosition - this.totalColumns;
    }

    //************************ ESTÁ INDO PARA BAIXO ******************************/
    if (nextPosition == PixelsNextPosition.nextBottomPosition) {
      //Está na última linha
      if (indexRowOfCurrentPosition == this.totalItemsByRow.length - 1) {
        //vai para a primeira linha
        return this.totalColumns - (this.totalPixels - currentPosition);
      }
      return currentPosition + this.totalColumns;
    }

    //************************ ESTÁ INDO PARA DIREITA ******************************/
    if (nextPosition == PixelsNextPosition.nextRightPosition) {
      //Está no último pixel da linha
      if (currentPosition ==
          (this.totalItemsByRow[indexRowOfCurrentPosition])) {
        return this.totalItemsByRow[indexRowOfCurrentPosition] -
            (this.totalColumns - 1);
      } else {
        return currentPosition + 1;
      }
    }

    //************************ ESTÁ INDO PARA ESQUERDA ******************************/
    if (nextPosition == PixelsNextPosition.nextLeftPosition) {
      //Está no primeiro pixel

      if (currentPosition ==
          this.totalItemsByRow[indexRowOfCurrentPosition] -
              (this.totalColumns - 1)) {
        return this.totalItemsByRow[indexRowOfCurrentPosition];
      }

      return currentPosition - 1;
    }

    return currentPosition;
  }
}
