import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i, // Read out current index of question
          'question': questions[i].text, // Access text of each question
          'correct_answer': questions[i].answers[0], // First answer is correct
          'user_answer': chosenAnswers[i] // Read out user's chosen answer
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    // final summaryData = summaryData; This is no longer necessary!
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions Questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 231, 212, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.refresh,
                color: Color.fromARGB(255, 235, 208, 255),
              ),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Color.fromARGB(255, 235, 208, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
