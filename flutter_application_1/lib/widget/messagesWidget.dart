import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/DataModel/contactUser.dart';
import 'package:flutter_application_1/DataModel/message.dart';
import 'package:flutter_application_1/widget/messageWidget.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
  final String chatroomId;
  final ContactUser currentChatUser;
  const MessagesWidget({
    required this.chatroomId,
    required this.currentChatUser,
    Key? key,
  }) : super(key: key);
  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  late String chatroomId;
  late ContactUser currentChatUser;
  @override
  void initState() {
    // TODO: implement initState
    chatroomId = widget.chatroomId;
    currentChatUser = widget.currentChatUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chatroom')
          .doc(chatroomId)
          .collection(chatroomId)
          .orderBy('createdAt', descending: true)
          .snapshots(),
      // .collection(chatroomId)
      // .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //AsyncSnapshot<QuerySnapshot>
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return buildText('Something Went Wrong Try later');
            } else if (snapshot.hasData) {
              final messages = snapshot.data!.docs
                  .map((e) => Message(
                      senderName: e['senderName'],
                      senderId: e['senderId'],
                      receiverId: e['receiverId'],
                      message: e['message'],
                      createdAt: e['createdAt']))
                  .toList();
              return snapshot.data!.docs.isEmpty
                  ? buildText('Say Hi.. to ${currentChatUser.userName}')
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      itemCount: messages.length, //snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        //final message = snapshot.data!.docs[index]['message'];
                        return MessageWidget(
                            message: messages[index]
                                .message, //snapshot.data!.docs[index]['message'],
                            isMe: messages[index].senderId ==
                                FirebaseAuth.instance.currentUser!
                                    .uid, //snapshot.data!.docs[index]['senderId'] ==
                            senderName: messages[index].senderName);
                      },
                    );
            }
            return buildText('No data fetched');
        }
      },
    );
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      );
}
