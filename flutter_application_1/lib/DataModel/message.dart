import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String receiverId;
  final String message;
  final String createdAt;
  final String senderName;
  Message({
    required this.senderName,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.createdAt,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderName': senderName,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'createdAt': createdAt,
    };
  }

  Message.fromMap(Map<String, dynamic> messageMap)
      : senderId = messageMap["senderId"],
        receiverId = messageMap["receiverId"],
        message = messageMap["message"],
        senderName = messageMap["senderName"],
        createdAt = messageMap["createdAt"];
}
