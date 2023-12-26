import 'package:flutter/material.dart';
import 'package:try_app/answer_button.dart';
import 'package:try_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String userAnswer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var indexQuestion = 0;

  void answerQuestion(String userAnswer) {
    widget.onSelectAnswer(userAnswer);
    setState(() {
      indexQuestion++;
    });
  }

  @override
  Widget build(context) {
    final question = questionList[indexQuestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 19, 90, 100),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...question.getShuffledList().map((item) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnswerButton(
                    answers: item,
                    onTap: () {
                      answerQuestion(item);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
