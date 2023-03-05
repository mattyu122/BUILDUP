// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:flutter/material.dart';

import '../GetData/Course/Course_Host.dart';

class HostCPage extends StatefulWidget {
  const HostCPage({super.key});

  @override
  State<HostCPage> createState() => _HostCPageState();
}

class _HostCPageState extends State<HostCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 119, 20, 244),
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
          centerTitle: true,
          title: Text("Host Courses",
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
              HOSTC(),
            ],
          ),
        )));
  }
}
