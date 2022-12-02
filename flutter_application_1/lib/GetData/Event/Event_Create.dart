// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/DataModel/EventPosts.dart';

class EventCreate extends StatefulWidget {
  static const String id = 'Event-Create-Post-screen';

  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
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
  validate() async {
    if (_formKey.currentState!.validate()) {
      print('object');
      final number = int.parse(participantNumberController.text);
      EventPost newEvent = EventPost(
          PostD: dateController.text == ""
              ? "To be confirmed"
              : dateController.text,
          PostP: blankPhoto,
          price: priceController.text == ""
              ? "To be confirmed"
              : priceController.text,
          location: locationController.text == ""
              ? "To be confirmed"
              : locationController.text,
          PostL: 0,
          description: descriptionController.text,
          PostN: titleController.text,
          category: categoryController.text,
          hostName: FirebaseAuth.instance.currentUser!.email!,
          expectedNumber: number,
          joinedNumber: 0,
          joinedAccount: [],
          createAt: DateTime.now().toString());
      await FirebaseFirestore.instance
          .collection('EventPost')
          .add(newEvent.toMap())
          .then((value) => {Navigator.of(context).pop()});
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
                          return 'Please complete required flied';
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
                          return 'Please complete required flied';
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
                          return 'Please complete required flied';
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
                          return 'Please complete required flied';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                      controller: categoryController,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Category',
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
                          return 'Please complete required flied';
                        }
                        return null;
                      }),
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
                          return 'Please complete required flied';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 12,
                  ),

                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  //       child: Text(
                  //         'Description',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 17.0,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(height: 7),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  //       child: Container(
                  //         height: 180,
                  //         decoration: BoxDecoration(
                  //           color: Color.fromARGB(255, 181, 156, 255),
                  //           border: Border.all(
                  //               color: Color.fromARGB(255, 181, 156, 255),
                  //               width: 2),
                  //           borderRadius: BorderRadius.circular(5.0),
                  //         ),
                  //         child: TextFormField(
                  //           style: TextStyle(fontSize: 17, color: Colors.black),
                  //           decoration: InputDecoration(
                  //             border: InputBorder.none,
                  //             hintText: "",
                  //             contentPadding: EdgeInsets.only(
                  //                 left: 10, bottom: 0, right: 10, top: 0),
                  //             hintStyle: TextStyle(
                  //                 fontSize: 17.0,
                  //                 color: Color.fromARGB(255, 0, 0, 0)),
                  //           ),
                  //           validator: (value) {
                  //             if (value!.isEmpty) {
                  //               return 'Please complete required flied';
                  //             }
                  //             return null;
                  //           },
                  //           maxLines: 10,
                  //           minLines: 1,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

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
                                  return 'Please complete required flied';
                                }
                                return null;
                              }),
                        ),
                      ),
                    ],
                  ),

                  // TextFormField(
                  //     maxLines: 30,
                  //     style: TextStyle(fontSize: 17, color: Colors.white),
                  //     decoration: InputDecoration(
                  //         constraints:
                  //             BoxConstraints.tightFor(width: 395, height: 200),
                  //         labelText: 'Description',
                  //         labelStyle: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //                 color: Color.fromARGB(255, 181, 156, 255),
                  //                 width: 2)),
                  //         focusedBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //                 color: Color.fromARGB(255, 181, 156, 255),
                  //                 width: 2)),
                  //         errorBorder: OutlineInputBorder(
                  //             borderSide:
                  //                 BorderSide(color: Colors.red, width: 2))),
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please complete required flied';
                  //       }
                  //       return null;
                  //     }),
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
                        onPressed: () {},
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
                          'Create Post',
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
