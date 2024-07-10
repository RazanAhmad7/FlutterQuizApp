import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions_modle.dart';
import 'package:quiz_app/models/quiz_modle.dart';
import 'package:quiz_app/pages/results_screen.dart';

class QuizPage extends StatefulWidget {
  final QuizModel model;

  const QuizPage({Key? key, required this.model}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  int start = 9;
  late Timer _timer;
  late AnimationController controller;
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        widget.model.checkAnswer(null);
        widget.model.addSelectedAnswer("You missed this question!");

        timer.cancel();

        _moveToNextQuestion();
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 158, 42, 178),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text(
          'Question ${questionNumber()}',
          style: const TextStyle(fontSize: 26),
        ),
      ),
      body: Center(
        child: quizScreens(),
      ),
    );
  }

  Widget quizScreens() {
    final question = widget.model.currentQuestion;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: controller.value,
            ),
          ),
          SizedBox(
            height: 190,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              question.questionName!,
              style: const TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          customeButton(question, 0),
          customeButton(question, 1),
          customeButton(question, 2),
          customeButton(question, 3),
        ],
      ),
    );
  }

  ElevatedButton customeButton(Question question, int answerNum) {
    String selectedAnswer;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          //minimumSize: const Size(400.0, 40.0),
          fixedSize: Size(350, 40),
          textStyle: const TextStyle(fontSize: 18),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          foregroundColor: const Color.fromARGB(255, 247, 247, 247),
          backgroundColor: const Color.fromARGB(255, 60, 14, 75)),
      onPressed: () {
        _timer.cancel();
        selectedAnswer = question.answers![answerNum];
        widget.model.checkAnswer(selectedAnswer);
        widget.model.addSelectedAnswer(selectedAnswer);
        _moveToNextQuestion();
      },
      child: Text(question.answers![answerNum]),
    );
  }

  void _moveToNextQuestion() {
    start = 2;
    if (widget.model.isLastQuestion()) {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ResultsScreen(
              model: widget.model,
              choosenAnswers: widget.model.allSelectedAnswers),
        ),
      );
    } else {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => QuizPage(model: widget.model),
        ),
      );
    }
  }

  int questionNumber() {
    final question = widget.model.currentQuestion;
    return widget.model.allQuestions.indexOf(question) + 1;
  }
}
