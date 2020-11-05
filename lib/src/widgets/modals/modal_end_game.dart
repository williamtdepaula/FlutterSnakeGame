import 'package:flutter/material.dart';

showModalEndGame(BuildContext context,
    {@required int totalPoints, Function onPressToRestart}) {
  showGeneralDialog(
    context: context,
    pageBuilder: ((context, animation1, animation2) {}),
    barrierDismissible: false,
    barrierColor: Color(0x80000000),
    barrierLabel: "Dismiss",
    transitionBuilder: (
      BuildContext context,
      Animation animationOne,
      Animation animationTwo,
      Widget widget,
    ) {
      return Transform.scale(
        scale: animationOne.value,
        child: ModalEndGame(
          totalPoints: totalPoints,
          onPressToRestart: onPressToRestart,
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 100),
  );
}

class ModalEndGame extends StatelessWidget {
  final int totalPoints;
  final Function onPressToRestart;

  ModalEndGame({this.totalPoints, this.onPressToRestart});

  void onPressToRestartGame(BuildContext context) {
    this.onPressToRestart();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            Text(
              'Você perdeu!',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Você fez ${this.totalPoints} pontos!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Text(
                'Reiniciar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => this.onPressToRestartGame(context),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
