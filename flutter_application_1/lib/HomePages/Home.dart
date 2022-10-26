// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:flutter_application_1/HomePages/Chat.dart';
import 'package:flutter_application_1/HomePages/Course.dart';
import 'package:flutter_application_1/HomePages/Event.dart';
import 'package:flutter_application_1/HomePages/Profile.dart';

import '../DrawerPages/Favourites.dart';
import '../DrawerPages/Host.dart';
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
    ChatPage(),
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
      drawer: const NavigationDrawer(),
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

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});
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
          children: const [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://www.pngfind.com/pngs/m/93-938537_png-file-fa-user-circle-o-transparent-png.png'),
            ),
            SizedBox(height: 10),
            Text('USER NAME',
                style: TextStyle(color: Colors.white, fontSize: 25)),
            // Text('USER EMAIL',
            //     style: TextStyle(color: Colors.black, fontSize: 20))
          ],
        ),
      );

  Widget Items(BuildContext context) => Container(
        padding: EdgeInsets.all(25),
        child: Wrap(
          runSpacing: 15,
          children: [
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text(
                'Host',
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
                Icons.favorite,
                color: Colors.black,
              ),
              title: const Text(
                'Favourites',
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
                Icons.settings,
                color: Colors.black,
              ),
              title: const Text(
                'Setting',
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
            ListTile(
              leading: const Icon(
                Icons.notifications_sharp,
                color: Colors.black,
              ),
              title: const Text(
                'Notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotiPage(),
                ));
              },
            ),
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
