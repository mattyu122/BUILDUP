import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/Education.dart';

class EducationSreen extends StatefulWidget {
  static const String id = 'EducationSreen-screen';

  @override
  State<EducationSreen> createState() => _EducationSreenState();
}

class _EducationSreenState extends State<EducationSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 119, 20, 244),
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
          centerTitle: true,
          title: Text("Education",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              )),
          toolbarHeight: 56,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 15),

              // SizedBox(height: 5),
              CourseEducation(),
            ],
          ),
        )));
  }
}
