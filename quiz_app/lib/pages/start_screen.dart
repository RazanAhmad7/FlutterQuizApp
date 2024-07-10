import 'package:flutter/material.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';
import 'package:quiz_app/models/quiz_modle.dart';
import 'package:quiz_app/pages/quiz.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final QuizModel model = QuizModel(allQuestions: questions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: -0.1,
              child: Image.asset(
                "assets/images/quiz-logo.png",
                width: 250,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Text(
              'Flutter Quiz App',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 223, 212, 242),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            OutlinedButton.icon(
              onPressed: () => showCardPopup(context, customCard()),
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text(
                "Start quiz",
              ),
            ),
            TextButton.icon(
              onPressed: () => ratingDialog(),
              label: const Text('Rate Us'),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customCard() {
    return Column(
      children: [
        const ListTile(
          title: Text(
            '''Are you ready ?
              ''',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            "You will have 10 general questions about flutter within 100 seconds.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => QuizPage(model: model),
                  ),
                );
              },
              child: const Text(
                "Let's get started!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "No",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void ratingDialog() {
    bool isp1 = false;
    bool isp2 = false;
    bool isp3 = false;
    bool isp4 = false;
    bool isp5 = false;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 215.0,
              width: 450,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Transform.rotate(
                      angle: -0.1,
                      child: Image.asset(
                        "assets/images/quiz-logo.png",
                        width: 75,
                        color: const Color.fromARGB(255, 158, 42, 178),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Let us know your feedback!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          iconSize: 10,
                          onPressed: () {
                            setState(() {
                              isp1 = !isp1;
                              if (isp5 == true ||
                                  isp4 == true ||
                                  isp3 == true ||
                                  isp2 == true) {
                                isp5 = false;
                                isp4 = false;
                                isp3 = false;
                                isp2 = false;
                                isp1 = true;
                              }
                            });
                          },
                          icon: isp1
                              ? const Icon(
                                  Icons.star,
                                  size: 32,
                                )
                              : const Icon(
                                  Icons.star_border,
                                  size: 32,
                                ),
                          color: Colors.yellow,
                        ),
                        IconButton(
                          iconSize: 10,
                          onPressed: () {
                            setState(() {
                              isp2 = !isp2;
                              isp1 = isp2;
                              if (isp5 == true ||
                                  isp4 == true ||
                                  isp3 == true) {
                                isp5 = false;
                                isp4 = false;
                                isp3 = false;
                                isp1 = true;
                                isp2 = true;
                              }
                            });
                          },
                          icon: isp2
                              ? const Icon(
                                  Icons.star,
                                  size: 32,
                                )
                              : const Icon(
                                  Icons.star_border,
                                  size: 32,
                                ),
                          color: Colors.yellow,
                        ),
                        IconButton(
                          iconSize: 10,
                          onPressed: () {
                            setState(() {
                              isp3 = !isp3;
                              isp1 = isp3;
                              isp2 = isp3;
                              if (isp5 == true || isp4 == true) {
                                isp5 = false;
                                isp4 = false;
                                isp1 = true;
                                isp2 = true;
                                isp3 = true;
                              }
                            });
                          },
                          icon: isp3
                              ? const Icon(
                                  Icons.star,
                                  size: 32,
                                )
                              : const Icon(
                                  Icons.star_border,
                                  size: 32,
                                ),
                          color: Colors.yellow,
                        ),
                        IconButton(
                          iconSize: 10,
                          onPressed: () {
                            setState(() {
                              isp4 = !isp4;
                              isp1 = isp4;
                              isp2 = isp4;
                              isp3 = isp4;
                              if (isp5 == true) {
                                isp5 = false;
                                isp4 = true;
                                isp1 = true;
                                isp2 = true;
                                isp3 = true;
                              }
                            });
                          },
                          icon: isp4
                              ? const Icon(
                                  Icons.star,
                                  size: 32,
                                )
                              : const Icon(
                                  Icons.star_border,
                                  size: 32,
                                ),
                          color: Colors.yellow,
                        ),
                        IconButton(
                          iconSize: 10,
                          onPressed: () {
                            setState(() {
                              isp5 = !isp5;
                              isp1 = isp5;
                              isp2 = isp5;
                              isp3 = isp5;
                              isp4 = isp5;
                            });
                          },
                          icon: isp5
                              ? const Icon(
                                  Icons.star,
                                  size: 32,
                                )
                              : const Icon(
                                  Icons.star_border,
                                  size: 32,
                                ),
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  void showCardPopup(BuildContext context, Widget a) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          content: SizedBox(
            height: 190.0,
            width: 330,
            child: Center(
              child: a,
            ),
          ),
        );
      },
    );
  }
}
