// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class GetEventPhoto extends StatelessWidget {
//   final String photoId;
//   GetEventPhoto({required this.photoId});

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference post = FirebaseFirestore.instance.collection('post');
//     return FutureBuilder<DocumentSnapshot>(
//         future: post.doc(photoId).get(),
//         builder: ((context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data!.data() as Map<String, dynamic>;

//             return Container(
//               child: Column(
//                 children: [Text(data['postN']), Image.network(data['postP'])],
//               ),
//             );

//             // Text('Name: ${data['catName']}');
//           }
//           return Text('loading');
//         }));
//   }
// }
