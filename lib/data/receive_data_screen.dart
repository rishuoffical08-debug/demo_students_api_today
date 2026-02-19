import 'package:demo_students_apis/student_model.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

StudentModel studentModel;
   SecondScreen({super.key, required this.studentModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Text("name : ${studentModel.name}, email :${studentModel.email}, phone :${studentModel.phone},, address :${studentModel.address}"),
          Text("email : ${studentModel.email}"),

        ],
      ),
    );
  }
}
