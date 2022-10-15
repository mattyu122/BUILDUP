import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePages/Home.dart';
import './LoginPages/login.dart';

void main() {
  runApp(const MyApp());
}

//sasjajsaj
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
