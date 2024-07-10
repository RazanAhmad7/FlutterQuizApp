import '../models/questions_modle.dart';

List<Question> questions = [
  Question(
    questionName:
        "What is the programming language used to develop Flutter applications?",
    answers: ["Dart", "Kotlin", "Swift", "Java"],
    correctAnswer: "Dart",
  ),
  Question(
    questionName: "Which widget is used to create a button in Flutter?",
    answers: ["Text", "Container", "Button", "RaisedButton"],
    correctAnswer: "RaisedButton",
  ),
  Question(
    questionName: "What is the default orientation of widgets in Flutter??",
    answers: ["Vertical", "Horizontal", "Diagonal", "Circular"],
    correctAnswer: "Vertical",
  ),
  Question(
    questionName: "Which of these is NOT a built-in widget in Flutter?",
    answers: ["Text", "Row", "Column", "Container"],
    correctAnswer: "Text", // It's a basic building block, not a widget
  ),
  Question(
    questionName:
        "What is the primary way to manage application state in Flutter?",
    answers: ["Shared preferences", "Provider", "Bloc", "All of the above"],
    correctAnswer: "All of the above",
  ),
  Question(
    questionName:
        "What command is used to create a new Flutter project from the command line?",
    answers: [
      "new flutter project",
      "flutter start",
      "flutter create",
      "create flutter project"
    ],
    correctAnswer: "flutter create",
  ),
  Question(
    questionName:
        "Which of the following is used to navigate between screens in Flutter?",
    answers: ["NavigationBar", "TabBar", "AppBar", "Navigator"],
    correctAnswer: "Navigator",
  ),
  Question(
    questionName:
        "What Flutter widget is used to display a list of items that can be scrolled?",
    answers: ["ListView", "GridView", "ScrollList", "ScrollableList"],
    correctAnswer: "ListView",
  ),
  Question(
    questionName: "How do you add interactivity to a Flutter app?",
    answers: [
      "Using stateful widgets",
      "Using stateless widgets",
      "Using containers",
      "Using rows and columns"
    ],
    correctAnswer: "Using stateful widgets",
  ),
  Question(
    questionName:
        "Which Flutter command is used to run the app on an Android emulator or connected device?",
    answers: ["flutter start", "flutter run", "run flutter", "flutter build"],
    correctAnswer: "flutter run",
  ),
];
