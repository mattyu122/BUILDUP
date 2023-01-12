import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/DramaSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/FoodSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/GameScreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/MovieSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/MusicSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/PartySreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/PhotoSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/ReadSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/SingSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/SportSreen.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';

class EventCatSreen extends StatefulWidget {
  static const String id = 'category-list-screen';

  @override
  State<EventCatSreen> createState() => _EventCatSreenState();
}

class _EventCatSreenState extends State<EventCatSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 119, 20, 244),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        title: Text('Categories',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            )),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, MovieSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FMovie.png?alt=media&token=167768c1-8476-40e6-b4eb-1a0de8e291b8',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Moive',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, PhotoSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FPhoto.png?alt=media&token=f04068d3-0a2b-431f-b239-9ed3e26a5262',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Photo',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, GameScreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FGame.png?alt=media&token=105bd0c2-0d78-4632-a1a8-98c02c093311',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Game',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, ReadSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FRead.png?alt=media&token=f6876a8e-fb86-4d78-a2df-49911758a619',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Read',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, SportSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FSport.png?alt=media&token=28a38a6f-b041-445a-9966-162af2d5b8de',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Sport',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, MusicSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FMusic.png?alt=media&token=b895e71d-6fa3-4af3-a8ba-4c576e6252b2',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Music',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, FoodSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FFood.png?alt=media&token=f42de56c-b643-4495-a6ba-8674571d0ed5',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Food',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, PartySreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FMusic.png?alt=media&token=b895e71d-6fa3-4af3-a8ba-4c576e6252b2',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Party',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, SingSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FSing.png?alt=media&token=01de966d-db7f-4bda-adf6-7a3fbbc2d95e',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Sing',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, DramaSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/categories%2FDrama.png?alt=media&token=720583d5-1bc5-4944-96cb-f6a73b105a47',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Drama',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_1/services/Firebase_service.dart';

// class EventCatSreen extends StatefulWidget {
//   static const String id = 'category-list-screen';

//   @override
//   State<EventCatSreen> createState() => _EventCatSreenState();
// }

// class _EventCatSreenState extends State<EventCatSreen> {
//   @override
//   Widget build(BuildContext context) {
//     FirebaseService _service = FirebaseService();
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 56,
//         elevation: 0,
//         backgroundColor: Color.fromARGB(255, 119, 20, 244),
//         iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
//         title: Text(
//           'Categories',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 22.0,
//           ),
//         ),
//       ),
//       body: Container(
//         color: Color.fromARGB(255, 255, 255, 255),
//         child: FutureBuilder<QuerySnapshot>(
//           future: _service.cat.get(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Text('Something went wrong');
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Text("");
//             }

//             return Container(
//               child: ListView.builder(
//                   itemCount: snapshot.data?.docs.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     var doc = snapshot.data?.docs[index];
//                     return Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         color: Colors.white,
//                         height: 70,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             ListTile(
//                               onTap: () {},
//                               leading: Image.network(doc!['catP'],
//                                   width: 60, height: 100, fit: BoxFit.fill),
//                               title: Text(
//                                 'TYPE : ${doc['catN']}',
//                                 style: TextStyle(
//                                     fontSize: 18, color: Colors.black),
//                               ),
//                               trailing: Icon(Icons.arrow_forward_ios, size: 12),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
