import 'dart:convert';
import 'package:demo_students_apis/student_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String _baseUrl = "https://edugaondev.com";

  Future<List<StudentModel>> getAllStudents() async {
    final response = await http.get(
      Uri.parse("$_baseUrl/allStudents"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      List data = [];

      if (body is List) {
        data = body;
      } else if (body is Map) {
        data = body.values.firstWhere(
          (value) => value is List,
          orElse: () => [],
        );
      }

      return data.map((e) => StudentModel.fromJson(e)).toList();
    } else {
      throw Exception(
        "Students Fetch Issue. Status Code: ${response.statusCode}",
      );
    }
  }

//// Add ka kam hua hai

  Future<void> addStudent(StudentModel studentModel) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/addStudent"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(studentModel.toJson()),
    );

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Student Added Successfully");
    } else {
      throw Exception("Student Not Added. Status Code: ${response.statusCode}");
    }
  }

  //// Delete ka kam hua hai

  Future<void> deleteStudent(int sID) async {
    final response = await http.delete(
      Uri.parse("$_baseUrl/deleteStudent$sID"),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Student Deleted Successfully");
    } else {
      print("Student Deleted Fail");
    }
  }

  //// Update ka kam hua hai

  Future<void> updateStudent(int sID, StudentModel newStudentModel) async {
    final response = await http.put(
      Uri.parse("$_baseUrl/updateStudent$sID"),
      body: jsonEncode(newStudentModel.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Student Updated");
    } else {
      print("Student Updated Fail");
    }
  }

}
