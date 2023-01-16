// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Course/C_Provider.dart';
import 'package:flutter_application_1/GetData/Event/Event_Sreen_details.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import '../GetData/Course/Course_Hit.dart';
import '../GetData/Course/Course_Sreen_details.dart';
import '../GetData/Event/Event_Hit.dart';
import '../GetData/Event/Provider.dart';

class CPosts {
  final String title;
  final String date;
  final String photo;
  final String hostname;
  final DocumentSnapshot document;
  CPosts(
      {required this.title,
      required this.date,
      required this.document,
      required this.photo,
      required this.hostname});
}

class CPostSearch {
  serach({context, CpostList}) {
    showSearch(
      context: context,
      delegate: SearchPage<CPosts>(
        onQueryUpdate: print,
        items: CpostList,

        barTheme: ThemeData(
          // iconTheme: const IconThemeData(color: Color.fromARGB(255, 250, 0, 0)),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ),
          scaffoldBackgroundColor: Colors.black,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Color.fromARGB(255, 0, 0, 0)),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 255, 254, 254),
              fontSize: 20,
            ),
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            border: InputBorder.none,
          ),
        ),

        searchLabel: 'Search Post',
        suggestion: Container(
          child: SingleChildScrollView(
              child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // EventUP(),
              // SizedBox(
              //   height: 1,
              // ),
              CourseTOP(),
            ],
          )),
        ),
        failure: Center(
          // ignore: prefer_const_literals_to_create_immutables
          child: Image(
            image: AssetImage('assets/123.png'),
            height: 350,
            width: 350,
          ),
        ),

        filter: (cpost) => [cpost.hostname, cpost.title, cpost.date],
        // sort: (a, b) => a.compareTo(b),
        builder: (cpost) {
          var _provider = Provider.of<CpostProvider>(context);
          return InkWell(
            onTap: () {
              _provider.getCpostDetails(cpost.document);
              Navigator.pushNamed(context, CourseSreenDetails.id);
            },
            child: Column(
              children: [
                SizedBox(
                  height: 2,
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: Image.network(cpost.photo),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Titel : ${cpost.title}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        textDirection: TextDirection.ltr,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Host by : ${cpost.hostname}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        textDirection: TextDirection.ltr,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Exp : ${cpost.date}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        textDirection: TextDirection.ltr,
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
