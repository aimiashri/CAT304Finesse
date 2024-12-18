import 'package:final_finesse/view/login/on_boarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finesse CAT304',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins, LeagueSpartan",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: false,
      ),
      home: const OnboardingView(),
    );
  }
}


