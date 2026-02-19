import 'package:flutter/material.dart';

import 'data_helper.dart';

class ShowData extends StatelessWidget {
  const ShowData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Text("title:${data[index]['title']}");
        },),
    );
  }
}
