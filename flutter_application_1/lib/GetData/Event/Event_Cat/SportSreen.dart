import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/Sport.dart';

class SportSreen extends StatefulWidget {
  static const String id = 'SportSreen-screen';

  @override
  State<SportSreen> createState() => _SportSreenState();
}

class _SportSreenState extends State<SportSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 119, 20, 244),
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
          centerTitle: true,
          title: Text("SPORT",
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
              EventSport(),
            ],
          ),
        )));
  }
}
