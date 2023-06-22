import 'package:flutter/material.dart';

class AppTextButtonWidget extends StatelessWidget {
  const AppTextButtonWidget({
    super.key,
    required this.onTap,
    required this.summaryText,
    required this.buttonText,
  });

  final VoidCallback onTap;
  final String summaryText, buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(summaryText),
        TextButton(onPressed: onTap, child: Text(buttonText)),
      ],
    );
  }
}