// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
