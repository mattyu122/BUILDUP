import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
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
  int timeCount = 0;
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
    if (timeCount >= 20 && !emailVerified) {
      FirebaseAuth.instance.currentUser?.delete();
      if (mounted) {
        Navigator.of(context).pop();
      }
      timer?.cancel();
    } else if (emailVerified) {
      await createAccountInDataBase();
      if (mounted) {
        Navigator.of(context).pop();
      }
      timer?.cancel();
    }
    timeCount += 1;
  }

  Future createAccountInDataBase() async {
    final profileDefaultPhotoURL = await FirebaseStorage.instance
        .ref("profiledefault")
        .child(
            "pngtree-user-avatar-icon-profile-silhouette-png-image_5173766.png")
        .getDownloadURL();
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
        profileImageUrl: profileDefaultPhotoURL,
        faculty: "Select Your Faculty",
        interestEvent: "Select Your Interest Event",
        groupMateTag: "Select Your Tag");

    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(newUser.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Verify Your Email in 60 seconds',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Please check your inbox and click the verification link in the email we just sent you.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
