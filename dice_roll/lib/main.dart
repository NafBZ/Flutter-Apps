import 'package:flutter/material.dart';
import 'package:dice_roll/background_container.dart';
import 'package:dice_roll/style_text.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const StyleText('Dice Game'),
          backgroundColor: const Color.fromARGB(255, 90, 167, 88),
          centerTitle: true,
        ),
        body: const BackgroundContainer.green(),
      ),
    ),
  );
}
