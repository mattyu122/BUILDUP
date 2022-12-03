// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat.dart';
import 'package:flutter_application_1/GetData/Event/Event_CatSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Create.dart';
import 'package:flutter_application_1/GetData/Event/Event_Hit.dart';
import 'package:flutter_application_1/GetData/Event/Event_New.dart';
import 'package:flutter_application_1/GetData/Event/Event_UpComing.dart';
import 'package:flutter_application_1/GetData/Event/Event_Search.dart';
import 'package:flutter_application_1/HomePages/Home.dart';
import 'package:flutter_application_1/services/E_serarch.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  FirebaseService _service = FirebaseService();
  PostSearch _search = PostSearch();
  static List<EPosts> eposts = [];

  @override
  void initState() {
    // TODO: implement initState
    _service.post.snapshots().listen((querrysnapshot) {
      querrysnapshot.docChanges.forEach((change) {
        setState(() {
          eposts.add(
            EPosts(
                document: change.doc,
                title: change.doc['PostN'],
                date: change.doc['PostD'],
                photo: change.doc['PostP'],
                hostname: change.doc['hostName']),
          );
        });
      });
    });

    // FirebaseFirestore.instance
    //     .collection('EventPost')
    //     .snapshots()
    //     .listen((querrysnapshot) {
    //   querrysnapshot.docChanges.forEach((change) {
    //     eposts.add(EPosts(
    //         title: change.doc['PostN'],
    //         date: change.doc['PostD'],
    //         document: change.doc,
    //         photo: change.doc['PostP'],
    //         hostname: change.doc['hostName']));
    //   });
    // });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Color.fromARGB(255, 119, 20, 244),
            icon: Icon(Icons.layers),
            onPressed: () {
              Navigator.pushNamed(context, EventCreate.id);
            },
            label: Text(
              "Create",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            )),
        drawer: const NavigationDrawer(),
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
                  EpostList: eposts,
                );
              },
              icon: Icon(
                Icons.search,
              ),
            )
          ],
          title: Text('EVENT',
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
              EventCat(),
              EventUP(),
              EventTOP(),
              EventNEW(),
            ],
          ),
        )));
  }
}
