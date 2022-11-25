import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataModel/EventPosts.dart';
import 'package:flutter_application_1/DataModel/contactUser.dart';

class UserAccount {
  final String? id;
  final String userName;
  final String email;
  final List<EventPost>? joinedEvent;
  final List<ContactUser>? contactUser;
  UserAccount({
    this.id,
    required this.userName,
    required this.email,
    required this.joinedEvent,
    required this.contactUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'joinedEvent': joinedEvent!.map((i) => i.toMap()).toList(),
      'contactUser': contactUser!.map((i) => i.toMap()).toList(),
    };
  }

  UserAccount.fromMap(Map<String, dynamic> userAccountMap)
      : id = userAccountMap["id"],
        userName = userAccountMap["userName"],
        email = userAccountMap["email"],
        joinedEvent = List<EventPost>.from(userAccountMap['joinedEvent']
            .map((e) => EventPost.fromMap(e))), //["joinedEvent"],
        contactUser = List<ContactUser>.from(userAccountMap['contactUser'].map(
            (d) => ContactUser.fromMap(d))); // userAccountMap["contactUser"];

}
