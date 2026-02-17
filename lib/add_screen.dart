import 'package:demo_students_apis/student_model.dart';
import 'package:demo_students_apis/update_screen.dart';
import 'package:flutter/material.dart';
import 'all_students_screen.dart';
import 'api_service.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressedController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,

        title: Text("Add Screens Tasks"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "phone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: addressedController,
                  decoration: InputDecoration(
                    hintText: "addressed",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  final student = StudentModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    phone: int.parse(phoneController.text),
                    address: addressedController.text,
                  );
                  final add = await apiService.addStudent(student);
                  setState(() {
                    add;
                  });
                },
                child: Text(
                  "Add Infromation",
                  style: TextStyle(color: Colors.black),
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateScreen(name: "Rishu"),
                    ),
                  );
                },
                child: Text("send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//////
