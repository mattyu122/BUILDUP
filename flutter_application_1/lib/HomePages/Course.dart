// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Course Page',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
