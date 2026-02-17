import 'package:demo_students_apis/api_service.dart';
import 'package:demo_students_apis/student_model.dart';
import 'package:demo_students_apis/student_update_screen.dart';
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
              final sID=student.id;
              return ListTile(

                leading:  IconButton(onPressed: ()async{

                  final delete=await apiService.deleteStudent(sID!);
                  setState(() {
                    delete;
                  });
                }, icon: Icon(Icons.delete)),
                title: Text("name : ${student.name}"),
                subtitle: Text('email : ${student.email}'),
                trailing:  IconButton(onPressed: ()async{


                }, icon: Icon(Icons.edit)),

              );
            },);
        }

      },),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentUpdateScreen(name: 'Anjali',),));
          },child: Icon(Icons.edit),),
    );
  }
}


