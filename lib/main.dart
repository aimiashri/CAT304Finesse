import 'package:final_finesse/10_pre_home_screen.dart';

import '00_WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: ('Poppins'),
        useMaterial3: true,
      ),
      home: preHomeScreen(),
    );
  }
}