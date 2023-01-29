import 'dart:async';
import 'package:flutter_application_1/DataModel/userAccount.dart';
// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePages/Home.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';
import 'package:flutter_application_1/DataModel/contactUser.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmail();
}

class _VerifyEmail extends State<VerifyEmail> {
  bool emailVerified = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!emailVerified) {
      try {
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
      } catch (e) {
        print(e);
      }
    }

    timer =
        Timer.periodic(Duration(seconds: 3), (_) => {checkEmailVerification()});
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  Future checkEmailVerification() async {
    await FirebaseAuth.instance.currentUser?.reload();
    setState(() {
      emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (emailVerified) {
      if (mounted) {
        Navigator.of(context).pop();
      }
      timer?.cancel();
    }
  }

  Future checkAccountExist() async {
    final tmp = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (tmp.exists) {
      return;
    }
    ContactUser newContact = ContactUser(
        userName: "matt1",
        email: "matt1@gmail.com",
        icon: "icon",
        id: "id",
        groupChat: false);
    UserAccount newUser = UserAccount(
      id: FirebaseAuth.instance.currentUser?.uid,
      userName: FirebaseAuth.instance.currentUser!.email.toString(),
      email: FirebaseAuth.instance.currentUser!.email.toString(),
      joinedEvent: [],
      contactUser: [newContact],
    );
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(newUser.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Text("Please verify your email to continue"),
        ));
  }
}
