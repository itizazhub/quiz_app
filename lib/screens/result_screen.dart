import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';
import 'package:quiz_app/screens/start_screen.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.answers});
  final List answers;

  void _goBack(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return StartScreen();
    }));
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': answers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final totalQuestion = questions.length;
    final totalCorrectAnswers = summary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
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
                'You answered $totalCorrectAnswers out of $totalQuestion questions correctly!',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 200, 253),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summary),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  _goBack(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz!'),
              )
            ],
          ),
        ));
  }
}
