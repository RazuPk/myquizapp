import 'package:flutter/material.dart';
import 'package:myquizapp/screens/dashboard_screen.dart';
import '../models/db_connect.dart';
import '../models/question_model.dart';
import '../utils/app_colors.dart';
import '../utils/style.dart';
import '../widgets/app_elevated_button_widget.dart';
import '../widgets/app_text_field_widget.dart';
import '../widgets/screen_background_widget.dart';

class AddNewQuizScreen extends StatefulWidget {
  const AddNewQuizScreen({super.key});

  @override
  State<AddNewQuizScreen> createState() => _AddNewQuizScreenState();
}

class _AddNewQuizScreenState extends State<AddNewQuizScreen> {
  final TextEditingController _titleETController = TextEditingController();
  final TextEditingController _optionOneETController = TextEditingController();
  final TextEditingController _optionTowETController = TextEditingController();
  final TextEditingController _optionThreeETController =
      TextEditingController();
  final TextEditingController _optionFourETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isCheckedOne = false,
      isCheckedTow = false,
      isCheckedThree = false,
      isCheckedFour = false;
  var db = DbConnect();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Quiz'),
        backgroundColor: primaryColor,
      ),
      body: ScreenBackgroundWidget(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Add New Quiz',
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'N.B:Please insert Question with Selected correct Answer of 4 options..',
                      style: subTitleTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    AppTextFieldWidget(
                      controller: _titleETController,
                      hintText: 'Type your Question here...',
                      maxLines: 4,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter question first';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isCheckedOne,
                          title: AppTextFieldWidget(
                            controller: _optionOneETController,
                            hintText: 'Option 1',
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Enter Option 1';
                              }
                              return null;
                            },
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedOne = value!;
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isCheckedTow,
                          title: AppTextFieldWidget(
                            controller: _optionTowETController,
                            hintText: 'Option 2',
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Enter Option 2';
                              }
                              return null;
                            },
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedTow = value!;
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isCheckedThree,
                          title: AppTextFieldWidget(
                            controller: _optionThreeETController,
                            hintText: 'Option 3',
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Enter Option 3';
                              }
                              return null;
                            },
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedThree = value!;
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isCheckedFour,
                          title: AppTextFieldWidget(
                            controller: _optionFourETController,
                            hintText: 'Option 4',
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Enter Option 4';
                              }
                              return null;
                            },
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedFour = value!;
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : AppElevatedButtonWidget(
                              title: 'Submit',
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                 await db.addNewQuestion(
                                    Question(
                                      id: 'new',
                                      title: _titleETController.text,
                                      options: {
                                        _optionOneETController.text:
                                            isCheckedOne,
                                        _optionTowETController.text:
                                            isCheckedTow,
                                        _optionThreeETController.text:
                                            isCheckedThree,
                                        _optionFourETController.text:
                                            isCheckedFour
                                      },
                                    ),
                                  ).then((value) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashboardScreen(userType: 'Teacher')));
                                  }).onError((error, stackTrace) {
                                    print('error, $error.toString()');
                                    setState(() {
                                      isLoading = false;
                                    });
                                  });
                                }
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
