class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  Question(
      {required this.question,
      required this.options,
      required this.correctAnswerIndex});

  factory Question.fromJson(Map<String, dynamic> json) {
    final options = List<String>.from(json['incorrectAnswers']);
    options.add(json['correctAnswer']);
    options.shuffle();

    final correctAnswerIndex = options.indexOf(json['correctAnswer']);

    return Question(
      question: json['question']['text'],
      options: options,
      correctAnswerIndex: correctAnswerIndex,
    );
  }
}
