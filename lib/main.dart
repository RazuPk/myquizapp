// import the material package
import 'package:flutter/material.dart';
import '../../screens/splash_screen.dart';

// run the main method
void main() {
  runApp(
    const MyApp(), // we will create this below
  );
}

// create the MyApp widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // remove the debug banner
      debugShowCheckedModeBanner: false,
      // set a homepage
      home: SplashScreen(), // we will create this in separate file.
    );
  }
}