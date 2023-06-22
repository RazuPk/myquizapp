import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScreenBackgroundWidget extends StatelessWidget {
  final Widget child;
  const ScreenBackgroundWidget({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/background.svg',
          fit: BoxFit.cover,
          width: screenSize.width,
          height: screenSize.height,
        ),
        child
      ],
    );
  }
}