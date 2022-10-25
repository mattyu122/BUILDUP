// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import '../GetData/Event/Event_Hit.dart';

class EPosts {
  final String title;
  final String date;
  final DocumentSnapshot document;
  EPosts({required this.title, required this.date, required this.document});
}

class PostSearch {
  serach({context, EpostList}) {
    showSearch(
      context: context,
      delegate: SearchPage<EPosts>(
        onQueryUpdate: print,
        items: EpostList,

        barTheme: ThemeData(
          // iconTheme: const IconThemeData(color: Colors.white),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
          ),
          scaffoldBackgroundColor: Colors.black,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Color.fromARGB(255, 255, 255, 255)),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: Colors.white,
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

        searchLabel: 'Search Event',
        suggestion: Container(
          child: SingleChildScrollView(
              child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // EventUP(),
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

        filter: (epost) => [
          epost.title,
        ],
        // sort: (a, b) => a.compareTo(b),
        builder: (epost) => ListTile(
          title: Text(epost.title),
        ),
      ),
    );
  }
}
