// Importing necessary libraries
import 'package:flutter/material.dart';
import 'package:frontend/utils/consts/app_colors.dart';
import 'package:get/get.dart'; // For navigation and snackbar // Importing custom color constants
import 'package:lottie/lottie.dart';

import 'home_screen.dart'; // For displaying Lottie animations

// LoginScreen class, represents the screen where users can login
class LoginScreen extends StatelessWidget {
  // Controllers for text fields
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  // Hardcoded username and password for demonstration
  final String username = 'girl';
  final String password = '1234';
  // Key for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Constructor for LoginScreen
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with background color
      backgroundColor: AppColors.secondaryColor,
      body: NotificationListener<OverscrollIndicatorNotification>(
        // Notification listener to disallow overscroll indicator
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Form(
            // Form to handle form submission
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                // Text widget with message
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Learning is  creating a path to\nyour career...',
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 25),
                // Lottie animation widget
                Lottie.asset(
                  'assets/login.json',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                // Text form fields for username and password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.primaryColor,
                          ),
                          border: outlineBorder(AppColors.primaryColor),
                          focusedBorder: outlineBorder(AppColors.primaryColor),
                          enabledBorder: outlineBorder(AppColors.primaryColor),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: AppColors.primaryColor),
                          border: outlineBorder(AppColors.primaryColor),
                          prefixIcon: Icon(
                            Icons.password,
                            color: AppColors.primaryColor,
                          ),
                          focusedBorder: outlineBorder(AppColors.primaryColor),
                          enabledBorder: outlineBorder(AppColors.primaryColor),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      // Elevated button for login
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Check if username and password match
                            if (username == usernameController.text.trim() &&
                                password == passwordController.text.trim()) {
                              // Navigate to HomeScreen if credentials are correct
                              Get.to(() => const HomeScreen());
                            } else {
                              // Show snackbar for invalid credentials
                              Get.snackbar("Warning", "Invalid Credentials",
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to define outline border
  OutlineInputBorder outlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }
}
