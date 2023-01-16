import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference cat = FirebaseFirestore.instance.collection('cat');
  CollectionReference Ccat = FirebaseFirestore.instance.collection('Ccat');
  CollectionReference post = FirebaseFirestore.instance.collection('EventPost');
  CollectionReference Cpost =
      FirebaseFirestore.instance.collection('CoursePost');

  updateFavourite(_isliked, postId, context) {
    if (_isliked) {
      post.doc(postId).update({
        'fav': FieldValue.arrayUnion([user?.uid]),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to my favourite')),
      );
    } else {
      post.doc(postId).update({
        'fav': FieldValue.arrayRemove([user?.uid])
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Removed to my favourite')),
      );
    }
  }

  updateFavourite2(_isliked1, postId1, context) {
    if (_isliked1) {
      Cpost.doc(postId1).update({
        'favc': FieldValue.arrayUnion([user?.uid]),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to my favourite')),
      );
    } else {
      Cpost.doc(postId1).update({
        'favc': FieldValue.arrayRemove([user?.uid])
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Removed to my favourite')),
      );
    }
  }
}
