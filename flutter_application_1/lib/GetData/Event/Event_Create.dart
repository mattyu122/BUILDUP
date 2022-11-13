// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EventCreate extends StatefulWidget {
  static const String id = 'Event-Create-Post-screen';

  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      print('object');
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
        title: Text('Create Event Post',
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
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Pirce',
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
                          'UPLOAD IMAGE',
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
                          'UPLOAD EVENT POST',
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
