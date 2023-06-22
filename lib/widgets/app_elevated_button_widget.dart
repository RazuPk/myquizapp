import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppElevatedButtonWidget extends StatelessWidget {
  const AppElevatedButtonWidget({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.all(12.0)
        ),
        onPressed: onTap,
        child: Text(title,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600,letterSpacing: 0.6),),
      ),
    );
  }
}