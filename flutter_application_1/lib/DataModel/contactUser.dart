import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUser {
  final String userName;
  final String email;
  final String icon;
  final String id;
  final bool groupChat;
  ContactUser({
    required this.userName,
    required this.email,
    required this.icon,
    required this.id,
    required this.groupChat,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'email': email,
      'icon': icon,
      'groupChat': groupChat,
    };
  }

  ContactUser.fromMap(Map<String, dynamic> contactUserMap)
      : id = contactUserMap["id"],
        userName = contactUserMap["userName"],
        email = contactUserMap["email"],
        icon = contactUserMap["icon"],
        groupChat = contactUserMap["groupChat"];
}
