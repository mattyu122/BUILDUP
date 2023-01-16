import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CpostProvider with ChangeNotifier {
  // ignore: non_constant_identifier_names
  DocumentSnapshot? CpostData;

  getCpostDetails(details) {
    this.CpostData = details;
    notifyListeners();
  }
}
