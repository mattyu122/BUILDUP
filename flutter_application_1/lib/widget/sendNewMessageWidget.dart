import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/DataModel/contactUser.dart';
import 'package:flutter_application_1/DataModel/message.dart';

class SendNewMessageWidget extends StatefulWidget {
  final ContactUser contact;
  const SendNewMessageWidget({
    required this.contact,
    Key? key,
  }) : super(key: key);

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<SendNewMessageWidget> {
  final textMessageController = TextEditingController();
  String message = '';
  late final String chatroomId;
  late final String senderName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatroomId = getchatroomId(FirebaseAuth.instance.currentUser!.uid,
        widget.contact.id, widget.contact.groupChat);
  }

  String getchatroomId(String senderId, String receiverId, bool groupChat) {
    if (groupChat) {
      return receiverId;
    }
    return senderId.hashCode <= receiverId.hashCode
        ? '${senderId}_$receiverId'
        : "${receiverId}_$senderId";
  }

  void sendMessage() async {
    FocusScope.of(context).unfocus();
    final tmp = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    senderName = tmp.data()!['userName'];
    Message newMessage = Message(
        senderId: FirebaseAuth.instance.currentUser!.uid,
        senderName: senderName,
        receiverId: widget.contact.id,
        message: message,
        createdAt: DateTime.now().toString());

    print(chatroomId);
    await FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatroomId)
        .collection(chatroomId)
        .doc(DateTime.now().toString()) //DateTime.now().toString()
        .set(newMessage.toMap());

    textMessageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textMessageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 4),
                  gapPadding: 3,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onChanged: (value) => setState(() {
                message = value;
              }),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: message.trim().isEmpty ? null : sendMessage,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 96, 24, 212),
              ),
              child: const Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
