import 'package:flutter/material.dart';
import '../../screens/quiz_screen.dart';
import '../utils/app_colors.dart';
import '../utils/style.dart';
import '../widgets/app_bar_profile_widget.dart';
import '../widgets/app_quiz_card_widget.dart';
import '../widgets/screen_background_widget.dart';
import 'add_new_quiz_screen.dart';

class DashboardScreen extends StatefulWidget {
  final String userType;

  const DashboardScreen({super.key, required this.userType});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarProfileWidget(),
        backgroundColor: primaryColor,
      ),
      body: ScreenBackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${widget.userType}'s Dashboard",
                style: titleTextStyle.copyWith(color: primaryColor),
              ),
              const SizedBox(height: 32,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppQuizCardWidget(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewQuizScreen()));
                          },
                          iconData: Icons.quiz,
                          cardText: '  Add Quiz  ',
                          cardColor: primaryColor,
                        ),
                        AppQuizCardWidget(
                          onTap: () {},
                          iconData: Icons.quiz_outlined,
                          cardText: 'Quiz Result',
                          cardColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: AppQuizCardWidget(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuizScreen()));
                        },
                        iconData: Icons.quiz_outlined,
                        cardText: 'Quiz Questions List',
                        cardColor: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
