import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/HomePages/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/GetData/Event/Event_CatSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Create.dart';
import 'package:flutter_application_1/GetData/Event/Provider.dart';
import 'package:flutter_application_1/HomePages/Home.dart';
import 'package:flutter_application_1/LoginPages/verifyEmail.dart';
import './LoginPages/login.dart';
import 'package:provider/provider.dart';

import 'GetData/Course/Course_CatSreen.dart';
import 'GetData/Event/Event_Sreen_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [Provider(create: (_) => EpostProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
      routes: {
        EventCatSreen.id: (context) => EventCatSreen(),
        CourseCatSreen.id: (context) => CourseCatSreen(),
        EventCreate.id: (context) => EventCreate(),
        EventSreenDetails.id: (context) => EventSreenDetails(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return const HomePage();
              } else {
                return const LoginPage();
              }
            }),
      );
}
