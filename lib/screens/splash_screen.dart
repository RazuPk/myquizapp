import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/style.dart';
import '../widgets/screen_background_widget.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false)
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz App',
                      style: titleTextStyle.copyWith(fontSize: 26,
                          color: primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Test Your Knowledge - Take the Quiz!',
                      style: subTitleTextStyle.copyWith(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const CircularProgressIndicator(
                  color: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Version 1.0', style: subTitleTextStyle,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}