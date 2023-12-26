import 'package:flutter/material.dart';

class QuestionIdentifer extends StatelessWidget {
  const QuestionIdentifer(
      {super.key, required this.questionIndex, required this.isAnswerCorrect});

  final bool isAnswerCorrect;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isAnswerCorrect ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
