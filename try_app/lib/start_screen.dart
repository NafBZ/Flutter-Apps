import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/b.png',
            width: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Quiz Me',
            style: TextStyle(
                color: Color.fromARGB(255, 19, 90, 100),
                fontSize: 28,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 241, 202, 27)),
            label: const Text(
              'Start Quiz',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
