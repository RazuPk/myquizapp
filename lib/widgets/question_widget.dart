import 'package:flutter/material.dart';
import '../utils/app_colors.dart'; // it contains our colors.

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
        required this.question,
        required this.indexAction,
        required this.totalQuestions})
      : super(key: key);
  // here we need the question title and the total number of questions, and also the index

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      alignment: Alignment.centerLeft,
      padding:const EdgeInsets.all(16.0),
      decoration:const BoxDecoration(
        color:background,
      ),
      child: Text(
        'Question ${indexAction + 1}/$totalQuestions: $question',
        style: const TextStyle(
          fontSize: 20.0,
          color: neutral,
        ),
      ),
    );
  }
}