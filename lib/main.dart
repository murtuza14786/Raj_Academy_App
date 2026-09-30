import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Your existing imports
import 'package:raj_academy/screen_12.dart';
import 'package:raj_academy/screen_6.dart';
import 'package:raj_academy/screen_4.dart';
import 'package:raj_academy/screen_8.dart';

import 'screen_1.dart';
import 'screen_13.dart';
import 'screen_14.dart';
import 'screen_2.dart';
import 'screen_3.dart';
import 'screen_5.dart';
import 'screen_7.dart';
import 'screen_9.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SFProText',
      ),
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SplashScreen(),
      routes: {
        '/loginpage': (context) => loginPage(),
        '/HomePage': (context) => HomePage(),
        '/AddInquiry': (context) => AddInquiry(),
        '/newAdmission': (context) => newAdmission(),
        '/profile': (context) => profile(),
        '/InquiriesPage': (context) => InquiriesPage(),
        '/ActiveStudent': (context) => ActiveStudent(),
        '/newCollection': (context) => newCollection(),
        '/StudentDetails': (context) => StudentDetails(),
        '/oldCollection': (context) => oldCollection(),
        '/certificateRequest': (context) => certificateRequest(),
      },
    );
  }
}
