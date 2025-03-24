import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class StartScreen extends StatelessWidget {
  void _onStart(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return QuizScreen();
    }));
  }

  StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: const Color.fromARGB(255, 33, 5, 109),
          title: Text(
            "Quiz App",
            style: GoogleFonts.outfit(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 33, 5, 109),
                Color.fromARGB(255, 68, 21, 149),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/quiz-logo.png",
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: () {
                  _onStart(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: Text(
                  'Start Quiz',
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
