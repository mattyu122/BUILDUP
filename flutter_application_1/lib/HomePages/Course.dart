// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Course/Course_New.dart';

import 'package:flutter_application_1/HomePages/Home.dart';
import 'package:flutter_application_1/services/C_search.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';

import '../GetData/Course/Course_Cat.dart';
import '../GetData/Course/Course_Hit.dart';
import '../GetData/Course/Course_UpComing.dart';
import '../GetData/Event/Event_Cat.dart';
import '../GetData/Event/Event_Create.dart';
import '../GetData/Course/Course_Create.dart';
import '../GetData/Event/Event_Hit.dart';
import '../GetData/Event/Event_New.dart';
import '../GetData/Event/Event_UpComing.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  FirebaseService _service = FirebaseService();
  CPostSearch _search = CPostSearch();
  static List<CPosts> cposts = [];
  @override
  void initState() {
    // TODO: implement initState
    _service.Cpost.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          cposts.add(
            CPosts(
                document: doc,
                title: doc['PostN'],
                date: doc['PostD'],
                photo: doc['PostP'],
                hostname: doc['hostName']),
          );
        });
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Color.fromARGB(255, 119, 20, 244),
            icon: Icon(Icons.event_note),
            onPressed: () {
              Navigator.pushNamed(context, CourseCreate.id);
            },
            label: Text(
              "Create",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            )),
        drawer: NavigationDrawer(),
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(255, 119, 20, 244),
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                _search.serach(
                  context: context,
                  CpostList: cposts,
                );
              },
              icon: Icon(
                Icons.search,
              ),
            )
          ],
          title: Text('COURSE',
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
              // // EventSearch(),
              // SizedBox(height: 5),
              CourseCat(),
              CourseUP(),
              CourseTOP(),
              CourseNEW(),
            ],
          ),
        )));
  }
}
