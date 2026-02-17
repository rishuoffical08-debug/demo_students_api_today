import 'package:demo_students_apis/api_service.dart';
import 'package:demo_students_apis/student_model.dart';
import 'package:flutter/material.dart';



class StudentUpdateScreen extends StatefulWidget {
  final String name;
  const StudentUpdateScreen({required this.name});


  @override
  State<StudentUpdateScreen> createState() => _StudentUpdateScreenState();
}

class _StudentUpdateScreenState extends State<StudentUpdateScreen> {



  TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController(text: widget.name);
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressedController = TextEditingController();
  late TextEditingController _controller;
  ApiService apiService=ApiService();
  @override
  void initState() {
    super.initState();
    _controller=TextEditingController(text: widget.name);

  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Text("name: ${widget.name}"),
          TextField(
            controller:_controller ,
          ),
          TextField(
            controller: emailController,
          ),
          TextField(
            controller:passwordController ,
          ),
          TextField(
            controller: phoneController,
          ),
          TextField(
            controller: addressedController,
          ),
          ElevatedButton(onPressed: ()async{
            final newStudent=StudentModel(name: nameController.text, email: emailController.text, password: passwordController.text, phone: int.parse(phoneController.text), address: addressedController.text);
          // final update=await  apiService.updateStudent(sID, newStudent);
            setState(() {

            });

          }, child: Text('update student'))

        ],
      ),
    );
  }
}
