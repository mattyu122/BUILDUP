import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DataModel/CoursePosts.dart';
import 'package:flutter_application_1/DataModel/EventPosts.dart';
import 'package:flutter_application_1/DataModel/contactUser.dart';

class FirebaseService {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference cat = FirebaseFirestore.instance.collection('cat');
  CollectionReference Ccat = FirebaseFirestore.instance.collection('Ccat');
  CollectionReference post = FirebaseFirestore.instance.collection('EventPost');
  // CollectionReference post = FirebaseFirestore.instance.collection('NewEPost');
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  CollectionReference Cpost =
      FirebaseFirestore.instance.collection('CoursePost');

  CollectionReference chatRoom =
      FirebaseFirestore.instance.collection("chatroom");

  Future<void> deleteEventPost(String postId) async {
    await post.doc(postId).delete();
  }

  Future<bool> joinEvent(String? postId) async {
    final data = await post.doc(postId).get();
    final tmppost = EventPost.fromMap(data.data() as Map<String, dynamic>);
    if (tmppost.joinedNumber < tmppost.expectedNumber) {
      await post.doc(postId).update({'joinedNumber': FieldValue.increment(1)});
      await post.doc(postId).update({
        'joinedAccount': FieldValue.arrayUnion([user?.uid])
      });
      print("joined");
      return true;
    }

    return false;
  }

  //implement: add Contact() to every joined member's contact attribute in firebase and add notification
  Future<void> createChatRoomForEventGroup(
      String? chatRoomId, String chatRoomName, String? postId) async {
    final data = await post.doc(postId).get();
    final tmppost = EventPost.fromMap(data.data() as Map<String, dynamic>);
    final chatRoom = ContactUser(
        userName: chatRoomName,
        email: "",
        icon: "",
        id: chatRoomId!,
        groupChat: true);

    await users.doc(tmppost.hostUserId).update({
      'contactUser': FieldValue.arrayUnion([chatRoom.toMap()])
    });

    for (int i = 0; i < tmppost.joinedAccount!.length; i++) {
      await users.doc(tmppost.joinedAccount![i]).update({
        'contactUser': FieldValue.arrayUnion([chatRoom.toMap()])
      });
    }
    return;
  }

  Future<void> createChatRoomForCourseGroup(
      String? chatRoomId, String chatRoomName, String? postId) async {
    final data = await Cpost.doc(postId).get();
    final tmppost = CoursePost.fromMap(data.data() as Map<String, dynamic>);
    final chatRoom = ContactUser(
        userName: chatRoomName,
        email: "",
        icon: "",
        id: chatRoomId!,
        groupChat: true);

    await users.doc(tmppost.ChostUserId).update({
      'contactUser': FieldValue.arrayUnion([chatRoom.toMap()])
    });

    for (int i = 0; i < tmppost.joinedAccount!.length; i++) {
      await users.doc(tmppost.joinedAccount![i]).update({
        'contactUser': FieldValue.arrayUnion([chatRoom.toMap()])
      });
    }
  }

  // updateFavourite(_isliked, postId, context) {
  //   if (_isliked) {
  //     post.doc(postId).update({
  //       'fav': FieldValue.arrayUnion([user?.uid]),
  //       'PostL': FieldValue.increment(1),
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Added to my favourite')),
  //     );
  //   } else {
  //     post.doc(postId).update({
  //       'fav': FieldValue.arrayRemove([user?.uid]),
  //       'PostL': FieldValue.increment(-1),
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Removed to my favourite')),
  //     );
  //   }
  // }

  updateFavourite2(_isliked1, postId1, context) {
    if (_isliked1) {
      Cpost.doc(postId1).update({
        'favc': FieldValue.arrayUnion([user?.uid]),
        'PostL': FieldValue.increment(1),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to my favourite')),
      );
    } else {
      Cpost.doc(postId1).update({
        'favc': FieldValue.arrayRemove([user?.uid]),
        'PostL': FieldValue.increment(-1),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Removed to my favourite')),
      );
    }
  }

  updateFavourite3(_isliked3, postId3, context) {
    if (_isliked3) {
      post.doc(postId3).update({
        'fav': FieldValue.arrayUnion([user?.uid]),
        'PostL': FieldValue.increment(1),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to my favourite')),
      );
    } else {
      post.doc(postId3).update({
        'fav': FieldValue.arrayRemove([user?.uid]),
        'PostL': FieldValue.increment(-1),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Removed to my favourite')),
      );
    }
  }
}
