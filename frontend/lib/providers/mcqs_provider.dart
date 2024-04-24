// Importing necessary libraries
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/screens/quiz_screen.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../utils/consts/app_urls.dart';

// McqsProvider class, responsible for fetching multiple-choice questions (MCQs) from the server
class McqsProvider extends ChangeNotifier {
  bool _isLoading = false; // Flag to track loading state
  bool get isLoading => _isLoading; // Getter for loading state

  List _mcqQuestions = []; // List to store MCQ questions
  List get mcqQuestions => _mcqQuestions; // Getter for MCQ questions

  // Function to fetch MCQs for a given topic from the server
  Future<void> getMcqs(String topic) async {
    clear(); // Clear existing MCQ questions
    loading(true); // Set loading state to true
    try {
      final url = Uri.parse(AppUrls.mcqsGeneratorUrl); // Construct URL for MCQs
      final res = await http.post(
        // Send POST request to the server
        url,
        body: jsonEncode({"content": topic}), // Request body with topic
        headers: {'Content-Type': 'application/json'}, // Request headers
      );
      if (res.statusCode == 200) {
        loading(false); // Set loading state to false
        _mcqQuestions = jsonDecode(
            res.body)["questions"]; // Extract MCQ questions from response
        notifyListeners(); // Notify listeners about the change in data
        Get.to(() => QuizScreen(
            quetions:
                mcqQuestions)); // Navigate to QuizScreen with the fetched MCQs
      } else {
        loading(false); // Set loading state to false in case of error
      }
    } catch (err) {
      loading(false); // Set loading state to false in case of error
      throw Exception(err); // Throw exception for error handling
    }
  }

  // Function to update loading state
  void loading(bool val) {
    _isLoading = val; // Update loading state
    notifyListeners(); // Notify listeners about the change in loading state
  }

  // Function to clear MCQ questions
  void clear() {
    _mcqQuestions = []; // Clear MCQ questions
    notifyListeners(); // Notify listeners about the change in data
  }
}
