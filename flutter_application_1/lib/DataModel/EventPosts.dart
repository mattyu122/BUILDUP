import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataModel/userAccount.dart';

class EventPost {
  final String PostN;
  final String? faculty;
  final String gender;
  final String hostName;
  final String? eventType;
  final String? PostD;
  final int PostL;
  final String hostUserId;
  final String? PostP;
  final double? price;
  final String category;
  final String? location;
  final String? description;
  final int expectedNumber;
  final int joinedNumber;
  final List<String>? joinedAccount;
  final String createAt;
  final List<String> fav;
  EventPost(
      {required this.PostN,
      required this.gender,
      required this.category,
      required this.hostName,
      required this.expectedNumber,
      required this.joinedNumber,
      required this.PostL,
      required this.fav,
      required this.hostUserId,
      this.eventType,
      this.faculty,
      this.PostD,
      this.PostP,
      this.location,
      this.description,
      this.price,
      this.joinedAccount,
      required this.createAt});

  Map<String, dynamic> toMap() {
    return {
      'PostN': PostN,
      'PostD': PostD,
      'faculty': faculty,
      'gender': gender,
      'hostUserId': hostUserId,
      'price': price,
      'PostL': PostL,
      'PostP': PostP,
      'category': category,
      'description': description,
      'hostName': hostName,
      'location': location,
      'expectedNumber': expectedNumber,
      'joinedNumber': joinedNumber,
      'createAt': createAt,
      'joinedAccount': joinedAccount!.map((i) => i.toString()).toList(),
      'fav': fav.map((i) => i.toString()).toList(),
    };
  }

  EventPost.fromMap(Map<String, dynamic> eventPostMap)
      : PostN = eventPostMap["PostN"],
        PostD = eventPostMap['PostD'],
        price = eventPostMap['price'],
        PostL = eventPostMap['PostL'],
        PostP = eventPostMap['PostP'],
        gender = eventPostMap['gender'],
        eventType = eventPostMap['eventType'],
        faculty = eventPostMap['faculty'],
        hostUserId = eventPostMap['hostUserId'],
        category = eventPostMap['category'],
        description = eventPostMap['description'],
        hostName = eventPostMap["hostName"],
        location = eventPostMap["location"],
        expectedNumber = eventPostMap["expectedNumber"],
        joinedNumber = eventPostMap["joinedNumber"],
        createAt = eventPostMap['createAt'],
        joinedAccount = eventPostMap["joinedAccount"].cast<String>(),
        fav = eventPostMap["fav"].cast<String>();
}
