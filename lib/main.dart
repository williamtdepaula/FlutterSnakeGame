import 'package:flutter/material.dart';
import 'package:snake_game/src/screen/game.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: GameScreen.id,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      routes: {
        GameScreen.id: (_) => GameScreen(),
      },
    );
  }
}