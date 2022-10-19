// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat.dart';
import 'package:flutter_application_1/GetData/Event/Event_Hit.dart';
import 'package:flutter_application_1/GetData/Event/Event_UpComing.dart';
import 'package:flutter_application_1/GetData/Event/Event_Search.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              EventSearch(),
              SizedBox(height: 10),
              EventCat(),
              EventUP(),
              EventTOP(),
            ],
          ),
        )));
  }
}
