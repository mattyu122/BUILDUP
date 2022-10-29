// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataModel/userAccount.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> contactIDList = [];
  final userId = FirebaseAuth.instance.currentUser?.uid;
  retrieveUserAccount() async {
    final user = await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .get()
        .then((value) => UserAccount.fromDocumentSnapshot(value));
    contactIDList = user.contactID;
    print(user.toMap());
    print(contactIDList);
  }

  @override
  void initState() {
    // TODO: implement initState
    if (userId != null) {
      retrieveUserAccount();
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Chat Page',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
