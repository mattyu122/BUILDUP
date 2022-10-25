import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/services/E_serarch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';

class EventSearch extends StatefulWidget {
  const EventSearch({super.key});

  @override
  State<EventSearch> createState() => _EventSearchState();
}

class _EventSearchState extends State<EventSearch> {
  FirebaseService _service = FirebaseService();
  PostSearch _search = PostSearch();
  static List<EPosts> eposts = [];
  @override
  void initState() {
    // TODO: implement initState
    _service.post.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          eposts.add(
            EPosts(document: doc, title: doc['PostN'], date: doc['PostD']),
          );
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              width: 300,
              child: TextField(
                onTap: () {
                  _search.serach(
                    context: context,
                    EpostList: eposts,
                  );
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Event",
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
