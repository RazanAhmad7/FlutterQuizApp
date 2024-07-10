import 'package:quiz_app/models/questions_modle.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';

class QuizModel {
  List<Question> allQuestions = questions;
  int currentQuestionIndex = 0;
  int score = 0;
  List<String> allSelectedAnswers = [];

  QuizModel({required this.allQuestions});

  Question get currentQuestion {
    if (currentQuestionIndex < questions.length) {
      return questions[currentQuestionIndex];
    }
    return questions[0];
  }

  void addSelectedAnswer(String selectedAnswer) {
    allSelectedAnswers.add(selectedAnswer);
  }

  void checkAnswer(String? selectedAnswer) {
    if (selectedAnswer == currentQuestion.correctAnswer) {
      score++;
    }
    currentQuestionIndex++;
  }

  //single-line function
  bool isLastQuestion() => currentQuestionIndex == questions.length;

  int getScore() => score;
}
