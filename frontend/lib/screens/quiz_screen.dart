// Importing necessary libraries
import 'package:flutter/material.dart';// Importing custom quiz question widget
import 'package:frontend/providers/analysis_provider.dart';
import 'package:frontend/providers/topic_provider.dart';
import 'package:frontend/utils/consts/app_colors.dart';
import 'package:frontend/widgets/quiz_question.dart';
import 'package:provider/provider.dart';

// QuizScreen class, represents the screen where the quiz is displayed and managed
class QuizScreen extends StatefulWidget {
  final List quetions; // List of quiz questions
  const QuizScreen({Key? key, required this.quetions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

// State class for QuizScreen
class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0; // Index of the current question
  int _score = 0; // Score of the quiz

  // Function to handle answering a question
  void _answerQuestion(String selectedAnswer) {
    if (widget.quetions[_questionIndex]['correct_answer'] == selectedAnswer) {
      // Increase score if the selected answer is correct
      setState(() {
        _score++;
      });
    }
    // Move to the next question
    _nextQuestion();
  }

  // Function to move to the next question
  void _nextQuestion() {
    setState(() {
      _questionIndex++;
    });
    // If all questions are answered, show the result dialog
    if (_questionIndex >= widget.quetions.length) {
      final analysisController =
          Provider.of<AnalysisProvider>(context, listen: false);
      final topicController =
          Provider.of<TopicProvider>(context, listen: false);
      analysisController.getAnaly(topicController.genContent, "$_score");
      _showResultDialog();
    }
  }

  // Function to show the result dialog
  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Quiz Completed\nYour score: $_score / ${widget.quetions.length}'),
          content: Consumer<AnalysisProvider>(
            builder: (context, value, child) => value.isLoading
                ? IntrinsicHeight(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Text(
                    value.analytics,
                    textAlign: TextAlign.justify,
                  )),
          ),
          actions: [
            // Show different actions based on the score
            _score <= 2
                ? TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _resetQuiz();
                    },
                    child: const Text('Retake Quiz'),
                  )
                : TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Exit Quiz'),
                  ),
          ],
        );
      },
    );
  }

  // Function to reset the quiz
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with background color and app bar
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
            "$_questionIndex / ${widget.quetions.length}"), // Show current question index
        centerTitle: true,
      ),
      body: _questionIndex < widget.quetions.length
          ? QuizQuestion(
              // Display the QuizQuestion widget if there are more questions
              index: _questionIndex,
              questionText:
                  widget.quetions[_questionIndex]['question'] as String,
              answers: [
                widget.quetions[_questionIndex]["option1"],
                widget.quetions[_questionIndex]["option2"],
                widget.quetions[_questionIndex]["option3"],
                widget.quetions[_questionIndex]["option4"]
              ],
              answerQuestion: _answerQuestion,
            )
          : const Center(
              child: Text('End of Quiz'), // Display end of quiz message
            ),
    );
  }
}
