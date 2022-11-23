// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataModel/userAccount.dart';
import 'package:flutter_application_1/DataModel/contactUser.dart';
import 'package:flutter_application_1/DrawerPages/Setting.dart';
import 'package:flutter_application_1/HomePages/Home.dart';
import 'package:flutter_application_1/widget/chat_menu.dart';

class Chatspage extends StatefulWidget {
  const Chatspage({super.key});

  @override
  State<Chatspage> createState() => _ChatPageState();
}

class _ChatPageState extends State<Chatspage> {
  List<ContactUser> contactIDList = []; //List of contactID(user ID)
  late UserAccount currentUser;
  String? receiverId;
  final userId = FirebaseAuth.instance.currentUser?.uid;
  retrieveUserAccount() async {
    // final user = await FirebaseFirestore.instance
    //     .collection('user')
    //     .doc(userId)
    //     .get()
    //     .then((value) => {currentUser = UserAccount.fromMap(value.data()!)});
    // receiverId = contactIDList?[0] ?? null;
    //print(user.toMap());
    // print(receiverId);
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
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(255, 119, 20, 244),
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SetPage(),
                ));
              },
              icon: Icon(
                Icons.settings,
              ),
            )
          ],
          title: Text('CHAT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              )),
          toolbarHeight: 56,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          // child: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(userId)
                .snapshots(),
            //.map((snapshot) => List<ContactUser>.from(snapshot.data()!.)),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    print("error");
                    print(snapshot.error);
                  } else if (snapshot.hasData) {
                    final docData = snapshot.data as DocumentSnapshot;
                    final contactUsers = docData['contactUser'] as List;
                    final List<ContactUser> realcontactusers = contactUsers
                        .map((e) => ContactUser.fromMap(e))
                        .toList();
                    print("dsafdsafdsaf");
                    print(realcontactusers[0].email);
                    return ChatMenuWidget(users: realcontactusers);
                  }
                  return buildText("no contacts");
              }
            },
          ),
          // ),
        ));
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}
