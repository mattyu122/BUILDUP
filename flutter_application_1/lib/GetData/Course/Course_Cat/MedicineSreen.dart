import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/Medicine.dart';

class MedicineSreen extends StatefulWidget {
  static const String id = 'MedicineSreen-screen';

  @override
  State<MedicineSreen> createState() => _MedicineSreenState();
}

class _MedicineSreenState extends State<MedicineSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 119, 20, 244),
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
          centerTitle: true,
          title: Text("MEDICINE",
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
              CourseMedicine(),
            ],
          ),
        )));
  }
}
