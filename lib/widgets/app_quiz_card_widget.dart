import 'package:flutter/material.dart';

class AppQuizCardWidget extends StatelessWidget {
  const AppQuizCardWidget({
    super.key, required this.onTap, this.iconData, required this.cardText, this.cardColor,
  });
  final VoidCallback onTap;
  final IconData? iconData;
  final String cardText;
  final Color? cardColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(iconData,size: 42,color: Colors.white,),
              const SizedBox(height: 6,),
              Text(cardText,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}