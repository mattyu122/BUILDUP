import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataModel/EventPosts.dart';
import 'package:flutter_application_1/DataModel/contactUser.dart';

class UserAccount {
  final String? id;
  final String userName;
  final String email;
  final List<EventPost>? joinedEvent;
  final List<ContactUser>? contactUser;
  final String? major;
  final String? introduction;
  final String? gender;
  final String? tags;
  final String? profileImageUrl;
  final String? faculty;
  final String? interestEvent;
  final String? groupMateTag;
  UserAccount({
    this.id,
    this.major,
    this.introduction,
    this.gender,
    this.tags,
    required this.userName,
    required this.email,
    required this.joinedEvent,
    required this.contactUser,
    this.profileImageUrl,
    this.faculty,
    this.interestEvent,
    this.groupMateTag,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'joinedEvent': joinedEvent!.map((i) => i.toMap()).toList(),
      'contactUser': contactUser!.map((i) => i.toMap()).toList(),
      'major': major,
      'introduction': introduction,
      'gender': gender,
      'tags': tags,
      'profileImageUrl': profileImageUrl,
      'faculty': faculty,
      'interestEvent': interestEvent,
      'groupMateTag': groupMateTag,
    };
  }

  UserAccount.fromMap(Map<String, dynamic> userAccountMap)
      : id = userAccountMap["id"],
        userName = userAccountMap["userName"],
        email = userAccountMap["email"],
        joinedEvent = List<EventPost>.from(userAccountMap['joinedEvent']
            .map((e) => EventPost.fromMap(e))), //["joinedEvent"],
        contactUser = List<ContactUser>.from(userAccountMap['contactUser'].map(
            (d) => ContactUser.fromMap(d))), // userAccountMap["contactUser"];
        major = userAccountMap['major'],
        introduction = userAccountMap['introduction'],
        gender = userAccountMap['gender'],
        tags = userAccountMap['tags'],
        profileImageUrl = userAccountMap['profileImageUrl'],
        faculty = userAccountMap['faculty'],
        interestEvent = userAccountMap['interestEvent'],
        groupMateTag = userAccountMap['groupMateTag'];
}
