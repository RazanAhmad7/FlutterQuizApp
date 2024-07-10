import 'package:flutter/material.dart';
import 'package:quiz_app/pages/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 158, 42, 178),
      ),
      home: const StartScreen(),
    );
  }
}
