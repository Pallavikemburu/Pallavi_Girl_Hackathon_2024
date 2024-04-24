// Importing necessary libraries
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/providers/analysis_provider.dart';
import 'package:frontend/providers/mcqs_provider.dart';
import 'package:frontend/providers/topic_provider.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:provider/provider.dart';

// Main function, the entry point of the application
void main() {
  // Ensure that Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Set preferred device orientations
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Override Http Client to handle insecure connections
  HttpOverrides.global = MyHttpOverrides();
  // Run the app
  runApp(
      // Wrap the app with MultiProvider to provide multiple providers to the app
      MultiProvider(
    providers: [
      // Provide the TopicProvider to manage topic-related state
      ChangeNotifierProvider(create: (_) => TopicProvider()),
      // Provide the McqsProvider to manage multiple choice questions state
      ChangeNotifierProvider(create: (_) => McqsProvider()),
      // Provide the AnalysisProvider to manage analysis-related state
      ChangeNotifierProvider(create: (_) => AnalysisProvider())
    ],
    // Instantiate the main app
    child: const MainApp(),
  ));
}

// Override HttpOverrides to handle insecure connections
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      // Allow bad certificates (for testing purposes)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// MainApp class, represents the main application widget
class MainApp extends StatelessWidget {
  // Constructor for MainApp
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return the GetMaterialApp widget, which initializes the app with GetX navigation
    return GetMaterialApp(
      // Hide debug banner
      debugShowCheckedModeBanner: false,
      // Set the initial route to the LoginScreen
      home: LoginScreen(),
    );
  }
}
