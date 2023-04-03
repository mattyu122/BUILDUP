import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/DataModel/contactUser.dart';
import 'package:flutter_application_1/HomePages/Chatpage.dart';
import 'package:flutter/material.dart';

class ChatMenuWidget extends StatefulWidget {
  final List<ContactUser> users;
  const ChatMenuWidget({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatMenuWidget> createState() => _ChatMenuWidget();
}

class _ChatMenuWidget extends State<ChatMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final List<ContactUser> realuser = widget.users;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 5, 5, 5),
        ),
        child: buildChats(realuser),
      ),
    );
  }

  // Widget buildChats(List<ContactUser> realuser) {
  //   String lastMessage = "";
  //   print(realuser);
  //   return ListView.separated(
  //     separatorBuilder: (_, __) => const Divider(height: 0.5),
  //     physics: const BouncingScrollPhysics(),
  //     itemBuilder: (context, index) {
  //       // var tmp = FirebaseFirestore.instance
  //       //     .collection("chatroom")
  //       //     .doc(realuser[index].id)
  //       //     .collection(realuser[index].id)
  //       //     .orderBy('createdAt', descending: true)
  //       //     .limit(1)
  //       //     .get()
  //       //     .then((value) => {lastMessage = value.docs[0].data()["message"]});
  //       print(lastMessage);
  //       print(realuser[index]);
  //       return Container(
  //         margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
  //         // decoration: BoxDecoration(
  //         //   border: Border.all(width: 3, color: Color.fromARGB(255, 0, 0, 0)),
  //         //   borderRadius: BorderRadius.all(Radius.circular(5)),
  //         //   boxShadow: [
  //         //     BoxShadow(
  //         //         blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
  //         //   ],
  //         // ),
  //         height: 65,
  //         child: ListTile(
  //           onTap: () {
  //             Navigator.of(context).push(MaterialPageRoute(
  //               builder: (context) => ChatPage(user: realuser[index]),
  //             ));
  //           },
  //           title: Text(
  //             realuser[index].userName,
  //             style: TextStyle(
  //                 fontSize: 18, color: Color.fromARGB(255, 26, 25, 25)),
  //           ),
  //           leading: UserAvatar(filename: realuser[index].icon),
  //         ),
  //       );
  //     },
  //     itemCount: widget.users.length,
  //   );
  // }

  // Widget buildChats(List<ContactUser> realuser) {
  //   return ListView.separated(
  //     separatorBuilder: (_, __) => const Divider(height: 0.5),
  //     physics: const BouncingScrollPhysics(),
  //     itemBuilder: (context, index) {
  //       return FutureBuilder<DocumentSnapshot>(
  //         future: FirebaseFirestore.instance
  //             .collection("chatroom")
  //             .doc(realuser[index].id)
  //             .collection(realuser[index].id)
  //             .orderBy('createdAt', descending: true)
  //             .limit(1)
  //             .get()
  //             .then((value) => value.docs[0]),
  //         builder:
  //             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //           String lastMessage = "";
  //           if (snapshot.connectionState == ConnectionState.done) {
  //             if (snapshot.hasData) {
  //               lastMessage = snapshot.data!["message"];
  //             } else {
  //               lastMessage = "No messages yet.";
  //             }
  //           } else {
  //             lastMessage = "Loading...";
  //           }

  //           return Container(
  //             margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
  //             height: 65,
  //             child: ListTile(
  //               onTap: () {
  //                 Navigator.of(context).push(MaterialPageRoute(
  //                   builder: (context) => ChatPage(user: realuser[index]),
  //                 ));
  //               },
  //               title: Text(
  //                 realuser[index].userName,
  //                 style: TextStyle(
  //                     fontSize: 18, color: Color.fromARGB(255, 26, 25, 25)),
  //               ),
  //               subtitle: Text(lastMessage),
  //               leading: UserAvatar(filename: realuser[index].icon),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //     itemCount: realuser.length,
  //   );
  // }
  Widget buildChats(List<ContactUser> realuser) {
    return ListView.separated(
      separatorBuilder: (_, __) => const Divider(
        height: 0.5,
        color: Color.fromARGB(255, 58, 57, 58),
        thickness: 1,
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("chatroom")
              .doc(realuser[index].id)
              .collection(realuser[index].id)
              .orderBy('createdAt', descending: true)
              .limit(1)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            String lastMessage = "";
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                lastMessage = snapshot.data!.docs[0]["message"];
              } else {
                lastMessage = "No messages yet.";
              }
            } else {
              lastMessage = "Loading...";
            }

            return Container(
              margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
              height: 65,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(user: realuser[index]),
                  ));
                },
                title: Text(
                  realuser[index].userName,
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 238, 233, 233)),
                ),
                subtitle: Text(lastMessage,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 131, 130, 130))),
                leading: UserAvatar(filename: realuser[index].icon),
              ),
            );
          },
        );
      },
      itemCount: realuser.length,
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String filename;
  const UserAvatar({
    super.key,
    required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
          radius: 29,
          backgroundImage: NetworkImage(
              filename) //Image.asset('assets/images/$filename').image,
          ),
    );
  }
}
