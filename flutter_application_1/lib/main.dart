import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/HomePages/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/ArtSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/EngineSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/LawSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/BusinessSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/EducationSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/MedicineSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/ScienceSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Cat/SocialscienceSreen.dart';
import 'package:flutter_application_1/GetData/Course/Course_Sreen_details.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/DramaSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/GameScreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/PartySreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/PhotoSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/ReadSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/SingSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Cat/SportSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_CatSreen.dart';
import 'package:flutter_application_1/GetData/Event/Event_Create.dart';
import 'package:flutter_application_1/GetData/Event/Provider.dart';
import 'package:flutter_application_1/HomePages/Home.dart';
import './LoginPages/login.dart';
import 'package:provider/provider.dart';

import 'GetData/Course/C_Provider.dart';

import 'GetData/Course/Course_CatSreen.dart';
import 'GetData/Event/Event_Cat/Drama.dart';
import 'GetData/Event/Event_Cat/FoodSreen.dart';
import 'GetData/Event/Event_Cat/MovieSreen.dart';
import 'GetData/Event/Event_Cat/MusicSreen.dart';
import 'GetData/Event/Event_Sreen_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => EpostProvider()),
      Provider(create: (_) => CpostProvider()),
    ],
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
        GameScreen.id: (context) => GameScreen(),
        DramaSreen.id: (context) => DramaSreen(),
        FoodSreen.id: (context) => FoodSreen(),
        MovieSreen.id: (context) => MovieSreen(),
        MusicSreen.id: (context) => MusicSreen(),
        PartySreen.id: (context) => PartySreen(),
        PhotoSreen.id: (context) => PhotoSreen(),
        ReadSreen.id: (context) => ReadSreen(),
        SingSreen.id: (context) => SingSreen(),
        SportSreen.id: (context) => SportSreen(),
        CourseSreenDetails.id: (context) => CourseSreenDetails(),
        ArtSreen.id: (context) => ArtSreen(),
        BusinessSreen.id: (context) => BusinessSreen(),
        EducationSreen.id: (context) => EducationSreen(),
        LawSreen.id: (context) => LawSreen(),
        EngineSreen.id: (context) => EngineSreen(),
        MedicineSreen.id: (context) => MedicineSreen(),
        ScienceSreen.id: (context) => ScienceSreen(),
        SocialScienceSreen.id: (context) => SocialScienceSreen()
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.userChanges(),
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
