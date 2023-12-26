import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:try_app/summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['userAnswer'] == itemData['correctAnswer'];
    final questionIndex = itemData['index'] as int;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifer(
          questionIndex: questionIndex,
          isAnswerCorrect: isCorrectAnswer,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['question'].toString(),
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                text: 'Correct: ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 121, 57),
                ),
                children: [
                  TextSpan(
                    text: itemData['correctAnswer'].toString(),
                    style: DefaultTextStyle.of(context).style,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            RichText(
              text: TextSpan(
                text: 'Yours: ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 30, 112, 137),
                ),
                children: [
                  TextSpan(
                    text: itemData['userAnswer'].toString(),
                    style: DefaultTextStyle.of(context).style,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ))
      ],
    );
  }
}
