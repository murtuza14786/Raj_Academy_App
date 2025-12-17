import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Your existing imports
import 'package:raj_academy/Screen12.dart';
import 'package:raj_academy/Screen6.dart';
import 'package:raj_academy/Screen4.dart';
import 'package:raj_academy/Screen8.dart';

import 'Screen1.dart';
import 'Screen13.dart';
import 'Screen14.dart';
import 'Screen2.dart';
import 'Screen3.dart';
import 'Screen5.dart';
import 'Screen7.dart';
import 'Screen9.dart';

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
