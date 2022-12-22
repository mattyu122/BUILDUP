import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/DataModel/contactUser.dart';
import 'package:flutter_application_1/widget/messagesWidget.dart';
// import 'package:firebase_chat_example/widget/messages_widget.dart';
// import 'package:firebase_chat_example/widget/new_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/sendNewMessageWidget.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatPage extends StatefulWidget {
  final ContactUser user;

  const ChatPage({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ContactUser currentChatUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentChatUser = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 119, 20, 244),
        iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255), size: 30),
        centerTitle: true,
        title: Text(currentChatUser.userName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            )),
        toolbarHeight: 56,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: MessagesWidget(
                  chatroomId: chatroomId(FirebaseAuth.instance.currentUser!.uid,
                      currentChatUser.id),
                  currentChatUser: currentChatUser,
                ),
              ),
            ),
            SendNewMessageWidget(idUser: currentChatUser.id)
          ],
        ),
      ),
    );
  }

  String chatroomId(String senderId, String receiverId) {
    return senderId.hashCode <= receiverId.hashCode
        ? '${senderId}_$receiverId'
        : "${receiverId}_$senderId";
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}
