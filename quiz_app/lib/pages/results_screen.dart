import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';
import 'package:quiz_app/models/quiz_modle.dart';
import 'package:quiz_app/pages/start_screen.dart';

class ResultsScreen extends StatefulWidget {
  final QuizModel model;
  final List<String> choosenAnswers;

  const ResultsScreen(
      {Key? key, required this.model, required this.choosenAnswers})
      : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    //final QuizModel model = QuizModel(questions: questions);
    double scorePercentage = widget.model.score / 10;
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
        title: const Text(
          'Your Score',
          style: TextStyle(fontSize: 26),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          children: [
            CircularPercentIndicator(
              radius: 65,
              percent: scorePercentage,
              progressColor: Color.fromARGB(255, 122, 244, 126),
              backgroundColor: Color.fromARGB(255, 203, 87, 87),
              reverse: true,
              center: Text(
                "${widget.model.score} / 10",
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: widget.choosenAnswers.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      //dense: true,
                      selected: widget.choosenAnswers[index] ==
                              "You missed this question!"
                          ? false
                          : true,
                      enabled: widget.choosenAnswers[index] ==
                                  "You missed this question!" ||
                              widget.choosenAnswers[index] ==
                                  questions[index].correctAnswer
                          ? false
                          : true,
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                automaticallyImplyLeading: false,
                                centerTitle: true,
                                backgroundColor:
                                    const Color.fromARGB(255, 158, 42, 178),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20),
                                  ),
                                ),
                                title:
                                    Text("Question ${(index + 1).toString()} "),
                              ),
                              body: Center(
                                child: Hero(
                                    tag: "df",
                                    child: Material(
                                      child: ListTile(
                                        //isThreeLine: true,
                                        title: Text(
                                          widget.model.allQuestions[index]
                                              .questionName!,
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 105, 88, 87)),
                                        ),
                                        subtitle: Text(
                                          "Correct answer: ${questions[index].correctAnswer!}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 36, 189, 13)),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )),
                              ),
                            );
                          }),
                        );
                      },

                      tileColor: const Color.fromARGB(255, 182, 173, 173)
                          .withOpacity(0.8),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: widget.choosenAnswers[index] ==
                                questions[index].correctAnswer
                            ? Colors.green
                            : Colors.red,
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      title: Text(
                        widget.choosenAnswers[index],
                        //textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 105, 88, 87)),
                      ),

                      subtitle: Text(
                        widget.choosenAnswers[index] ==
                                    "You missed this question!" ||
                                widget.choosenAnswers[index] ==
                                    questions[index].correctAnswer
                            ? ""
                            : "Tap to see the Question and its correct answer",
                        // "Correct answer: ${questions[index].correctAnswer!}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 36, 189, 13)),
                      ),
                    ),
                  );
                },
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const StartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.restart_alt),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text(
                "Restart quiz",
              ),
            )
          ],
        ),
      ),
    );
  }
}
