import 'package:flutter/material.dart';

import '../Question.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;

  const QuizScreen({Key? key, required this.questions}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  void _questionAnswered(bool isCorrect) {
    setState(() {
      _score += isCorrect ? 1 : 0;
      if (_currentQuestionIndex < widget.questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        //   TODO move to game over screen
        print('final score $_score');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentQuestionIndex];

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
                onTap: () {
                  _questionAnswered(
                      index == currentQuestion.correctAnswerIndex);
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
