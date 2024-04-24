// Importing necessary libraries
import 'package:flutter/material.dart';

// QuizQuestion class, represents the widget for displaying a quiz question
class QuizQuestion extends StatelessWidget {
  // Properties of the quiz question widget
  final int index; // Index of the question
  final String questionText; // Text of the question
  final List<String> answers; // List of answer options
  final Function(String)
      answerQuestion; // Function to handle answering the question

  // Constructor for QuizQuestion
  const QuizQuestion({
    Key? key,
    required this.index,
    required this.questionText,
    required this.answers,
    required this.answerQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Container to display the question text
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(12)),
            child: Text(
              "${index + 1}. $questionText", // Displaying question number and text
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20), // Spacer
          const Text(
            "Options", // Text indicating answer options
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10), // Spacer
          // Mapping through answer options to display them
          ...answers.map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: InkWell(
                  onTap: () =>
                      answerQuestion(answer), // Handling tap on answer option
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: Text(
                      answer, // Displaying answer option
                      style: const TextStyle(fontSize: 20),
                    ),
                  )),
            );
          }).toList(), // Converting answer widgets to a list
        ],
      ),
    );
  }
}
