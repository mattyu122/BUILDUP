// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DrawerPages/CFavourites.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/HomePages/Chatspage.dart';
import 'package:flutter_application_1/HomePages/Course.dart';
import 'package:flutter_application_1/HomePages/Event.dart';
import 'package:flutter_application_1/HomePages/Profile.dart';
import 'package:flutter_application_1/services/Firebase_service.dart';
import 'package:flutter_application_1/DataModel/userAccount.dart';

import '../DrawerPages/Favourites.dart';
import '../DrawerPages/Host.dart';
import '../DrawerPages/HostC.dart';
import '../DrawerPages/Notifications.dart';
import '../DrawerPages/Setting.dart';
import '../LoginPages/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selecIndex = 0;
  void _navigate(int index) {
    setState(() {
      _selecIndex = index;
    });
  }

  final List<Widget> _pages = [
    Chatspage(),
    CoursePage(),
    EventPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   toolbarHeight: 42,
      //   backgroundColor: Color.fromARGB(255, 119, 20, 244),
      // ),
      body: _pages[_selecIndex],
      drawer: NavigationDrawer(),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
              backgroundColor: Colors.black,
              activeColor: Colors.white,
              color: Colors.white,
              tabBackgroundColor: Colors.grey.shade900,
              gap: 8,
              padding: EdgeInsets.all(15),
              onTabChange: _navigate,
              tabs: const [
                GButton(
                  icon: Icons.chat,
                  text: 'Chat',
                ),

                // GButton(
                //   icon: Icons.assignment_ind,
                //   text: 'Host',
                // ),

                GButton(
                  icon: Icons.event_note,
                  text: 'Course',
                ),

                GButton(
                  //APPS
                  //LAYERS
                  icon: Icons.layers,
                  text: 'Event',
                ),

                GButton(
                  //perm_contact_calendar
                  //person
                  //perm_identity
                  icon: Icons.perm_contact_calendar,
                  text: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({super.key}); //This key is what we use
  @override
  _NavigationDrawer createState() => _NavigationDrawer();
}

class _NavigationDrawer extends State<NavigationDrawer> {
  late UserAccount currentUserInfo;
  late String username = "";
  late String profilePhotoURL = "";
  Future fetchUserInfo() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => {
              currentUserInfo = UserAccount.fromMap(value.data()!),
            });
    setState(() {
      username = currentUserInfo.userName;
      profilePhotoURL = currentUserInfo.profileImageUrl ?? "";
    }); //This line rebuilds the scaffold
  }

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(context),
              Items(context),
            ],
          ),
        ),
      );

  Widget Header(BuildContext context) => Container(
        color: Color.fromARGB(255, 0, 0, 0),
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: profilePhotoURL == ""
                  ? NetworkImage(
                      'https://www.pngfind.com/pngs/m/93-938537_png-file-fa-user-circle-o-transparent-png.png')
                  : NetworkImage(profilePhotoURL),
            ),
            SizedBox(height: 10),
            Text(username, style: TextStyle(color: Colors.white, fontSize: 25)),
            // Text('USER EMAIL',
            //     style: TextStyle(color: Colors.black, fontSize: 20))
          ],
        ),
      );

  Widget Items(BuildContext context) => Container(
        padding: EdgeInsets.all(25),
        child: Wrap(
          runSpacing: 25,
          children: [
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text(
                'Host Events',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HostPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text(
                'Host Courses',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HostCPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              title: const Text(
                'Favourite Events',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              onTap: () {
                // Navigator.pop(context); close the drawer
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavPage(),
                ));
              },
            ),
            // const Divider(
            //   color: Colors.black,
            // ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              title: const Text(
                'Favourite Courses',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              onTap: () {
                // Navigator.pop(context); close the drawer
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavPageC(),
                ));
              },
            ),
            // const Divider(
            //   color: Colors.black,
            // ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: const Text(
                'Password Setting',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SetPage(),
                ));
              },
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.notifications_sharp,
            //     color: Colors.black,
            //   ),
            //   title: const Text(
            //     'Notifications',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 15.0,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => const NotiPage(),
            //     ));
            //   },
            // ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              onTap: signOut,
            ),
          ],
        ),
      );
}

Future signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}
