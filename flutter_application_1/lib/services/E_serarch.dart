// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/GetData/Event/Event_Sreen_details.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import '../GetData/Event/Event_Hit.dart';
import '../GetData/Event/Provider.dart';

class EPosts {
  final String title;
  final String date;
  final String photo;
  final String hostname;
  final DocumentSnapshot document;
  EPosts(
      {required this.title,
      required this.date,
      required this.document,
      required this.photo,
      required this.hostname});
}

class PostSearch {
  serach({context, EpostList}) {
    showSearch(
      context: context,
      delegate: SearchPage<EPosts>(
        onQueryUpdate: print,
        items: EpostList,

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
              EventTOP(),
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

        filter: (epost) => [epost.hostname, epost.title, epost.date],
        // sort: (a, b) => a.compareTo(b),
        builder: (epost) {
          var _provider = Provider.of<EpostProvider>(context);
          return InkWell(
            onTap: () {
              _provider.getEpostDetails(epost.document);
              Navigator.pushNamed(context, EventSreenDetails.id);
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
                            child: Image.network(epost.photo),
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
                                        'Title : ${epost.title}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                        overflow: TextOverflow.fade,
                                        maxLines: 3,
                                        textDirection: TextDirection.ltr,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Host by : ${epost.hostname}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                        overflow: TextOverflow.fade,
                                        maxLines: 3,
                                        textDirection: TextDirection.ltr,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Exp : ${epost.date}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                        overflow: TextOverflow.fade,
                                        maxLines: 3,
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
