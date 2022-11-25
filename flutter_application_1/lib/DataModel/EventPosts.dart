import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataModel/userAccount.dart';

class EventPost {
  final String PostN;
  final String hostName;
  final String? PostD;
  final int PostL;
  final String? PostP;
  final String? price;
  final String category;
  final String? location;
  final String? description;
  final int expectedNumber;
  final int joinedNumber;
  final List<UserAccount>? joinedAccount;
  final String createAt;
  EventPost(
      {required this.PostN,
      required this.category,
      required this.hostName,
      required this.expectedNumber,
      required this.joinedNumber,
      required this.PostL,
      this.PostD,
      this.PostP,
      this.location,
      this.description,
      this.price,
      this.joinedAccount,
      required this.createAt});

  Map<String, dynamic> toMap() {
    return {
      'title': PostN,
      'PostD': PostD,
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
      'joinedAccount': joinedAccount!.map((i) => i.toMap()).toList(),
    };
  }

  EventPost.fromMap(Map<String, dynamic> eventPostMap)
      : PostN = eventPostMap["PostN"],
        PostD = eventPostMap['PostD'],
        price = eventPostMap['price'],
        PostL = eventPostMap['PostL'],
        PostP = eventPostMap['PostP'],
        category = eventPostMap['category'],
        description = eventPostMap['description'],
        hostName = eventPostMap["hostName"],
        location = eventPostMap["location"],
        expectedNumber = eventPostMap["expectedNumber"],
        joinedNumber = eventPostMap["joinedNumber"],
        createAt = eventPostMap['createAt'],
        joinedAccount = eventPostMap["joinedAccount"];
}
