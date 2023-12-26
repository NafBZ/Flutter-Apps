import 'package:flutter/material.dart';
import 'package:try_app/data/questions.dart';
import 'package:try_app/questions_screen.dart';
import 'package:try_app/summary/result_screen.dart';
import 'package:try_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void quizRestart() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  void homeScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String userAnswer) {
    selectedAnswer.add(userAnswer);
    if (selectedAnswer.length == questionList.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
          chosenAnswers: selectedAnswer,
          onRestart: quizRestart,
          onHome: homeScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 153, 211, 187),
              Color.fromARGB(255, 255, 255, 255),
            ], begin: Alignment.topCenter),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
