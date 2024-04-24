// Importing necessary libraries
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/utils/consts/app_urls.dart';
import 'package:http/http.dart' as http; // Importing HTTP client library

// TopicProvider class, responsible for fetching content related to a topic from the server
class TopicProvider extends ChangeNotifier {
  bool _isLoading = false; // Flag to track loading state
  bool get isLoading => _isLoading; // Getter for loading state

  String _genContent = ""; // Variable to store generated content
  String get genContent => _genContent; // Getter for generated content

  // Function to fetch content related to a topic from the server
  Future<void> getContent(String topic) async {
    clear(); // Clear existing generated content
    loading(true); // Set loading state to true
    try {
      final url = Uri.parse(AppUrls.contentGeneratorUrl); // Construct URL
      final res = await http.post(
        // Send POST request to the server
        url,
        body: jsonEncode({"topic": topic}), // Request body with topic
        headers: {'Content-Type': 'application/json'}, // Request headers
      );
      if (res.statusCode == 200) {
        loading(false); // Set loading state to false
        _genContent = jsonDecode(
            res.body)["response"]; // Extract generated content from response
        notifyListeners(); // Notify listeners about the change in data
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

  // Function to clear generated content
  void clear() {
    _genContent = ""; // Clear generated content
    notifyListeners(); // Notify listeners about the change in data
  }
}
