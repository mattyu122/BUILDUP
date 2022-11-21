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

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ContactUser> contactIDList = []; //List of contactID(user ID)
  late UserAccount currentUser;
  String? receiverId;
  final userId = FirebaseAuth.instance.currentUser?.uid;
  retrieveUserAccount() async {
    final user = await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .get()
        .then(
            (value) => {currentUser = UserAccount.fromDocumentSnapshot(value)});
    currentUser.contactUser!.forEach((element) {
      contactIDList.add(ContactUser(
          userName: element.userName,
          email: element.email,
          icon: element.icon,
          id: element.id));
    });
    print("dsafdsa");
    print(contactIDList);
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
          child: SingleChildScrollView(
            child: StreamBuilder<List<ContactUser>>(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .doc(userId)
                  .snapshots()
                  .map((snapshot) =>
                      List<ContactUser>.from(snapshot['contactUser'])),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      print("error");
                      print(snapshot.error);
                    } else {
                      final users = snapshot.data;
                      print("fetched users id");
                      print(users);
                    }
                    return Column(
                      children: [],
                    );
                }
              },
            ),
          ),
        ));
  }
}
