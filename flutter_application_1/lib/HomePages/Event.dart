// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Event Page',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
