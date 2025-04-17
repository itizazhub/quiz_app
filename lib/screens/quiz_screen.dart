import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key});
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  final allQuestions = questions;
  final selectedAnswers = [];

  void _onTap(context, String answer) {
    setState(() {
      if (selectedAnswers.length == allQuestions.length) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ResultScreen(
            answers: selectedAnswers,
          );
        }));
      } else {
        selectedAnswers.add(answer);
        if (_currentQuestionIndex < allQuestions.length - 1) {
          // Only increment if there are more questions left
          _currentQuestionIndex++;
        }
      }
    });
  }

  void _goBack(context) {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
      return StartScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = allQuestions[_currentQuestionIndex];
    final shuffledAnswers =
        allQuestions[_currentQuestionIndex].getShuffledAnswers();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                _goBack(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 18,
              )),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 400,
                child: ListView.builder(
                    itemCount: shuffledAnswers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _onTap(context, shuffledAnswers[index]);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 33, 1, 95),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Text(
                            shuffledAnswers[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                                fontSize: 15, color: Colors.white),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
