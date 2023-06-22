import 'package:flutter/material.dart';
import 'package:myquizapp/screens/login_screen.dart';
import '../utils/app_colors.dart';
import '../utils/style.dart';
import '../widgets/app_elevated_button_widget.dart';
import '../widgets/app_text_button_widget.dart';
import '../widgets/app_text_field_widget.dart';
import '../widgets/screen_background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _dropDownValue = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'SignUp',
              style: titleTextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: primaryColor,
      ),
      body: ScreenBackgroundWidget(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Complete Profile',
                    style: titleTextStyle.copyWith(color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Get started with us with details',
                    style: subTitleTextStyle.copyWith(color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextFieldWidget(
                    controller: TextEditingController(),
                    hintText: 'Full Name',
                    validator: (value) {},
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextFieldWidget(
                    controller: TextEditingController(),
                    hintText: 'Email Address',
                    validator: (value) {},
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor,
                                      width: 2
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: primaryColor,
                                    width: 2,
                                  )
                              )
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: '0',
                              child: Text('User Type'),
                            ),
                            DropdownMenuItem(
                              value: '1',
                              child: Text('Teacher'),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text('Student'),
                            ),
                          ],
                          isExpanded: true,
                          value: _dropDownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropDownValue = newValue!;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextFieldWidget(
                    controller: TextEditingController(),
                    hintText: 'Password',
                    validator: (value) {},
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppElevatedButtonWidget(title: 'Submit', onTap: () {}),
                  const SizedBox(
                    height: 4,
                  ),
                  AppTextButtonWidget(
                      summaryText: "Have account?",
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
                      },
                      buttonText: 'Login'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}