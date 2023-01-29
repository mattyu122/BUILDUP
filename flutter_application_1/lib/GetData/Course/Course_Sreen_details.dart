// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/GetData/Course/C_Provider.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseSreenDetails extends StatefulWidget {
  static const String id = 'Course123-Post-Details-screen';

  @override
  State<CourseSreenDetails> createState() => _CourseSreenDetailsState();
}

class _CourseSreenDetailsState extends State<CourseSreenDetails> {
  FirebaseService _service = FirebaseService();
  bool _isliked1 = false;
  List favLc = [];
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    var _provider = Provider.of<CpostProvider>(context);
    _service.Cpost.doc(_provider.CpostData?.id).get().then((value) {
      setState(() {
        favLc = value['favc'];
      });
      if (favLc.contains(_service.user?.uid)) {
        setState(() {
          _isliked1 = true;
        });
      } else {
        setState(() {
          _isliked1 = false;
        });
      }
    });

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    FirebaseService _service = FirebaseService();

    var _provider = Provider.of<CpostProvider>(context);

    var data = _provider.CpostData;
    return Scaffold(
      // ignore: unnecessary_new
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(255, 119, 20, 244),
        iconTheme:
            IconThemeData(color: Color.fromARGB(255, 255, 255, 255), size: 30),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isliked1 ? Icons.favorite : Icons.favorite_border),
            color: _isliked1 ? Colors.red : Colors.white,
            onPressed: () {
              setState(() {
                _isliked1 = !_isliked1;
              });
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const SetPage(),
              // ));
              _service.updateFavourite2(_isliked1, data?.id, context);
            },
          )
        ],
        title: Text('${_provider.CpostData?['PostN']}',
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
                  child: Image.network(_provider.CpostData?['PostP'],
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
                                'Host: ${_provider.CpostData?['hostName']} ',
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
                                'Date: ${_provider.CpostData?['PostD']} ',
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
                                'Price: ${_provider.CpostData?['price']} ',
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
                                'Location: ${_provider.CpostData?['location']} ',
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
                                'Category: ${_provider.CpostData?['category']} ',
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
                                'Participant/s: ${_provider.CpostData?['expectedNumber']} ',
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
                                '${_provider.CpostData?['description']}',
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
                      onPressed: () async {
                        await _service.createChatRoomForGroup(
                            _provider.CpostData!.id,
                            _provider.CpostData?['PostN'],
                            _provider.CpostData?.id);

                        await _service.post
                            .doc(_provider.CpostData!.id)
                            .delete();
                        if (!mounted) return;
                        Navigator.of(context).pop();
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
