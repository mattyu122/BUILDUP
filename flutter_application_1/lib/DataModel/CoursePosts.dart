import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataModel/userAccount.dart';

class CoursePost {
  final String PostN; //title
  final String faculty; //faculty
  final String hostName;
  final String? PostD; //date
  final int PostL;
  final String? groupMateTypes;
  final String ChostUserId;
  final String? PostP;
  // final String category;
  final String? location;
  final String? description;
  final int expectedNumber;
  final int joinedNumber;
  final List<String>? joinedAccount;
  final String createAt;
  final List<String> favc;
  CoursePost(
      {required this.PostN,
      required this.faculty,
      // required this.category,
      required this.hostName,
      required this.expectedNumber,
      required this.joinedNumber,
      required this.PostL,
      required this.favc,
      required this.ChostUserId,
      this.groupMateTypes,
      this.PostD,
      this.PostP,
      this.location,
      this.description,
      this.joinedAccount,
      required this.createAt});

  Map<String, dynamic> toMap() {
    return {
      'faculty': faculty,
      'PostN': PostN,
      'PostD': PostD,
      'ChostUserId': ChostUserId,
      'groupMateTypes': groupMateTypes,
      'PostL': PostL,
      'PostP': PostP,
      // 'category': category,
      'description': description,
      'hostName': hostName,
      'location': location,
      'expectedNumber': expectedNumber,
      'joinedNumber': joinedNumber,
      'createAt': createAt,
      'joinedAccount': joinedAccount!.map((i) => i.toString()).toList(),
      'favc': favc.map((i) => i.toString()).toList(),
    };
  }

  CoursePost.fromMap(Map<String, dynamic> eventPostMap)
      : PostN = eventPostMap["PostN"],
        faculty = eventPostMap["faculty"],
        PostD = eventPostMap['PostD'],
        PostL = eventPostMap['PostL'],
        PostP = eventPostMap['PostP'],
        groupMateTypes = eventPostMap["groupMateTypes"],
        ChostUserId = eventPostMap['ChostUserId'],
        // category = eventPostMap['category'],
        description = eventPostMap['description'],
        hostName = eventPostMap["hostName"],
        location = eventPostMap["location"],
        expectedNumber = eventPostMap["expectedNumber"],
        joinedNumber = eventPostMap["joinedNumber"],
        createAt = eventPostMap['createAt'],
        joinedAccount = eventPostMap["joinedAccount"].cast<String>(),
        favc = eventPostMap["favc"].cast<String>();
}
