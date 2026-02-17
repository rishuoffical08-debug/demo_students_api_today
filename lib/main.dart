import 'package:demo_students_apis/all_students_screen.dart';
import 'package:demo_students_apis/api_service.dart';
import 'package:demo_students_apis/student_model.dart';
import 'package:flutter/material.dart';

import 'add_screen.dart';

void main()async{

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AllStudentsScreen(),
    );
  }
}
