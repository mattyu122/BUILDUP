import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/DataModel/message.dart';

class SendNewMessageWidget extends StatefulWidget {
  final String idUser;

  const SendNewMessageWidget({
    required this.idUser,
    Key? key,
  }) : super(key: key);

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<SendNewMessageWidget> {
  final textMessageController = TextEditingController();
  String message = '';
  late final String currentContactUserId;
  late final String chatroomId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentContactUserId = widget.idUser;
    chatroomId = getchatroomId(
        FirebaseAuth.instance.currentUser!.uid, currentContactUserId);
  }

  String getchatroomId(String senderId, String receiverId) {
    return senderId.hashCode <= receiverId.hashCode
        ? '${senderId}_$receiverId'
        : "${receiverId}_$senderId";
  }

  void sendMessage() async {
    FocusScope.of(context).unfocus();

    Message newMessage = Message(
        senderId: FirebaseAuth.instance.currentUser!.uid,
        receiverId: currentContactUserId,
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
  Widget build(BuildContext context) => Container(
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
                  fillColor: Colors.grey[100],
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
