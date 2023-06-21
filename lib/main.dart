// import the material package
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import 'models/db_connect.dart';
import 'models/question_model.dart';// the file we just created.

// run the main method
void main() {
  // the runAPp method
  var db=DBconnect();
  db.addNewQuestion(
    Question(id: '21', title: 'What is 30 + 30 ?', options: {'60': true,'70':false,'50':false,'80':false})
  );
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
      home: HomeScreen(), // we will create this in separate file.
    );
  }
}