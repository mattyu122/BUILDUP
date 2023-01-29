// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';
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
  FirebaseService _service = FirebaseService();
  bool _isliked = false;
  List favL = [];
  late final _provider = Provider.of<EpostProvider>(context);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    //_provider = Provider.of<EpostProvider>(context);
    _service.post.doc(_provider.EpostData?.id).get().then((value) {
      setState(() {
        favL = value['fav'];
      });
      if (favL.contains(_service.user?.uid)) {
        setState(() {
          _isliked = true;
        });
      } else {
        setState(() {
          _isliked = false;
        });
      }
    });

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    FirebaseService _service = FirebaseService();

    //var _provider = Provider.of<EpostProvider>(context);

    var data = _provider.EpostData;
    return Scaffold(
      // ignore: unnecessary_new
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(255, 119, 20, 244),
        iconTheme:
            IconThemeData(color: Color.fromARGB(255, 255, 255, 255), size: 30),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isliked ? Icons.favorite : Icons.favorite_border),
            color: _isliked ? Colors.red : Colors.white,
            onPressed: () {
              setState(() {
                _isliked = !_isliked;
              });
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const SetPage(),
              // ));
              _service.updateFavourite(_isliked, data?.id, context);
            },
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
            child: Column(children: [
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
              if (_provider.EpostData?['hostUserId'] !=
                  FirebaseAuth.instance.currentUser!.uid) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(395, 50),
                          backgroundColor: Color.fromARGB(255, 181, 156, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: _provider.EpostData?['joinedAccount']
                              .contains(FirebaseAuth.instance.currentUser!.uid)
                          ? null
                          : () async {
                              final isJoinedEvent =
                                  await _service.joinEvent(data?.id);
                              if (isJoinedEvent == true && mounted) {
                                Navigator.pop(context);
                              }
                            },
                      child: Text(
                        _provider.EpostData?['joinedAccount'].contains(
                                FirebaseAuth.instance.currentUser!.uid)
                            ? "JOINED"
                            : "JOIN EVENT",
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
              ] else ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(395, 50),
                          backgroundColor: Color.fromARGB(255, 181, 156, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        await _service.createChatRoomForGroup(
                            _provider.EpostData!.id,
                            _provider.EpostData?['PostN'],
                            _provider.EpostData?.id);
                        if (!mounted) return;
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "START CAMPAIGN",
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
            ]),
          ),
        ),
      ),
    );
  }
}
