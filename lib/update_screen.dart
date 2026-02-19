import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  String name;

  UpdateScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Screen")),
      body: Center(child: Text("name: $name ")),
    );
  }
}
