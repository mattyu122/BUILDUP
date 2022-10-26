import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataModel/EventPosts.dart';

class UserAccount {
  final String? id;
  final String userName;
  final String email;
  final List<EventPost>? joinedEvent;

  UserAccount({
    this.id,
    required this.userName,
    required this.email,
    required this.joinedEvent,
  });

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> joinedEventList = [];
    for (var i = 0; i < joinedEvent!.length; i++) {
      joinedEventList.add(joinedEvent![i].toMap());
    }
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'joinedEvent': joinedEventList,
    };
  }

  UserAccount.fromMap(Map<String, dynamic> userAccountMap)
      : id = userAccountMap["id"],
        userName = userAccountMap["userName"],
        email = userAccountMap["email"],
        joinedEvent = userAccountMap["userAccountMap"];

  UserAccount.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        userName = doc.data()!["userName"],
        email = doc.data()!["email"],
        joinedEvent = doc.data()?["joinedEvent"].cast<EventPost>();
}
