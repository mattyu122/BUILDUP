import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Course/C_Provider.dart';
import 'package:flutter_application_1/GetData/Course/Course_Sreen_details.dart';
import 'package:provider/provider.dart';

import '../../services/Firebase_service.dart';

class CourseTOP extends StatefulWidget {
  const CourseTOP({super.key});

  @override
  State<CourseTOP> createState() => _CourseTOPState();
}

class _CourseTOPState extends State<CourseTOP> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CpostProvider>(context);
    FirebaseService _service = FirebaseService();

    return Center(
      child: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: _service.Cpost.orderBy('PostL', descending: true).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("");
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
              child: Container(
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          ' Top rated ',
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
                                // children: const [
                                //   Text('See All',
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 15.0,
                                //       )),
                                //   Icon(
                                //     Icons.arrow_forward_ios,
                                //     size: 12,
                                //     color: Colors.white,
                                //   )
                                // ],
                                ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
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
                                    onTap: () {
                                      _provider.getCpostDetails(doc);
                                      Navigator.pushNamed(
                                          context, CourseSreenDetails.id);
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 290,
                                      margin: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            child: Image.network(doc!['PostP'],
                                                height: 200,
                                                width: 200,
                                                fit: BoxFit.cover),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 12, 8, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${doc['PostN']}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                ),
                                                // SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Exp : ${doc['PostD']}',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.favorite,
                                                              color: Colors
                                                                  .deepPurple,
                                                            ),
                                                            Text(
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .deepPurple,
                                                                  // fontSize: 13,
                                                                  // fontWeight:
                                                                  //     FontWeight
                                                                  //         .w500,
                                                                ),
                                                                '   ${doc['PostL']}'
                                                                    .toString()),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
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
