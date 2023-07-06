import 'package:flutter/material.dart';
// import 'package:dice_roll/style_text.dart';
import 'package:dice_roll/dice_roller.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer(this.color1, this.color2, {super.key});

  const BackgroundContainer.green({super.key})
      : color1 = const Color.fromARGB(255, 228, 241, 153),
        color2 = const Color.fromARGB(255, 162, 223, 144);

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
