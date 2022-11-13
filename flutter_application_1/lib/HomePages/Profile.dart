// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DrawerPages/Setting.dart';
import 'package:flutter_application_1/HomePages/Home.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selected = 0;

  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      print('object');
    }
  }

  Widget customRadio(String text, int index, final text2) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(100, 100),
        backgroundColor: (selected == index)
            ? Color.fromARGB(255, 240, 69, 240)
            : Color.fromARGB(255, 224, 154, 241),
      ),
      child: Column(
        children: [
          Icon(
            text2,
            size: 67,
            color: (selected == index)
                ? Colors.black
                : Color.fromARGB(255, 255, 255, 255),
          ),
          Text(
            text,
            style: TextStyle(
                color: (selected == index)
                    ? Colors.black
                    : Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(255, 119, 20, 244),
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SetPage(),
                ));
              },
              icon: Icon(
                Icons.settings,
              ),
            )
          ],
          title: Text('PROFILE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              )),
          toolbarHeight: 56,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Center(
                    child: InkWell(
                      splashColor: Colors.blue,
                      borderRadius: BorderRadius.circular(150.0),
                      // customBorder: CircleBorder(),
                      onTap: () {},
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://www.pngfind.com/pngs/m/93-938537_png-file-fa-user-circle-o-transparent-png.png'),
                            )),
                      ),
                    ),
                  ),

                  // Positioned(
                  //     bottom: 0,
                  //     right: 0,
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //       ),
                  //       child: Icon(
                  //         Icons.edit,
                  //         color: Colors.white,
                  //       ),
                  //     )),

                  SizedBox(
                    height: 10,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'xxxxxxx@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(),
                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.black,
                              // border: Border.all(
                              //     color: Color.fromARGB(255, 181, 156, 255),
                              //     width: 2),
                              // borderRadius: BorderRadius.circular(10.0),
                              ),
                          child: TextFormField(
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  filled: true, //<-- SEE HERE
                                  fillColor: Color.fromARGB(255, 181, 156, 255),
                                  constraints: BoxConstraints.tightFor(
                                      width: 380, height: 65),
                                  // labelText: 'Description',
                                  // labelStyle: TextStyle(
                                  //   color: Colors.white,
                                  //   fontWeight: FontWeight.bold,
                                  // ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 181, 156, 255),
                                          width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 119, 20, 244),
                                          width: 2)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please complete required flied';
                                }
                                return null;
                              }),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Text(
                          'Major',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.black,
                              // border: Border.all(
                              //     color: Color.fromARGB(255, 181, 156, 255),
                              //     width: 2),
                              // borderRadius: BorderRadius.circular(10.0),
                              ),
                          child: TextFormField(
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  filled: true, //<-- SEE HERE
                                  fillColor: Color.fromARGB(255, 181, 156, 255),
                                  constraints: BoxConstraints.tightFor(
                                      width: 380, height: 60),
                                  // labelText: 'Description',
                                  // labelStyle: TextStyle(
                                  //   color: Colors.white,
                                  //   fontWeight: FontWeight.bold,
                                  // ),

                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 181, 156, 255),
                                          width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 119, 20, 244),
                                          width: 2)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please complete required flied';
                                }
                                return null;
                              }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: TextFormField(
                              maxLines: 30,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  filled: true, //<-- SEE HERE
                                  fillColor: Color.fromARGB(255, 181, 156, 255),
                                  constraints: BoxConstraints.tightFor(
                                      width: 380, height: 200),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 181, 156, 255),
                                          width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 119, 20, 244),
                                          width: 2)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please complete required flied';
                                }
                                return null;
                              }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Select Your Gender',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         Expanded(
                  //             child: ElevatedButton(
                  //                 onPressed: () {}, child: Text("MALE"))),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         Expanded(
                  //             child: ElevatedButton(
                  //                 onPressed: () {}, child: Text("FEMALE"))),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         Expanded(
                  //             child: ElevatedButton(
                  //                 onPressed: () {}, child: Text("OTHER"))),
                  //       ]),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customRadio("MALE", 1, Icons.male),
                        SizedBox(
                          width: 20,
                        ),
                        customRadio("FEMALE", 2, Icons.female),
                        SizedBox(
                          width: 20,
                        ),
                        customRadio("OTHER", 3, Icons.transgender)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Text(
                          'Your Tags',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: TextFormField(
                              maxLines: 30,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  filled: true, //<-- SEE HERE
                                  fillColor: Color.fromARGB(255, 181, 156, 255),
                                  constraints: BoxConstraints.tightFor(
                                      width: 380, height: 200),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 181, 156, 255),
                                          width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 119, 20, 244),
                                          width: 2)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please complete required flied';
                                }
                                return null;
                              }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 40,
                          margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1),
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                          ),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "",
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 10, right: 10, top: 0),
                              hintStyle: TextStyle(
                                  fontSize: 17.0,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 40,
                            top: 12,
                            child: Container(
                              padding:
                                  EdgeInsets.only(bottom: 0, left: 5, right: 5),
                              color: Colors.black,
                              child: Text(
                                'Add Tag here',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            )),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(380, 50),
                            backgroundColor: Color.fromARGB(255, 181, 156, 255),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          validate();
                        },
                        child: Text(
                          'SAVE INFORMATION',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        )));
  }
}

// // ignore_for_file: prefer_const_constructors, unnecessary_new
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/DrawerPages/Setting.dart';
// import 'package:flutter_application_1/HomePages/Home.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   int selected = 0;

//   Widget customRadio(String text, int index, final text2) {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           selected = index;
//         });
//       },
//       style: ElevatedButton.styleFrom(
//         minimumSize: Size(100, 100),
//         backgroundColor: (selected == index)
//             ? Color.fromARGB(255, 240, 69, 240)
//             : Color.fromARGB(255, 224, 154, 241),
//       ),
//       child: Column(
//         children: [
//           Icon(
//             text2,
//             size: 67,
//             color: (selected == index)
//                 ? Colors.black
//                 : Color.fromARGB(255, 255, 255, 255),
//           ),
//           Text(
//             text,
//             style: TextStyle(
//                 color: (selected == index)
//                     ? Colors.black
//                     : Color.fromARGB(255, 255, 255, 255),
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: const NavigationDrawer(),
//         appBar: new AppBar(
//           backgroundColor: Color.fromARGB(255, 119, 20, 244),
//           iconTheme: IconThemeData(
//               color: Color.fromARGB(255, 255, 255, 255), size: 30),
//           centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => const SetPage(),
//                 ));
//               },
//               icon: Icon(
//                 Icons.settings,
//               ),
//             )
//           ],
//           title: Text('PROFILE',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25.0,
//               )),
//           toolbarHeight: 56,
//         ),
//         backgroundColor: Colors.black,
//         body: SafeArea(
//             child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 SizedBox(height: 20.0),
//                 Center(
//                   child: InkWell(
//                     splashColor: Colors.blue,
//                     borderRadius: BorderRadius.circular(150.0),
//                     // customBorder: CircleBorder(),
//                     onTap: () {},
//                     child: Container(
//                       width: 300,
//                       height: 300,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                                 'https://www.pngfind.com/pngs/m/93-938537_png-file-fa-user-circle-o-transparent-png.png'),
//                           )),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                       child: Text(
//                         'xxxxxxx@gmail.com',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17.0,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7),
//                     Container(),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Text(
//                         'Name',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17.0,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 181, 156, 255),
//                           border: Border.all(color: Colors.white),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "",
//                             contentPadding: EdgeInsets.all(10.0),
//                             hintStyle: TextStyle(
//                                 fontSize: 17.0,
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Text(
//                         'Major',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17.0,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 181, 156, 255),
//                           border: Border.all(color: Colors.white),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "",
//                             contentPadding: EdgeInsets.all(10.0),
//                             hintStyle: TextStyle(
//                                 fontSize: 17.0,
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Text(
//                         'Description',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17.0,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Container(
//                         height: 150,
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 181, 156, 255),
//                           border: Border.all(color: Colors.white),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "",
//                             contentPadding: EdgeInsets.only(
//                                 left: 10, bottom: 0, right: 10, top: 0),
//                             hintStyle: TextStyle(
//                                 fontSize: 17.0,
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                           ),
//                           maxLines: 10,
//                           minLines: 1,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Text(
//                         'Select Your Gender',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17.0,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7),
//                     Container(),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       customRadio("MALE", 1, Icons.male),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       customRadio("FEMALE", 2, Icons.female),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       customRadio("OTHER", 3, Icons.transgender)
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Text(
//                         'Your Tags',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17.0,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Container(
//                         height: 150,
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 181, 156, 255),
//                           border: Border.all(color: Colors.white),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "",
//                             contentPadding: EdgeInsets.only(
//                                 left: 10, bottom: 5, right: 10, top: 0),
//                             hintStyle: TextStyle(
//                                 fontSize: 17.0,
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                           ),
//                           maxLines: 10,
//                           minLines: 1,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 0,
//                 ),
//                 Container(
//                   child: Stack(
//                     children: <Widget>[
//                       Container(
//                         width: double.infinity,
//                         height: 40,
//                         margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
//                         padding: EdgeInsets.only(bottom: 10),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               width: 1),
//                           borderRadius: BorderRadius.circular(10),
//                           shape: BoxShape.rectangle,
//                         ),
//                         child: TextField(
//                           style: TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "",
//                             contentPadding: EdgeInsets.only(
//                                 left: 10, bottom: 10, right: 10, top: 0),
//                             hintStyle: TextStyle(
//                                 fontSize: 17.0,
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                           left: 35,
//                           top: 12,
//                           child: Container(
//                             padding:
//                                 EdgeInsets.only(bottom: 0, left: 5, right: 5),
//                             color: Colors.black,
//                             child: Text(
//                               'Add Tag here',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 12),
//                             ),
//                           )),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 0.0),
//                   child: Container(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           fixedSize: const Size(380, 50),
//                           backgroundColor: Color.fromARGB(255, 181, 156, 255),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                       onPressed: () {},
//                       child: Text(
//                         'SAVE INFORMATION',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 )
//               ],
//             ),
//           ),
//         )));
//   }
// }
