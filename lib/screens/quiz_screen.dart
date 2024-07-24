import 'package:flutter/material.dart';

import '../Question.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;

  const QuizScreen({Key? key, required this.questions}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Soccer Head Trivia'),
      ),
      body: Column(
        children: [
          Text(currentQuestion.question),
          Expanded(
              child: ListView.builder(
            itemCount: currentQuestion.options.length,
            itemBuilder: (context, index) {
              print(
                  'correct answer index ${currentQuestion.correctAnswerIndex}');
              return ListTile(
                title: Text(currentQuestion.options[index]),
              );
            },
          ))
        ],
      ),
    );
  }
}
