import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataModel/userAccount.dart';

class EventPost {
  final String? id;
  final String postName;
  final String hostName;
  final String location;
  final int expectedNumber;
  final int joinedNumber;
  final List<UserAccount>? joinedAccount;
  EventPost(
      {this.id,
      required this.postName,
      required this.hostName,
      required this.location,
      required this.expectedNumber,
      required this.joinedNumber,
      this.joinedAccount});

  Map<String, dynamic> toMap() {
    return {
      'postName': postName,
      'hostName': hostName,
      'location': location,
      'expectedNumber': expectedNumber,
      'joinedNumber': joinedNumber,
      'joinedAccount': joinedAccount
    };
  }

  EventPost.fromMap(Map<String, dynamic> eventPostMap)
      : id = eventPostMap["id"],
        postName = eventPostMap["postName"],
        hostName = eventPostMap["hostName"],
        location = eventPostMap["location"],
        expectedNumber = eventPostMap["expectedNumber"],
        joinedNumber = eventPostMap["joinedNumber"],
        joinedAccount = eventPostMap["joinedAccount"];

  EventPost.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        postName = doc.data()!['postName'],
        hostName = doc.data()!['hostName'],
        location = doc.data()!['location'],
        expectedNumber = doc.data()!['expectedNumber'],
        joinedNumber = doc.data()!['joinedNumber'],
        joinedAccount = doc.data()!['joinedAccount'];
}
