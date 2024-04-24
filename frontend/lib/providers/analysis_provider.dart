import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/utils/consts/app_urls.dart';

import 'package:http/http.dart' as http;

class AnalysisProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _analytics = "";
  String get analytics => _analytics;

  // Function to fetch analysis data from the server
  Future<void> getAnaly(String topic, String result) async {
    clear(); // Clear existing analysis data
    loading(true); // Set loading state to true
    try {
      final url = Uri.parse(AppUrls.analysisUrl); // Construct URL
      final res = await http.post(
        // Send POST request to the server
        url,
        body: jsonEncode({
          "topic": topic,
          "result": result
        }), // Request body with topic and result
        headers: {'Content-Type': 'application/json'}, // Request headers
      );
      if (res.statusCode == 200) {
        loading(false); // Set loading state to false
        _analytics = jsonDecode(
            res.body)["response"]; // Extract analysis data from response
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

// Function to clear analysis data
  void clear() {
    _analytics = ""; // Clear analysis data
    notifyListeners(); // Notify listeners about the change in data
  }
}
