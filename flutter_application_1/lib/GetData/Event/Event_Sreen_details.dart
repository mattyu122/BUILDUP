// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../DrawerPages/Setting.dart';
import 'Provider.dart';

class EventSreenDetails extends StatefulWidget {
  static const String id = 'Event-Post-Details-screen';

  @override
  State<EventSreenDetails> createState() => _EventSreenDetails();
}

class _EventSreenDetails extends State<EventSreenDetails> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<EpostProvider>(context);
    return Scaffold(
      // ignore: unnecessary_new
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(255, 119, 20, 244),
        iconTheme:
            IconThemeData(color: Color.fromARGB(255, 255, 255, 255), size: 30),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const SetPage(),
              // ));
            },
            icon: Icon(
              Icons.favorite_sharp,
            ),
          )
        ],
        title: Text('${_provider.EpostData?['PostN']}',
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
          child: Center(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  // color: Colors.grey.shade300,
                  child: Image.network(_provider.EpostData?['PostP'],
                      fit: BoxFit.cover),
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 174,
                        width: 395,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(
                              color: Color.fromARGB(255, 181, 156, 255)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Host: ${_provider.EpostData?['hostName']} ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Date: ${_provider.EpostData?['PostD']} ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Price: ${_provider.EpostData?['price']} ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Location: ${_provider.EpostData?['location']} ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Category: ${_provider.EpostData?['category']} ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Participant/s: ${_provider.EpostData?['expectedNumber']} ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 150,
                        width: 395,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(
                              color: Color.fromARGB(255, 181, 156, 255)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_provider.EpostData?['description']}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(395, 50),
                          backgroundColor: Color.fromARGB(255, 181, 156, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        // validate();
                      },
                      child: Text(
                        'JOIN EVENT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
