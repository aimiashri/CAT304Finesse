import 'package:final_finesse/00_WelcomeScreen.dart';
// import 'package:final_finesse/01_loginScreen.dart';
// import 'package:final_finesse/10_home_screen.dart';
// import 'package:final_finesse/11_activityLog.dart';
// import 'package:final_finesse/ViewVouchers.dart';
// import 'package:final_finesse/navigation_menu.dart';
// import 'package:final_finesse/redeemPoints.dart';
import 'package:final_finesse/00_WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
// import 'package:final_finesse/video_info.dart';
// import 'package:video_player/video_player.dart';
// import '00_WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: ('Poppins'),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}
