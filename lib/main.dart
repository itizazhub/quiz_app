import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/start_screen.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  Quiz({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
