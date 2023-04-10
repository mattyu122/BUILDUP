// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/DataModel/EventPosts.dart';
import 'package:image_picker/image_picker.dart';

class EventCreate extends StatefulWidget {
  static const String id = 'Event-Create-Post-screen';

  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  String dropdownvalue = 'Category Select';
  var items = [
    'Category Select',
    'Movie',
    'Photo',
    'Game',
    'Read',
    'Sport',
    'Music',
    'Food',
    'Party',
    'Sing',
    'Drama',
  ];

  String dropdownvalue1 = 'Faculty Select';
  var items1 = [
    'Faculty Select',
    'Medicine',
    'Science',
    'Engine',
    'Social Science',
    'Arts',
    'Business',
    'Education',
    'Law',
  ];

  String dropdownvalue2 = 'Gender Select';
  var items2 = [
    'Gender Select',
    'Male',
    'Female',
    'Other',
    'Male/Female/Other',
  ];

  String dropdownvalue3 = 'Event Type Select';
  var items3 = [
    'Event Type Select',
    'Social event',
    'Educational event',
    'Entertainment event',
    'Sports and fitness event',
    'Outdoor event',
    'Relaxation event',
    'Cultural event',
    'Food and drink event',
    'Charity event',
    'Gaming event',
    'Competition event',
    'Other events'
  ];

  // String dropdownvalue4 = 'Groupmate Type Select';
  // var items4 = [
  //   'Groupmate Type Select',
  //   'Hardworking groupmates',
  //   'Perfectionist groupmates',
  //   'Leader groupmates',
  //   'Collaborative groupmates',
  // ];

  final blankPhoto =
      'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/New%20Event%20Test%2FDefaultBlank.jpg?alt=media&token=42ea3800-a53d-4122-8d8e-26e39be6ff5d';
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  final categoryController = TextEditingController();
  final participantNumberController = TextEditingController();
  final descriptionController = TextEditingController();
  String profilePhotoURL = "";
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  validate() async {
    if (_formKey.currentState!.validate()) {
      print('object');
      final number = int.parse(participantNumberController.text);
      EventPost newEvent = EventPost(
        faculty: items1.contains(dropdownvalue1) ? dropdownvalue1 : "",
        gender: items2.contains(dropdownvalue2) ? dropdownvalue2 : "",
        eventType: items3.contains(dropdownvalue3) ? dropdownvalue3 : "",
        hostUserId: FirebaseAuth.instance.currentUser!.uid,
        PostD:
            dateController.text == "" ? "To be confirmed" : dateController.text,
        PostP: profilePhotoURL == "" ? blankPhoto : profilePhotoURL,
        price: priceController.text == ""
            ? 0.0
            : double.parse(priceController.text),
        location: locationController.text == ""
            ? "To be confirmed"
            : locationController.text,
        PostL: 0,
        description: descriptionController.text,
        PostN: titleController.text,
        category: items.contains(dropdownvalue)
            ? dropdownvalue
            : "", //categoryController.text,
        hostName: FirebaseAuth.instance.currentUser!.email!,
        expectedNumber: number,
        joinedNumber: 0,
        joinedAccount: [],
        fav: [],
        createAt: DateTime.now().toString(),
      );
      await FirebaseFirestore.instance
          .collection('EventPost')
          .add(newEvent.toMap())
          .then((value) => {Navigator.of(context).pop(context)});
    }
  }

  void _showdatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2099),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final destination = FirebaseAuth.instance.currentUser!.uid;
    try {
      final photostring = _photo.toString();
      final ref =
          FirebaseStorage.instance.ref(destination).child('post/$photostring');
      await ref.putFile(_photo!);

      final profilePhotoURLtmp = await FirebaseStorage.instance
          .ref(destination)
          .child('post/$photostring')
          .getDownloadURL();
      setState(() {
        profilePhotoURL = profilePhotoURLtmp;
      });
    } catch (e) {
      print('error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 119, 20, 244),
        iconTheme:
            IconThemeData(color: Color.fromARGB(255, 255, 255, 255), size: 30),
        centerTitle: true,
        title: Text('Create Post',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              // fontSize: 25.0,
            )),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Text(
                  //   'EVENT POST',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     color: Color.fromARGB(255, 255, 255, 255),
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20.0,
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 181, 156, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      width: 395,
                      height: 60,
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        dropdownColor: Colors.black,
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Color.fromARGB(255, 181, 156, 255)),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 181, 156, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      width: 395,
                      height: 60,
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        dropdownColor: Colors.black,
                        value: dropdownvalue1,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Color.fromARGB(255, 181, 156, 255)),
                        items: items1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue1) {
                          setState(() {
                            dropdownvalue1 = newValue1!;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 181, 156, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      width: 395,
                      height: 60,
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        dropdownColor: Colors.black,
                        value: dropdownvalue2,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Color.fromARGB(255, 181, 156, 255)),
                        items: items2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue2) {
                          setState(() {
                            dropdownvalue2 = newValue2!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 181, 156, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      width: 395,
                      height: 60,
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        dropdownColor: Colors.black,
                        value: dropdownvalue3,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Color.fromARGB(255, 181, 156, 255)),
                        items: items3.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue3) {
                          setState(() {
                            dropdownvalue3 = newValue3!;
                          });
                        },
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: 10,
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(0.0),
                  //   child: Container(
                  //     padding: const EdgeInsets.all(8.0),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //           width: 2,
                  //           color: Color.fromARGB(255, 181, 156, 255)),
                  //       borderRadius: BorderRadius.all(Radius.circular(5)),
                  //     ),
                  //     width: 395,
                  //     height: 60,
                  //     child: DropdownButton(
                  //       isExpanded: true,
                  //       underline: Container(),
                  //       dropdownColor: Colors.black,
                  //       value: dropdownvalue4,
                  //       icon: const Icon(Icons.keyboard_arrow_down,
                  //           color: Color.fromARGB(255, 181, 156, 255)),
                  //       items: items4.map((String items) {
                  //         return DropdownMenuItem(
                  //           value: items,
                  //           child: Text(
                  //             items,
                  //             style: TextStyle(
                  //               fontSize: 17,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         );
                  //       }).toList(),
                  //       onChanged: (String? newValue4) {
                  //         setState(() {
                  //           dropdownvalue4 = newValue4!;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: titleController,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                      controller: dateController,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 255, 0, 0)),
                          hintText: 'Year/Month/Day eg: 2023/03/18',
                          labelText: 'Date',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                      controller: priceController,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Price',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                      controller: locationController,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Location',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      }),
                  // SizedBox(
                  //   height: 12,
                  // ),
                  // TextFormField(
                  //     controller: categoryController,
                  //     style: TextStyle(fontSize: 17, color: Colors.white),
                  //     decoration: InputDecoration(
                  //         labelText: 'Category',
                  //         labelStyle: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(5)),
                  //             borderSide: BorderSide(
                  //                 color: Color.fromARGB(255, 181, 156, 255),
                  //                 width: 2)),
                  //         focusedBorder: OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(5)),
                  //             borderSide: BorderSide(
                  //                 color: Color.fromARGB(255, 181, 156, 255),
                  //                 width: 2)),
                  //         errorBorder: OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(5)),
                  //             borderSide:
                  //                 BorderSide(color: Colors.red, width: 2))),
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please complete required flied';
                  //       }
                  //       return null;
                  //     }),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                      controller: participantNumberController,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Participant/s',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 181, 156, 255),
                                  width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 12,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.black,
                              // border: Border.all(
                              //     color: Color.fromARGB(255, 181, 156, 255),
                              //     width: 2),
                              // borderRadius: BorderRadius.circular(5.0),
                              ),
                          child: TextFormField(
                              controller: descriptionController,
                              maxLines: 30,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              decoration: InputDecoration(
                                  constraints: BoxConstraints.tightFor(
                                      width: 395, height: 200),
                                  // labelText: 'Description',
                                  // labelStyle: TextStyle(
                                  //   color: Colors.white,
                                  //   fontWeight: FontWeight.bold,
                                  // ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 181, 156, 255),
                                          width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 181, 156, 255),
                                          width: 2)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please complete required field';
                                }
                                return null;
                              }),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
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
                          _showPicker(context);
                        },
                        child: Text(
                          'UPLOAD IMAGE', //Images should be saved into firebase storage database(not firestore)
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                          validate();
                        },
                        child: Text(
                          'CREATE POST',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
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
      ),
    );
  }
}
