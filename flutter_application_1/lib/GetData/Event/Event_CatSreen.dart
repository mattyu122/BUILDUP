import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';

class EventCatSreen extends StatefulWidget {
  static const String id = 'category-list-screen';

  @override
  State<EventCatSreen> createState() => _EventCatSreenState();
}

class _EventCatSreenState extends State<EventCatSreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseService _service = FirebaseService();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        backgroundColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Container(
        child: FutureBuilder<QuerySnapshot>(
          future: _service.cat.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("");
            }

            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var doc = snapshot.data?.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 70,
                        child: ListTile(
                          onTap: () {},
                          leading: Image.network(doc!['catP'],
                              width: 65, height: 100, fit: BoxFit.fill),
                          title: Text(
                            'TYPE : ${doc['catN']}',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 12),
                        ),
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}