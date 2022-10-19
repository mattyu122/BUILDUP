// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';

class EventUP extends StatefulWidget {
  const EventUP({super.key});

  @override
  State<EventUP> createState() => _EventUPState();
}

class _EventUPState extends State<EventUP> {
  @override
  Widget build(BuildContext context) {
    FirebaseService _service = FirebaseService();

    return Center(
      child: Container(
        child: FutureBuilder<QuerySnapshot>(
          future: _service.post.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                height: 228,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          ' Upcoming Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        )),
                        SizedBox(
                          height: 32,
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Text('See All',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    )),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            var doc = snapshot.data?.docs[index];
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              // height: 80,
                              // width: 90,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRect(
                                        child: Image.network(
                                          doc!['PostP'],
                                          height: 180,
                                          width: 300,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )

                                  // Flexible(
                                  //     child: Text(
                                  //   doc['PostN'],
                                  //   maxLines: 2,
                                  //   textAlign: TextAlign.center,
                                  // ))
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
