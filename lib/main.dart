import 'package:flutter/material.dart';
import 'package:soccer_head/api_service.dart';
import 'package:soccer_head/screens/quiz_screen.dart';
import 'Question.dart';

void main() async {
  final questions = await ApiService().fetchQuestions();
  runApp(MaterialApp(
    home: SoccerHead(
      questions: questions,
    ),
  ));
}

class SoccerHead extends StatelessWidget {
  final List<Question> questions;

  const SoccerHead({Key? key, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Soccer Head!'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Start Quiz'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScreen(
                    questions: questions,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
