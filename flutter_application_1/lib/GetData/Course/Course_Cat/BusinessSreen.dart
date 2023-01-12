import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/Business.dart';

class BusinessSreen extends StatefulWidget {
  static const String id = 'BusinessSreen-screen';

  @override
  State<BusinessSreen> createState() => _BusinessSreenState();
}

class _BusinessSreenState extends State<BusinessSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 119, 20, 244),
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
          centerTitle: true,
          title: Text("Business",
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
              CourseBusiness(),
            ],
          ),
        )));
  }
}
