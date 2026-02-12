import 'package:demo_students_apis/api_service.dart';
import 'package:demo_students_apis/student_model.dart';
import 'package:flutter/material.dart';

class AllStudentsScreen extends StatefulWidget {
  const AllStudentsScreen({super.key});

  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {
  ApiService apiService=ApiService();

  Future<List<StudentModel>>? fetchStudent;
  @override
  void initState() {
    fetchStudent=apiService.getAllStudents();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(future: apiService.getAllStudents(),
        builder: (BuildContext context, AsyncSnapshot<List<StudentModel>> snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        else if(snapshot.hasError){
          return Center(
            child: Text("Errors: ${snapshot.error}"),
          );
        }
        else{
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: ( context,  index) {
              final student=snapshot.data![index];
              return ListTile(
                leading:  Text("password : ${student.password}"),
                title: Text("name : ${student.name}"),
                subtitle: Text('email : ${student.email}'),
                trailing:  Text("phone : ${student.phone}"),

              );
            },);
        }

      },)
    );
  }
}
