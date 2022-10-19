// // ignore_for_file: prefer_const_constructors, unnecessary_new
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_application_1/GetData/event_photo.dart';
// import 'package:flutter_application_1/services/Firebase_service.dart';

// class EventPage extends StatefulWidget {
//   const EventPage({super.key});
//   @override
//   State<EventPage> createState() => _EventPageState();
// }

// class _EventPageState extends State<EventPage> {
//   List<String> imageID = [];

//   Future getimageID() async {
//     await FirebaseFirestore.instance
//         .collection('post')
//         .get()
//         .then((photo) => photo.docs.forEach((element) {
//               imageID.add(element.reference.id);
//             }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: FutureBuilder(
//               future: getimageID(),
//               builder: (context, snapshot) {
//                 return ListView.builder(
//                   itemCount: imageID.length,
//                   itemBuilder: ((context, index) {
//                     return ListTile(
//                       title: GetEventPhoto(photoId: imageID[index]),
//                     );
//                   }),
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }
