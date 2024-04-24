// Importing necessary libraries
import 'package:flutter/material.dart';
import 'package:frontend/providers/mcqs_provider.dart';
import 'package:frontend/providers/topic_provider.dart';
import 'package:frontend/utils/consts/app_textstyles.dart';

import 'package:provider/provider.dart';

import '../utils/consts/app_colors.dart';

// HomeScreen class, represents the screen where users can search for topics and take tests
class HomeScreen extends StatefulWidget {
  // Constructor for HomeScreen
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// State class for HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  // Controller for the topic text field
  final topicController = TextEditingController();
  // Key for the form
  final formKey = GlobalKey<FormState>();
  // Focus node for the topic text field
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    // Dispose of the controllers and focus node
    topicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with app bar and background color
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        // Notification listener to disallow overscroll indicator
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          // SingleChildScrollView to make the content scrollable
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Consumer2<TopicProvider, McqsProvider>(
            // Consumer to listen to changes in TopicProvider and McqsProvider
            builder: (context, topicProvider, mcqsProvider, child) => Form(
              // Form to handle form submission
              key: formKey,
              child: Column(
                children: [
                  // Text field to enter topic
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            // Text form field for topic input
                            focusNode: _focusNode,
                            controller: topicController,
                            decoration: InputDecoration(
                              hintText: 'Enter your topic to learn',
                              labelStyle: TextStyle(
                                color: AppColors.primaryColor,
                              ),
                              border: outlineBorder(AppColors.primaryColor),
                              focusedBorder:
                                  outlineBorder(AppColors.primaryColor),
                              enabledBorder:
                                  outlineBorder(AppColors.primaryColor),
                            ),
                            validator: (value) {
                              // Validation for topic input
                              if (value!.isEmpty) {
                                return "Please enter the topic";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        topicProvider.isLoading
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                color: AppColors.primaryColor,
                              )
                            : GestureDetector(
                                // Search button
                                onTap: () {
                                  _focusNode.unfocus();
                                  if (formKey.currentState!.validate()) {
                                    topicProvider.getContent(
                                        topicController.text.trim());
                                  }
                                },
                                child: Icon(
                                  Icons.search_rounded,
                                  color: AppColors.primaryColor,
                                ),
                              )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    // Display generated content
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      topicProvider.genContent,
                      style: AppTextStyles.bodyStyle,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  topicProvider.genContent.isNotEmpty
                      ? Align(
                          // Take test button
                          alignment: Alignment.centerRight,
                          child: mcqsProvider.isLoading
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: FloatingActionButton.extended(
                                    heroTag: "taketestbutton",
                                    elevation: 0,
                                    backgroundColor: AppColors.primaryColor,
                                    onPressed: () {
                                      mcqsProvider
                                          .getMcqs(topicProvider.genContent);
                                    },
                                    label: const Text("Take Test"),
                                  ),
                                ),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to define outline border
  OutlineInputBorder outlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }
}
