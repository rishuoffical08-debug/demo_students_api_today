import 'package:demo_students_apis/data/show_data.dart';
import 'package:flutter/material.dart';
import 'data/send_data_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowData(),
    );
  }
}
