import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/ArtsSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/BusinessSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/EducationSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/EngineSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/LawSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/MedicineSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/ScienceSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/SocialscienceSreen.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';

class CourseCatSreen extends StatefulWidget {
  static const String id = 'Ccategory-list-screen';

  @override
  State<CourseCatSreen> createState() => _CourseCatSreenState();
}

class _CourseCatSreenState extends State<CourseCatSreen> {
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
                      Navigator.pushNamed(context, MedicineSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/courseCat%2Fmedicine.png?alt=media&token=647ea32f-364a-4aa1-baca-e086f88f04a8',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Medicine',
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
                      Navigator.pushNamed(context, ScienceSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/courseCat%2Fscience.png?alt=media&token=d3d5d914-47c8-41b2-978b-4547338ef164',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Science',
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
                      Navigator.pushNamed(context, EngineSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/courseCat%2Fengine.png?alt=media&token=72ead0cd-6ceb-48de-b342-4d310cdec251',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Engine',
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
                      Navigator.pushNamed(context, SocialScienceSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/courseCat%2Fsocial_science.png?alt=media&token=85832f39-334a-4b9d-98ca-e5e6bd50349e',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Social Science',
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
                      Navigator.pushNamed(context, ArtSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/courseCat%2Fart.png?alt=media&token=3236cd79-6745-49ea-adcc-146a9dcfef18',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Arts',
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
                      Navigator.pushNamed(context, BusinessSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/courseCat%2Fbusiness.png?alt=media&token=84483c1a-cf21-4485-b221-26ba79257780',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Business',
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
                      Navigator.pushNamed(context, EducationSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/courseCat%2Feducation.png?alt=media&token=1e53ac74-d420-40c9-87e9-70c0f8b52028',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Education',
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
                      Navigator.pushNamed(context, LawSreen.id);
                    },
                    leading: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buildup-7c651.appspot.com/o/courseCat%2Flaw.png?alt=media&token=21b7cc9e-aa96-459e-9dbb-52f58aac3eba',
                        width: 60,
                        height: 100,
                        fit: BoxFit.fill),
                    title: Text(
                      'TYPE : Law',
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

// class CourseCatSreen extends StatefulWidget {
//   static const String id = 'Ccategory-list-screen';

//   @override
//   State<CourseCatSreen> createState() => _CourseCatSreenState();
// }

// class _CourseCatSreenState extends State<CourseCatSreen> {
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
//           future: _service.Ccat.get(),
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
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
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
