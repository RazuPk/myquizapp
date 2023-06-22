

import 'package:flutter/material.dart';
import 'package:myquizapp/screens/dashboard_screen.dart';
import 'package:myquizapp/screens/signup_screen.dart';

import '../utils/app_colors.dart';
import '../utils/style.dart';
import '../widgets/app_elevated_button_widget.dart';
import '../widgets/app_text_button_widget.dart';
import '../widgets/app_text_field_widget.dart';
import '../widgets/screen_background_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz App',
          style: titleTextStyle.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: ScreenBackgroundWidget(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: titleTextStyle.copyWith(color: Colors.blue),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Please Login your account to continue',
                  style: subTitleTextStyle.copyWith(color: Colors.black54),
                ),
                const SizedBox(
                  height: 8,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Email address',
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Password',
                  obscureText: true,
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                AppElevatedButtonWidget(
                  title: 'Login',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const DashboardScreen(userType: 'Teacher')), (route) => false);
                  },
                ),
                AppTextButtonWidget(
                    summaryText: "Don't have an account?",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                    },
                    buttonText: 'Sign Up'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}