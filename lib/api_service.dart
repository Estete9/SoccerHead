import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Question.dart';

class ApiService {
  static const String _baseUrl =
      'https://the-trivia-api.com/v2/questions?tags=soccer';

  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data is List<dynamic>) {
        final questions = data;
        return questions.map((json) => Question.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected response format: ${response.body}');
      }
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
