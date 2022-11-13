import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EpostProvider with ChangeNotifier {
  // ignore: non_constant_identifier_names
  DocumentSnapshot? EpostData;

  getEpostDetails(details) {
    this.EpostData = details;
    notifyListeners();
  }
}
