import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  CollectionReference cat = FirebaseFirestore.instance.collection('cat');
  CollectionReference Ccat = FirebaseFirestore.instance.collection('Ccat');
  CollectionReference post = FirebaseFirestore.instance.collection('EventPost');
}
