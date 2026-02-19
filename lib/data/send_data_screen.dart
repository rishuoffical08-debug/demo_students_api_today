import 'package:demo_students_apis/data/receive_data_screen.dart';
import 'package:demo_students_apis/student_model.dart';
import 'package:flutter/material.dart';



class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameC=TextEditingController();

    return Scaffold(
      body:Column(
        children: [
          TextField(
            controller: nameC,
          ),
          ElevatedButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(studentModel: StudentModel(name: nameC.text, email: "ram@gmail.com", password: "123456", phone: 8765345678, address: "Amnour"),)));
          }, child:Text("Button"))
        ],
      ),
    );
  }
}
